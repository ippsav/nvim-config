local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
    },
})

vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
vim.keymap.set("v", "<leader>f", function() vim.lsp.buf.format() end)
