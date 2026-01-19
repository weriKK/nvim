local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Customize mini.starter (add Edit config option)
local starter = require("mini.starter")
local custom_builtin_actions = function()
    return {
        { name = 'New file', action = 'enew', section = 'Builtin actions' },
	    { name = 'Edit config', action = function() vim.cmd('edit ' .. vim.env.MYVIMRC) end, section = 'Builtin actions' },
    	{ name = 'Quit', action = 'qall', section = 'Builtin actions' },
    }
end
starter.setup({
    items = {
        function()
            if  starter.MiniSessions == nil then return {} end
            return starter.sections.sessions(5, true)()
        end,
        starter.sections.recent_files(5, false, false),
        custom_builtin_actions(),
    }
})

require("mini.statusline").setup()
require("mini.completion").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require("mini.pairs").setup()
--require("mini.starter").setup()
require("mini.align").setup()
