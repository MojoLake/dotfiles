return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme gruvbox-material]])  
        vim.g.gruvbox_material_background = "hard"
    end,
}
