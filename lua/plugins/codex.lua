return {
  {
    "johnseth97/codex.nvim",
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>ac",
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex (AI)",
        mode = { "n", "t" },
      },
    },
    opts = {
      keymaps = {
        toggle = nil, -- keep LazyVim mapping above as the single toggle binding
        quit = "<C-q>",
      },
      border = "rounded",
      width = 0.85,
      height = 0.85,
      model = nil, -- set to your preferred Codex model string
      autoinstall = true, -- auto-install codex CLI if missing
      panel = false, -- set true to open in a side panel split
      use_buffer = false, -- capture stdout in a normal buffer instead of a terminal
    },
  },
}
