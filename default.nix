{ pkgs, lib, neovim-unwrapped ? pkgs.neovim-unwrapped }:
let
  extraPackages = with pkgs; [
    # specific language servers
    bash-language-server
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint lsp extracted from vscode
    dockerfile-language-server
    emmet-language-server
    lua-language-server
    pyright
    # pkgs.stylelint-lsp
    typescript-language-server
    vue-language-server
    yaml-language-server
    nil

    # telescope packages
    ripgrep
  ];
  
  vimPlugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    neo-tree-nvim
    bufferline-nvim
    snacks-nvim
    telescope-nvim
    trouble-nvim
    cord-nvim
    catppuccin-nvim
    indent-blankline-nvim
    lualine-nvim
    blink-cmp
    nvim-treesitter-context
    todo-comments-nvim
  ];
in
pkgs.wrapNeovimUnstable neovim-unwrapped {
  viAlias = true;
  vimAlias = true;

  # lua code to put into the generated init.lua file
  luaRcContent = lib.fileContents ./config/init.lua;

  # add connections to nvim needed packages 
  wrapperArgs = [ "--prefix" "PATH" ":" (lib.makeBinPath extraPackages) ];

  plugins = [
    # install our own configuration as a plugin
    (pkgs.vimUtils.buildVimPlugin {
      name = "sylveon-config";
      src = ./config;
      doCheck = false;
    })
  ] ++ vimPlugins;
}
