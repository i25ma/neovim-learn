local status, bufferline = pcall(require, "bufferline")

if not status then 
        vim.notify("没有找到 bufferline")
    return 
end


-- bufferline 配置
bufferline.setup({

    options = {
        -- 关闭tab 的命令， 这里使用moll/vim-bbye 的 Bdelete 命令
        close_command = 'Bdelete %d',
        right_mouse_command = "Bdelete! %d",

        -- 侧边栏配置
        -- 左侧让出nvim-tree 的位置，显示文字 File Explorer

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- 使用nvim 内置lsp 后续配置课程
        diagnostics = "nvim_lsp",
        -- 可选 显示LSP 报错图标

        diagnostics_indicator = function(count, level, diagnostics_dict, content)
            local s = " "
            for e, n in pairs(diagnostics_dict) do 
                local sym = e == "error" and " " or (e == "warning" and " " or " ") 
                s = s .. n .. sym
                
            end 
            return s
        end,
    },
})