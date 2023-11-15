local toggleterm = require("toggleterm");

toggleterm.setup({
  size = 80,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  direction = "vertical",
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")


-- checking if the project/file I am on is a rust file

function runCargoCommand(command, ...)
  local term = require("toggleterm.terminal").Terminal
  local args = {...}
  local secondary_args = ""
  if #args > 0 then
    secondary_args = " " .. table.concat(args, " ")
  end
  local cmd = "cargo " .. command .. secondary_args

  local cargo_command = term:new({
    open_mapping = [[<c-\>]],
    size = 80,
    name = "cargo_command",
    cmd = cmd,
    direction = "vertical",
    close_on_exit = false,
    terminal_mappings = true,
  })
  cargo_command:toggle()
end

vim.keymap.set("n", "<leader>cc", function() runCargoCommand("check") end)
vim.keymap.set("n", "<leader>cb", function() runCargoCommand("build", "--release") end)
vim.keymap.set("n", "<leader>cr", function() runCargoCommand("run", "--release") end)
vim.keymap.set("n", "<leader>ct", function() runCargoCommand("test") end)




