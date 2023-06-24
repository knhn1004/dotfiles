-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- fix clangd w/ copilot conflict utf-16
local HOME = os.getenv("HOME")
require("lspconfig").clangd.setup({
  cmd = { HOME .. "/.local/share/nvim/mason/bin/clangd", "--offset-encoding=utf-16" },
})
require("notify").setup({
  background_colour = "#00000000",
})

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
-- vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.api.nvim_set_keymap(
  "n",
  "<leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

require("dapui").setup()
require("nvim-dap-virtual-text").setup({
  all_frames = true,
  highlight_changed_variables = true,
  show_stop_reason = true,
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- cpp dap

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/lib/llvm-14/bin/lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb",
  adapterTimeout = 5000, -- Increase the timeout to 5 seconds
}
local function compile_and_get_executable_path()
  local filetype = vim.bo.filetype
  local filepath = vim.fn.expand("%:p:h") .. "/"
  local executable

  if filetype == "c" then
    local input = vim.fn.expand("%:t")
    executable = filepath .. "a.out"
    vim.fn.system("gcc -g " .. input .. " -o " .. executable)
  elseif filetype == "cpp" then
    local input = vim.fn.expand("%:t")
    executable = filepath .. "a.out"
    vim.fn.system("g++ -g " .. input .. " -o " .. executable)
  elseif filetype == "rust" then -- TODO: this is not working for now
    vim.fn.system("cargo build --bin " .. vim.fn.expand("%:t:r"))
    executable = filepath .. "target/debug/" .. vim.fn.expand("%:t:r")
  elseif filetype == "java" then
    vim.fn.system("javac -g" .. vim.fn.expand("%:t"))
    local classname = vim.fn.expand("%:t:r")
    executable = filepath .. classname .. ".class"
  else
    print("Unsupported filetype")
    return
  end

  return executable
end

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    --[[ program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end, ]]
    program = compile_and_get_executable_path,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- java dap
-- TODO: add java dap configurations

--[[ dap.configurations.java = {
  {
    type = "java",
    name = "Debug (Launch)",
    request = "launch",
    mainClass = "com.example.Main",
    -- You can also specify other configurations like projectName, vmArgs, etc.
  },
}

dap.adapters.java = {
  type = "executable",
  command = "java",
  args = {
    "-jar",
    HOME .. "/vscode-java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
  },
} ]]

dap.configurations.java = dap.configurations.cpp
