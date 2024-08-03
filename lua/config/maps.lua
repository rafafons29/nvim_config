-- Definiendo mapleader
vim.g.mapleader = ' '

_G.keymap = vim.keymap

function _G.cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

keymap.set('i', 'jj', '<ESC>', { desc = "Go to normal mode" })
keymap.set('n', '<leader>w', cmd 'write', { desc = 'Save' })
keymap.set('n', '<leader>q', cmd 'quit', { desc = 'Leave' })
keymap.set('n', '<leader><S-q>', cmd 'bufdo bd|qa', { noremap = true, desc = "Close all buffers" })
keymap.set({ 'n', 'x' }, 'cp', '"+y', { desc = "Copy select text" })
keymap.set({ 'n', 'x' }, 'cv', '"+p', { desc = "Past the copy text" })
keymap.set({ 'n', 'x' }, 'x', '"_x', { desc = "Cut select text" })
keymap.set('n', '<leader>a', cmd 'keepjumps normal! ggVG', { desc = "Select all" })
keymap.set('n', '<leader>j', '*``cgn', { desc = "Delete word, and search it" })
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', 'ss', cmd 'split<Return><C-w>w', { desc = "Split horizontal window" })
keymap.set('n', 'sv', cmd 'vsplit<Return><C-w>w', { desc = "Split vertical window" })

-- Move window
keymap.set('n', '<leader>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h', { desc = "Move cursor to left window" })
keymap.set('', 'sk', '<C-w>k', { desc = "Move cursor to up window" })
keymap.set('', 'sj', '<C-w>j', { desc = "Move cursor to down window" })
keymap.set('', 'sl', '<C-w>l', { desc = "Move cursor to right window" })

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', { desc = "Resize window left" })
keymap.set('n', '<C-w><right>', '<C-w>>', { desc = "Resize window right" })
keymap.set('n', '<C-w><up>', '<C-w>+', { desc = "Resize window up" })
keymap.set('n', '<C-w><down>', '<C-w>-', { desc = "Resize window down" })

keymap.set('v', '>', '>gv', { desc = 'after tab in re-select the same' })
keymap.set('v', '<', '<gv', { desc = 'after tab out re-select the same' })

keymap.set('n', 'n', 'nzzzv', { desc = 'Goes to the next result on the search and put the cursor in the middle' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Goes to the prev result on the search and put the cursor in the middle' })

-- Jump between markdown headers
keymap.set("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
keymap.set("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Dismiss Noice Message
keymap.set('n', '<leader>nd', cmd 'NoiceDismiss', { desc = 'Dismiss Noice Message' })

-- Anotations
keymap.set('n', 'gvv', cmd 'ComAnnotation', { noremap = true, silent = true })


keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
keymap.set('n', '<C-w>>', cmd 'WindowsMaximizeVertically')
keymap.set('n', '<C-w>^', cmd 'WindowsMaximizeHorizontally')
keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

keymap.set('n', 'ff', cmd 'FZF', { desc = "Search and open files using fzf" })
keymap.set('n', 'fzf', cmd 'FZF!', { desc = "Search and open files using fzf" })

keymap.set('n', '<leader>dr', function() require("dap").continue() end, { noremap = true, silent = true })
keymap.set('n', '<leader>dq', function() require("dap").close() end, { noremap = true, silent = true })
keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { noremap = true, silent = true })
