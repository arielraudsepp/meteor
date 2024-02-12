{
  description = "A Nix-flake-based Elixir development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        erlangVersion = "erlang_25";
        # Set the Elixir version
        elixirVersion = "elixir_1_14";

        erlang = pkgs.beam.interpreters.${erlangVersion}.override {
          configureFlags = ["--disable-jit"];
        };
        beamPackages = pkgs.beam.packages.${erlangVersion};
        elixir = beamPackages.${elixirVersion};

      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            erlang
            beamPackages.elixir-ls
            elixir
            pkgs.postgresql_16
          ];
        };
      }
    );
}
