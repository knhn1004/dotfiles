return {
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
      },
    },
    keys = {
      { "<C-A-n>", "<cmd>RunCode<cr>", "Run Code" },
    },
  },
}
