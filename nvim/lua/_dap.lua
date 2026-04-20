local dap = require("dap")
dap.adapters.php = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/debug/vscode-php-debug/out-from-vsix/phpDebug.js"},
}
dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug: JBC",
        port = 9003,
        -- hostName = "dev.service.jobcan-inv.jp",
        hostName = "localhost",
        pathMappings = {
            ['/mnt/bizcloud'] = "${workspaceFolder}"
        },
        xdebugSettings = {
            max_data = 1024,
            max_children = 128,
            max_depth = 5
        }
    },
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug: MITSUMOL",
        port = 9003,
        host = "dev-service.mitsumol.jp",
        pathMappings = {
            ['/mnt/bizcloud'] = "${workspaceFolder}"
        },
        xdebugSettings = {
            max_data = 1024,
            max_children = 128,
            max_depth = 5
        }
    },
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv("HOME") .. "/debug/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/home/linuxbrew/.linuxbrew/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dap.configurations.c = dap.configurations.cpp

vim.keymap.set('n', '<F5>', function() dap.continue() end, {silent = true})
vim.keymap.set('n', '<F10>', function() dap.step_over() end, {silent = true})
vim.keymap.set('n', '<F11>', function() dap.step_into() end, {silent = true})
vim.keymap.set('n', '<F12>', function() dap.step_out() end, {silent = true})
vim.keymap.set('n', '5', function() dap.continue() end, {silent = true})
vim.keymap.set('n', '6', function() dap.step_over() end, {silent = true})
vim.keymap.set('n', '7', function() dap.step_into() end, {silent = true})
vim.keymap.set('n', '8', function() dap.step_out() end, {silent = true})
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, {silent = true})
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end, {silent = true})
vim.keymap.set('n', '<Leader>l', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {silent = true})
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, {silent = true})
