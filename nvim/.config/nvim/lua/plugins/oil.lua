return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup {
            default_file_explorer = true,
            columns = {
                "icon",
            },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                ["gs"] = "actions.change_sort",
                ["gx"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            watch_for_changes = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            float = {
                padding = 5,
                border = "rounded",
            }
        }

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
