return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      local function set_scheme(style)
        if style == "day" then
          vim.o.background = "light"
          vim.cmd.colorscheme("tokyonight-day")
        else
          vim.o.background = "dark"
          vim.cmd.colorscheme("tokyonight-storm")
        end
      end
      set_scheme("storm")

      vim.g._tokyonight_toggle = function()
        if vim.g.colors_name == "tokyonight-day" then
          set_scheme("storm")
        else
          set_scheme("day")
        end
      end

      vim.keymap.set("n", "<leader>tt", function()
        vim.g._tokyonight_toggle()
      end, { desc = "Toggle Tokyonight day/storm" })
    end,
  },
}
