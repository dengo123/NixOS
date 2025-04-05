{ config, lib, pkgs, userSettings, ... }:

{
  programs.thunderbird = {
    enable = true;

    profiles = {
      "${userSettings.name}" = {
        isDefault = true;
        settings = {
          "mail.identity.id1.fullName" = userSettings.name;
          "mail.identity.id1.useremail" = userSettings.email;
          "mail.account.account1.identities" = "id1";
          "mail.account.account1.server" = "server1";
          "mail.accountmanager.accounts" = "account1";
          "mail.accountmanager.defaultaccount" = "account1";
          "mail.accountmanager.localfoldersserver" = "server2";
        };
      };
    };
  };
}

