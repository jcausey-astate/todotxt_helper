# todo.txt Helper

This project contains a profile script add-on and some configuration files to make the [CLI version of Todo.txt](https://github.com/todotxt/todo.txt-cli) more flexible. 

## Why?

Specifically, I wanted to allow the following features:

* Per-directory todo lists, so that I can keep feature and bug tracking in my various project directories.
* But keep the global todo list (this is what Todo.txt already wants to do).
* Add a concept of "bug" tracking using a separate list, not just "contexts".
* Cleaner naming:  I wanted the "todo" list visible, but the "done" and "report" files hidden (prepended with a dot).  This is a simple configuration option, but I'm providing example config files with that change in place.

## How?

Todo.txt allows you to supply the `-d` option to choose a different configuration file.  Essentially, the `todo_txt_helper.sh` script just automates this so that a different configuration is used for the "global", "local", and "bug" tracking.  These configurations reside in your `~/.todo/` directory alongside the default one.

## Installing

First, you need to install the Todo.txt CLI if you haven't already.  See [https://github.com/todotxt/todo.txt-cli](https://github.com/todotxt/todo.txt-cli).

To use this project, just move the `todo_txt_helper.sh` script somewhere convenient (or even rename it to `.todo_txt_helper.sh` and place it in your home directory if you like).  Then, edit your `.bashrc` or `.bash_profile` (or similar) to include something like the following:

```bash
# Add helper features for the `todo.txt` todo list utility.
TODO_TXT_HELPER="${HOME}/Dropbox/sync/profile_scripts/todo_txt_helper.sh"
[ -f "${TODO_TXT_HELPER}" ] && source "${TODO_TXT_HELPER}"
```

Of course, you will need to edit the path in `TODO_TXT_HELPER` to match wherever you saved the `todo_txt_helper.sh` script.

## Configuration files

The "local" and "bug" features require that you have additional configuration files in your `~/.todo/` directory.  I have provided examples with reasonable defaults in the `config` directory of this project.  Feel free to use those and customize as you see fit.  

I assume you already have the default `config` file there, but if not, you can use that one as well.  If you do, you will probably need to edit the value of `TODO_DIR` to point to the directory where you want to save your global `todo.txt` file, and perhaps the naming conventions as well.

## A Caveat

As of version 2.11.0 of Todo.txt CLI, if you are using a different config file than the one in `~/.todo/`, the settings there will override the custom changes made by this script.  You may want to move your alternative config file into the `~/.todo/` directory and name it `config`.  Then, everything should work.

## License
The `todo_txt_helper.sh` script is released under the MIT license (see below).  

The configuration files in the `config` directory are modified versions of the ones from the Todo.txt project, and as such they are covered under the same GNU General Public License v3.0 [todo.txt org](https://github.com/todotxt) as Todo.txt.

### MIT License

Copyright 2019 Jason L Causey

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
