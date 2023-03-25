--[[ function run_code_and_debug_cpp()
  local filetype = vim.bo.filetype
  local is_cpp = filetype == "cpp"

  if is_cpp then
    vim.cmd("vnew | wincmd L")
    vim.cmd("30 wincmd |")
  end

  if not vim.bo.modified then
    vim.cmd("write")
  end

  vim.cmd("RunCode")
end ]]

return {
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ -g -std=c++17 -Wall -Wextra -Wpedantic -O2 -fsanitize=address -fsanitize=undefined -DLOCAL $fileName && ASAN_OPTIONS=detect_leaks=1 ./a.out",
      },
    },
    keys = {
      { "<C-A-n>", ":w<bar>RunCode<cr>", "Save & Run Code" },
      -- { "<C-A-n>", "<cmd>lua run_code_and_debug_cpp()<cr>", "Run Code" },
    },
  },
}
