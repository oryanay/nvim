return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup({
        component_separators = { left = "", right = "" }, 
        section_separators = { left = "", right = "" },
      }) 
    end,
}
