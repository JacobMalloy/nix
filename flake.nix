{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:Nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable, ... } @ inputs: 
    let 
        mkPkgs = systemArch: {
            stable = import nixpkgs{
                system = systemArch;
                config.allowUnfree = true;
            };
            unstable = import unstable{
                system = systemArch;
                config.allowUnfree = true;
            };
        };

in
{
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./machines/desktop.nix
      ];
    };
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
specialArgs={
        pkgs = (mkPkgs "aarch64-linux").stable;
        pkgs-unstable = (mkPkgs "aarch64-linux").unstable;
        inputs = inputs;
};
      modules = [
        ./machines/vm.nix
      ];
    };
    nixosConfigurations.rpi = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        ./machines/rpi.nix
      ];
    };
  };

}
