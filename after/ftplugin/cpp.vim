if exists("b:did_ftplugin") && b:did_ftplugin == 2
  finish
endif
let b:did_ftplugin = 2

setlocal comments+=://
setlocal commentstring=//\ %s
