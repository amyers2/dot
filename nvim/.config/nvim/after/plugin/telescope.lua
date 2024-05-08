local builtin = require('telescope.builtin')

require('telescope').setup{
   defaults = {
      -- configure to use ripgrep
      vimgrep_arguments = {
         "rg",
         "--follow",       -- follow symbolic links
         "--hidden",       -- search for hidden files
         "--line-number",  -- show line numbers
         "--smart-case",   -- smart case search

         -- Exclude some patterns from search
         "--glob=!**/.git/*",
         "--glob=!**/.idea/*",
         "--glob=!**/.vscode/*",
         "--glob=!**/build/*",
      },
   },
   pickers = {
      find_files = {
         hidden = true,
         -- needed to exclude some files & dirs from general search
         -- when not included or specified in .gitignore
         find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
         },
      },
   }, 
}

-- This allows us to have a "git files search", and an "all files search".
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
