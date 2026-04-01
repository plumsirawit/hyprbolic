{
  lib,
  hyprland,
  hyprlandPlugins,
}:
hyprlandPlugins.mkHyprlandPlugin {
  pluginName = "hyprbolic";
  version = "0.1";
  src = ./.;

  inherit (hyprland) nativeBuildInputs;

  meta = with lib; {
    homepage = "https://github.com/plumsirawit/hyprbolic";
    description = "Hyprland workspaces hyperbolic overview plugin";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
