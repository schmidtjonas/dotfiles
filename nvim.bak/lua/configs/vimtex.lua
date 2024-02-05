local o = vim.o
local global = vim.g

vim.scriptencoding = "utf-8"

-- o.conceallevel = 1
global.vimtex_view_method = "skim"
global.vimtex_quickfix_enabled = 1
global.vimtex_compiler_progname = "nvr"
global.vimtex_quickfix_open_on_warning = 0
global.vimtex_quickfix_autoclose_after_keystrokes = 20
