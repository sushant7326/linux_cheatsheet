# vim: set nomodeline:

## basics


exit vim: `:q`

insert mode: `i`  
insert mode (new line): `i`  
enter normal mode: `escape key`

set nomodeline: put this at the top of the file `# vim: set nomodeline:`

open/close terminal: `alt+v`

## navigation

navigation: `arrow keys`  
jump to next/previous words: `ctrl + arrow keys`

navigate to the start of the file: `gg`  
navigate to the end of the file: `G (shift + g)`

page up/down: work as intended

## saving

save: `:w`  
save and exit: `:x`  
exit without saving: `:q!`

## editing (in normal mode)

delete a line: `dd`

undo: `u`  
redo: `ctrl + r`

character-wise text selection: `v`  
line-wise text selection: `V`  
block-wise text selection: `ctrl + v`  
text selection: `<key> + arrow keys`

copy (yank): `y`  
cut (delete+yank): `d`  
paste (put): `p`

search: `/\<keyword>`  
next occurence: `n`  
replace all occurences: `:%s/\<old_keyword>/\<new_keyword>/g`
