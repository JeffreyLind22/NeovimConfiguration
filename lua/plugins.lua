-- Abstract: Set up lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa-wave") 
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "cpp", "lua", "vim", "vimdoc", "query" },
                auto_install = true;
                highlight = { enable = true }
            })
        end,
    }
})
