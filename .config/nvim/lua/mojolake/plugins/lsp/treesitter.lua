return {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        require("nvim-ts-autotag").setup({
          ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "lua" },
          highlight = { enable = true },
          indent = { enable = true },
          autotag = { enable = true }, -- Enables auto-closing tags (if you install nvim-ts-autotag)
        })
      end,
--     nvim-ts-auto
-- tag').setup()
}
