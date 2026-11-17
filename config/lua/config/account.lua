local M = {}

function M.is_blmedia()
    return vim.env.NVIM_PROFILE == "blmedia"
end

return M