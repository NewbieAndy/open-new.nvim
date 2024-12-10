local M = {}

function M.open()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  -- 获取当前窗口大小
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  -- 计算输入框的大小和位置
  local win_width = math.ceil(width * 0.5)
  local win_height = 1
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- 创建一个浮动窗口
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = 'minimal'
  })

  -- 设置输入框的键盘映射
  vim.api.nvim_buf_set_keymap(buf, 'i', '<Tab>', ':lua require("open-new.completion").complete()<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', ':lua require("open-new.file_list").open(vim.fn.getline("."))<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_option(buf, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(buf, 'Path: ')
  vim.cmd('startinsert')
end

return M
