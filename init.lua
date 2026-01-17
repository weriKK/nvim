-- Setup plugins
require('myplugins')

-- Theme
vim.cmd.colorscheme("retrobox")

-- Basic settings
vim.opt.number = true				                        -- Line numbers
vim.opt.relativenumber = false			                    -- Relative line numbers
vim.opt.cursorline = true                                   -- Highlight current line
vim.opt.wrap = false                                        -- Wrap lines
vim.opt.scrolloff = 10                                      -- Keep X lines above/below cursor
vim.opt.sidescrolloff = 0                                   -- Keep X columns left/right of cursor

-- Indentation
vim.opt.tabstop = 4                                         -- How many columns a tab key takes up
vim.opt.shiftwidth = 4                                      -- How many columns an indentation takes up
vim.opt.softtabstop = 4                                     -- How many columns a tab key moves in insert mode
vim.opt.expandtab = true                                    -- Use spaces instead of tabs characters
vim.opt.smartindent = true                                  -- Indentation takes syntax/style into account
vim.opt.autoindent = true                                   -- Indentation of newly created line will match current line

-- Search settings
vim.opt.ignorecase = true                                   -- Case insensitive search
vim.opt.smartcase = true                                    -- Case sensitive search if using uppercase
vim.opt.hlsearch = true                                     -- Highlight search results
vim.opt.incsearch = true                                    -- Show matches as you type
vim.keymap.set("n", ",/", ":nohlsearch<CR>", {silent=true, desc = "Clear search highlight"}) 

-- Visual settings
vim.opt.termguicolors = true                                -- 24-bit colors
vim.opt.signcolumn = "auto"                                 -- Show sign column on the left only when there is something to show, also known as "gutter"
--vim.opt.colorcolumn = "120"                               -- Show visual guide for line length
vim.opt.showmatch = true                                    -- Highlight matching parentheses
vim.opt.matchtime = 5                                       -- How long to show matching parentheses (1/10 seconds)
vim.opt.cmdheight = 1                                       -- Command line height (bottom bar)
vim.opt.completeopt = "menuone,noinsert,noselect"           -- Insert mode completion options
vim.opt.showmode = false                                    -- Hide mode in command line (we will use a statusline addon)

-- File handling
vim.opt.backup = false                                      -- Don't create backup files
vim.opt.writebackup = false                                 -- Don't create backup before writing
vim.opt.swapfile = false                                    -- Don't create swap files
vim.opt.undofile = true                                     -- Create undo files for persisent undo between sessions
vim.opt.undodir = vim.fn.stdpath('config') .. "\\undodir"   -- Undo directory
vim.opt.autoread = true                                     -- Automatically reload files changes outside of nvim
vim.opt.autowrite = true                                    -- Auto save

-- Behavior settings
vim.opt.hidden = true                                       -- Allow hidden buffers
vim.opt.errorbells = true                                   -- Allow error bell sounds
--vim.opt.visualbell = true                                   -- Allow visual bell
vim.opt.backspace = "indent,eol,start"                      -- Better backspace behavior
vim.opt.mouse = "a"                                         -- Enable mouse support
vim.opt.selection = "exclusive"                             -- In Visual and Select mode, cursor can be positioned one character past the line
vim.opt.clipboard:append("unnamedplus")                     -- Use system clipboard instead of nvim's own
vim.opt.modifiable = true                                   -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                                  -- Set encoding to UTF-8

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
