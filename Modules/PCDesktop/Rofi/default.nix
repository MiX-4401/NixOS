{ pkgs, ... }:

let
  rofiTheme = pkgs.writeText "rofi-theme.rasi" ''
    * {
        font: "Roboto 12";

        margin: 0;
        padding: 0;
        spacing: 0;
    }

    window {
        location: north;
        y-offset: calc(50% - 176px);
        width: 480;
        border-radius: 24px;
    }

    mainbox {
        padding: 12px;
    }

    inputbar {
        border: 2px;
        border-radius: 16px;

        padding: 8px 16px;
        spacing: 8px;
        children: [ prompt entry ];
    }

    entry {
        placeholder: "Search";
    }

    message {
        margin: 12px 0 0;
        border-radius: 16px;
    }

    textbox {
        padding: 8px 24px;
    }

    listview {
        margin: 12px 0 0;
        lines: 8;
        columns: 1;
        fixed-height: false;
    }

    element {
        padding: 8px 16px;
        spacing: 8px;
        border-radius: 16px;
    }

    element-text {
        text-color: inherit;
    }

    element-icon {
        size: 1;
        vertical-align: 0.5;
    }
  '';
in
{
  programs.rofi = {
    enable = true;
    theme = rofiTheme;
  };
}