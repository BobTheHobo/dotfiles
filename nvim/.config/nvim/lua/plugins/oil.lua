function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup {
            -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
            -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
            default_file_explorer = true,

            -- Id is automatically added at the beginning, and name at the end
            -- See :help oil-columns
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },

             -- Buffer-local options to use for oil buffers
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },

            -- Window-local options to use for oil buffers
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
                winbar = "%!v:lua.get_oil_winbar()",
            },

            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = true,

            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,

            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,

            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<leader>|"] = { "actions.select", opts = { vertical = true } },
                ["<leader>-"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
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
                ["<leader>ff"] = {
                    function()
                        require("telescope.builtin").find_files({
                            cwd = require("oil").get_current_dir()
                        })
                    end,
                    mode = "n",
                    nowait = true,
                    desc = "Find files in the current directory"
                },
            },

            -- Set to false to disable default keymaps
            use_default_keymaps = false,

            -- Set to true to watch the filesystem for changes and reload oil
            watch_for_changes = true,

            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,

                -- Sort file names with numbers in a more intuitive order for humans.
                -- Can be "fast", true, or false. "fast" will turn it off for large directories.
                natural_order = "fast",

                -- Sort file and directory names case insensitive
                case_insensitive = false,

                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                    { "size", "asc" },
                    { "mtime", "asc" },
                    { "ctime", "asc" },
                    { "atime", "asc" },
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
