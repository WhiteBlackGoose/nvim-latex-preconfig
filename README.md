# Neovim minimal LaTeX configuration

<img align=center src="https://user-images.githubusercontent.com/31178401/222340202-f5d1e401-0664-4947-a120-d275b5462004.gif" />

## Requirements

- `nvim`
- `zathura` (or another PDF viewer)
- `texlab`
- `latexmk`

## Installation

1. Fork this repo*
2. Clone the (forked) repo into `~/.config/nvim` (Linux/Mac) or `~/AppData/Local/nvim/` for (Windows)
3. Run nvim

\* - recommended if you plan to modify the configuration and pull my updates.

## Features

- 📝 Automatically opens PDF viewer 
- 🖊️ Syntax highlighting
- 🏎 LaTeX autocompletion with TeXLab (press Ctrl+Space)
- ⚠️  Errors and warnings displayed
- 📜 Folding of sections/blocks

## How to use

You need to learn the basic keybindings first (open `nvim` and type `:Tutor` and hit enter).

To edit LaTeX:

- Open your `.tex` document: `nvim doc.tex` or open neovim and type `:e doc.tex`
- To trigger auto complete, press Ctrl+Space
- To apply a suggestion, press Enter
- To choose a suggestion, press Tab or Shift+Tab
- To collapse or expand current block, press Space+j and Space+k

I also encourage reading [VimTeX](https://www.ejmastnak.com/tutorials/vim-latex/vimtex/#doing-stuff) documentation for advancing in editing.
