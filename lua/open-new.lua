local default_config = require("open-new.config")
local ui = require("open-new.ui")
local completion = require("open-new.completion")

local M = {}

function M.ui(options)
  ui.open()
end

---@Param options nvim-filetype.config
function M.setup(options)
	options = vim.tbl_deep_extend("force", default_config, options or {})
	vim.api.nvim_create_user_command("OpenFile", function()
		M.ui(options)
	end, {})
end
return M
