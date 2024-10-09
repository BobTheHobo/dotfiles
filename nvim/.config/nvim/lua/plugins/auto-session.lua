return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        log_level = 'error',
        enabled = true,
        auto_save = true,
        auto_restore = true,
        auto_create = true,
        use_git_branch = true,
    },
    config = function()
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end
}
