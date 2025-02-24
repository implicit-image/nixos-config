{
  description = "NixOS WSL configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-unstable";

      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, nixos-wsl, home-manager, ... }: {
    nixosConfigurations = {
      nixos =
        let
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users = {
                b = import ./b.nix;
              };
            }
          ];
        in
          nixpkgs.lib.nixosSystem { inherit system modules; };
    };
  };
}
