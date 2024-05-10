require("judge")

local o = vim.o
local wo = vim.wo

-- Set whitespace rules
o.expandtab = true      -- expand tab input with space characters
o.smartindent = true    -- syntax aware indentations for newline inserts
o.tabstop = 3           -- number of space chars per tab
o.shiftwidth = 3        -- spaces per indentation level

-- Enable cursor line highlightnvim
o.cursorline = true

-- Enable line numbers
wo.relativenumber = true  -- enable relative line numbers
wo.number = true          -- also display the current line number
