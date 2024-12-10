local M ={}

function M.complete()
  local input = vim.fn.getline('.')
  local dir = input == '' and '.' or input
  local items = vim.fn.globpath(dir, '*', false, true)
  vim.fn.complete(1, items)
end

return M
