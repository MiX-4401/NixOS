{ ... }:

{
  programs.rofi = {
    enable = true;

    theme = {
      "*" = {
        font = "Roboto 12";

        margin = 0;
        padding = 0;
        spacing = 0;
      };

      window = {
        location = "north";
        y-offset = "calc(50% - 176px)";
        width = 480;
        border-radius = 24;
      };

      mainbox = {
        padding = 12;
      };

      inputbar = {
        border = 2;
        border-radius = 16;

        padding = "8px 16px";
        spacing = 8;

        children = [ "prompt" "entry" ];
      };

      entry = {
        placeholder = "Search";
      };

      message = {
        margin = "12px 0 0";
        border-radius = 16;
      };

      textbox = {
        padding = "8px 24px";
      };

      listview = {
        margin = "12px 0 0";
        lines = 8;
        columns = 1;
        fixed-height = false;
      };

      element = {
        padding = "8px 16px";
        spacing = 8;
        border-radius = 16;
      };

      element-icon = {
        size = 1;
        # vertical-align = 0.5;
      };

      element-text = {
        text-color = "inherit";
      };
    };
  };
}