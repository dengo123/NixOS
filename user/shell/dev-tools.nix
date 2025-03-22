{ pkgs, ... }:

{
	home.packages = with pkgs; [
		deadnix
		alejandra
		statix
		nodejs
		cargo
    pipx
		jq
    lua5_4
    gcc
	];
}
