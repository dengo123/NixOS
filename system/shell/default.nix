{ userSettings, ... }:

{
  imports = [
    ./${userSettings.shell}
  ];
}
