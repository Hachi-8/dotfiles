local notify = require'notify'
local tmp_output = "/tmp/command_ouptut.txt"
local spinner = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'}

function _start_spinner(notify_obj)
    local i = 1
    local timer = vim.loop.new_timer()
    timer:start(0, 4, vim.schedule_wrap(function()
      notify(nil, nil, {
        title = 'Spinner',
        icon = spinner[i],
        replace = notify_obj
      })
      i = i % #spinner + 1
    end))
    return timer
  end

function _stop_spinner(timer)
  timer:stop()
  timer:close()
end


function _jbc_inv_transpile()
  local notify_obj = notify.notify({"iiiiik", ";lajfea", "nbauihfl;aksdjf"}, 'success', {
    title = "Transpiling...",
    icon = spinner[1], -- Luaのインデックスは1から始まります
    timeout = false,
    hide_from_history = false
  })
  local timer = _start_spinner(notify_obj)

  -- コマンドを非同期的に実行
  local job_id = vim.fn.jobstart('~/projects/bizcloud-jbc-dev-env/source/bizcloud-jbc/server/o3/htdocs/typings/compile.sh', {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(job_id, data, event)
      vim.schedule(function()
        -- 標準出力の処理（必要なら）
        local output = vim.json.encode(data)
        local output_file = io.open(tmp_output, "w")
        if output_file then
          io.output(output_file)
          io.write(output)
        end
        io.close(output_file)
      end)
    end,
    on_stderr = function(job_id, data, event) end,
    on_exit = function(job_id, exit_code, event)
      vim.schedule(function()
      -- ジョブが終了したときの処理
      local output = "DEFAULT OUTPUT"
      local output_file = io.open(tmp_output, "r")
      if output_file then
        output = output_file:read("*a")
        output = vim.json.decode(output)
        output_file:close()
      end
      _stop_spinner(timer)
        if exit_code == 0 then
          notify.notify(output, 'success', {
            title = "Done",
            timeout = false,
            replace = notify_obj
          })
        else
          notify.notify(output, 'error', {
            title = "Error",
            timeout = false,
            replace = notify_obj
          }
          )
        end
      end)
    end,
  })
end


vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua _jbc_inv_transpile()<CR>', { noremap = true, silent = true })
