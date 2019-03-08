# Mastering vim

This section is about mastering the basics of vim and honing the core skills.

## Basic Movement (left-right-motions) (up-down-motions)

* `h, j, k, l` left, down, up, right
* `gm` go to the middle of the line

* `gg` go to the first line in the file
* `G` go to the last line
  + `{linenum}G` go to a partiuclar line number in a file
  + `:{linenum}` similar to the command above
    - This command modifies the jump list

## Word motions (word-motions)

* `w/W` move forward a word
* `e/E` move forward to end of word
* `b/B` move backward to beginning of word
* `ge/gE` move backward to end of the word

* By default these commands work on word boundaries
  + A word is a sequence of letters, digits, and underscores
  + `:help text-objects`, `:help WORD`
* The capatalized versions of these commands move based on white spaces
* These motions also continue onto new lines

## Movement commands using wrapping

These commands are to enable the movement commands to use the same behaviour you would when the lines are not wrapped. This allows more predictable behavior when using wrapping, so that you can do movements on 'partial' lines.

* `g0` go to the first charac
* `g^` go to the first non-blank character of a line when softwraping
* `g$` go to the end of the line when softwraping
* `gj` move up a soft wrap line
* `gk` move down a soft wrap line

## Text object motions (object-motions)


## Insertion commands (inserting)

* `i` enter insert mode at cursor location
* `I` enter insert mode before the first non-blank character on a line
* `a` enter insert mode afte the cursor location
* `A` enter insert mode at the end of the line
* `o` create a new line below the cursor and enter insert mode
* `O` create a new line above the cursor and enter inset mode

## Other operators (operator)

* `~` swap case of a single character
* `g~` swap the case of a block which is selected by an operator
* `gu` make uppercase
* `gU` make lowercase

## Buffer Management (buffer-hidden)

Take a look at *CtrlP* to make full use of the buffer functionality.

* `:b[uffer] <file>` open the buffer that has the substring <file> in it
* `:bp[rev]` open the previous buffer
* `:bn[ext]` open the next buffer
* `:b#` open the previously opened buffer
* `:ls<cr>:b<space>` list current buffers and open a command to open one

## Window Management


## Tabs

* `gt` go to the next tab
* `gT` go to the previous tags

## Finding text

* `f{char}` search right
* `F{char}` search left
  + Find and place the cursor on the searched character

* `t{char}` search right
* `T{char}` search left
  + Find and place the cursor to the left of the searched character

* `;` Repeat the last `f, F, t, T` command
* `,` Repeat the last `f, F, t, T` command in the opposite direction

## Registers

* `:reg[isters]` view everything that is in the registers
* `"<reg><op>` perform <op>eration and save it into <reg>ister for later
  + `"<reg>p` paste this information from that register
* `<c-R><reg>` in insert mode paste the contents of <reg>ister into the buffer

## Marks

* `m`


## Other

* `<c-z>` put vim into the background to run shell commands
  + `$ fg` in the shell, bring vim back into the foreground
* `:sh` run a shell in the terminal to run commands
  + `$ exit` close the shell and retun to vim

# Improving Vim

This section is about extending and improving the core editing experience.

## Tags

Look at tag support for various languages.

## Plugins
* Syntastic
  - External plugin for compiliers and linters to show up in the program
* TextMate
  - Jump between files with fussy text search
* YouCompleteMe
  - Auto-completing
