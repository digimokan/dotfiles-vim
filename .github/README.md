# vimrc-omega

Carefully over-engineered `.vimrc` for simple edits or full IDE.

[![License](https://img.shields.io/badge/license-MIT-blue.svg?label=license)](LICENSE.txt "Project License")

## Table Of Contents

* [Motivation](#motivation)
* [Features](#features)
* [Vimrc Sections](#vimrc-sections)
* [Project Layout](#project-layout)
* [Dependencies](#dependencies)
* [Quick Start](#quick-start)
* [Usage](#usage)
* [Contributing](#contributing)

## Motivation

Make a versatile _Vim_ config for everyday use. Make it fast, simple, and
nice-looking for simple single-file edits. Make it robust, featureful, and
intuitive for living in projects (mostly C/C++).

## Features

* Organizes [.vimrc](../.vimrc) into well-commented sections.
* Strives to use simple, meaningful [keymaps](../.vim/doc/keymaps.txt) for all
  common tasks.
* Brings up well-organized [keymaps](../.vim/doc/keymaps.txt) chart with
  `<leader>-/`.
* Makes visual presentation of [installed plugins](../.vimrc#L15)
  obvious and useful.
* _Vim_ load time under 150 ms.

## Vimrc Sections

The `.vimrc` is organized into the following searchable sections. Plugins are
configured in the appropriate section:

* PLUGIN MANAGER
* VIM INIT
* LEADER KEY
* VIM CONFIG FILES
* TERMINAL BEHAVIOR
* AUTOREAD EVENTS
* VIM START SCREEN
* VIM SAVE STATES
* HELP
* MODE SWITCH
* NAVIGATION
* MARKS
* BUFFERS
* SPLITS
* QUICKFIX
* FILETYPES
* FONTS / COLORS
* CURSOR / LINE / COL HIGHLIGHTING
* LINE / CHAR DISPLAY
* CMD BAR
* STATUSLINE
* FILE BROWSER
* FILE FINDING / OPENING
* TEXT SEARCH / REPLACE
* EDITING
* SNIPPETS
* INDENTS / TABS
* COPY / PASTE
* UNDO / REDO
* CODE SYNTAX
* AUTOCOMPLETION
* VCS SUPPORT
* MISC KEYMAPS

## Project Layout

The _Vim_ configuration is contained in the `.vimrc` and in supporting files in
the `.vim` directory. Both are intended to be placed in the user's home
directory:

```
├─┬ vimrc-omega/
│ ├── .github/        # project readme, related github files
│ ├─┬ .vim/
│ │ ├── after/        # post-plugin-load config
│ │ ├── doc/          # keymaps
│ │ ├── ftplugin/     # config for specific file-types
│ │ ├── snippet/      # snippet templates for various file-types
│ │ └── undos/        # empty directory to hold per-file undo history
│ ├── .gitignore      # local ignores
│ └── .vimrc          # main vim config
```

## Dependencies

* a [truecolor](https://gist.github.com/XVilka/8346728) terminal
* python
* curl
* [fzf](https://github.com/junegunn/fzf)
* [ag (the silver searcher)](https://github.com/ggreer/the_silver_searcher) or
  [ripgrep](https://github.com/BurntSushi/ripgrep)
* npm and nodejs (for coc plugin)
* ctags
* clang
* [shellcheck](https://github.com/koalaman/shellcheck)
* [cmakelint](https://github.com/richq/cmake-lint)

## Quick Start

1. Clone project from github:

   ```shell
   $ git clone https://github.com/digimokan/vimrc-omega
   ```

2. Copy `.vimrc` and `.vim` directory into home directory:

   ```shell
   $ cp -r vimrc-omega/.vimrc vimrc-omega/.vim $HOME
   ```

3. _Vim_ is ready to use. You may remove the cloned `vimrc-omega` directory.
Plugins will be installed automatically when _Vim_ is run for the first time.

4. The default `<leader>` key is `SPACEBAR`. [Keymaps](../.vim/doc/keymaps.txt)
and associated plugin features can be viewed with `<leader>-/`.

## Usage

See [keymaps.txt](../.vim/doc/keymaps.txt) for keymaps and associated plugin
features.

## Contributing

* Feel free to report a bug or propose a feature by opening a new
  [Issue](https://github.com/digimokan/vimrc-omega/issues).
* Follow the project's [Contributing](CONTRIBUTING.md) guidelines.
* Respect the project's [Code Of Conduct](CODE_OF_CONDUCT.md).

