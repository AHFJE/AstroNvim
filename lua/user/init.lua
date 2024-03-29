--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
        -- Configure AstroNvim updates
        updater = {
                remote = 'origin', -- remote to use
                channel = 'stable', -- "stable" or "nightly"
                version = 'latest', -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = 'main', -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },
        -- Set colorscheme to use
        colorscheme = 'default_theme',
        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },


                -- set highlight group for any theme
                -- the key is the name of the colorscheme or init
                -- the init key will apply to all colorschemes
                -- apply highlight group to all colorschemes (include the default_theme)
                -- init = {
                --         -- set the transparency for all of these highlight groups
                --         Normal = { bg = "NONE", ctermbg = "NONE" },
                --         NormalNC = { bg = "NONE", ctermbg = "NONE" },
                --         CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
                --         CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
                --         CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
                --         LineNr = {},
                --         SignColumn = {},
                --         StatusLine = {},
                --         NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
                --         NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
                -- },
        },
        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = 'auto', -- sets vim.opt.signcolumn to auto
                        wrap = false, -- wrapping of lines longer than the width of window
                        backup = false, -- Disable swap file
                        writebackup = false,
                        swapfile = false,
                        tabstop = 4,
                },
                g = {
                        mapleader = ' ', -- sets vim.g.mapleader
                        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                        heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                ' █████  ███████ ████████ ██████   ██████',
                '██   ██ ██         ██    ██   ██ ██    ██',
                '███████ ███████    ██    ██████  ██    ██',
                '██   ██      ██    ██    ██   ██ ██    ██',
                '██   ██ ███████    ██    ██   ██  ██████',
                ' ',
                '    ███    ██ ██    ██ ██ ███    ███',
                '    ████   ██ ██    ██ ██ ████  ████',
                '    ██ ██  ██ ██    ██ ██ ██ ████ ██',
                '    ██  ██ ██  ██  ██  ██ ██  ██  ██',
                '    ██   ████   ████   ██ ██      ██',
        },
        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = '#abb2bf',
                        bg = '#1e222a',
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require('default_theme.colors')

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ['neo-tree'] = true,
                        notify = true,
                        ['nvim-tree'] = false,
                        ['nvim-web-devicons'] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ['which-key'] = true,
                },
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
                update_in_insert = false,
        },
        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                        -- python,
                                        -- lua,
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --     require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ['server-settings'] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },
        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"

                        ["j"] = { 'jzz', desc = '' },
                        ['k'] = { 'kzz', desc = "" },

                        ['<leader>bb'] = { '<cmd>tabnew<cr>', desc = 'New tab' },
                        ['<leader>bc'] = { '<cmd>BufferLinePickClose<cr>', desc = 'Pick to close' },
                        ['<leader>bj'] = { '<cmd>BufferLinePick<cr>', desc = 'Pick to jump' },
                        ['<leader>bt'] = { '<cmd>BufferLineSortByTabs<cr>', desc = 'Sort by tabs' },

                        ['<leader>m'] = { '<C-w>c', desc = 'Close Split Screen' },
                        ['<C-a>'] = { '0', desc = 'Go to line head' },
                        ['<C-e>'] = { '$', desc = 'Go to line tail' },
                        ['col'] = { ':Telescope colorscheme<CR>', desc = 'Change colorscheme' },
                        ['<C-u>'] = { '12kzz', desc = '' },
                        ['<C-d>'] = { '12jzz', desc = '' },
                        ['<M-j>'] = { '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
                        ['<Tab>'] = { '<cmd>Neotree toggle<cr>', desc = 'Toggle Explorer' },
                        ['<M-s>'] = { '<ESC>:w<cr>', desc = 'Save File Insert' },
                        ["<M-a>"] = { "gg0vG$", desc = "Select All" },
                        ['<M-o>'] = {
                                function()
                                        require('telescope.builtin').oldfiles()
                                end,
                                desc = 'Search history',
                        },
                        ['<M-f>'] = {
                                function()
                                        require('telescope.builtin').live_grep({
                                                additional_args = function(args)
                                                        return vim.list_extend(args, { '--hidden', '--no-ignore' })
                                                end,
                                        })
                                end,
                                desc = 'Search words in all files',
                        },
                        ["<leader>r"] = { ':lua require("undotree").toggle()<CR>', desc = "UndoTree" },
                        ["<M-mm>"] = { -- ["<M-/>"]
                                function()
                                        require('Comment.api').toggle.linewise.current()
                                end,
                                desc = 'Comment line',
                        }
                },
                i = {
                        ['<M-s>'] = { '<ESC>:w<cr>', desc = 'Save File Insert' },
                        ['<C-a>'] = { '<ESC>I', desc = 'Go to line head and Insert' },
                        ['<C-e>'] = { '<ESC>A', desc = 'Go to line tail and Insert' },
                        ['<C-h>'] = { '<left>' },
                        ['<C-j>'] = { '<down>' },
                        ['<C-k>'] = { '<up>' },
                        ['<C-l>'] = { '<right>' }
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                        ['<M-j>'] = { '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
                },
                v = {
                        ['('] = { 'di()<ESC>hp', desc = '' },
                        ['{'] = { 'di{}<ESC>hp', desc = '' },
                        ['['] = { 'di[]<ESC>hp', desc = '' },
                        ['`'] = { 'di``<ESC>hp', desc = '' },
                        ["'"] = { "di''<ESC>hp", desc = '' },
                        ['"'] = { 'di""<ESC>hp', desc = '' },
                        ['J'] = { ":move '>+1<CR>gv-gv", desc = 'Move Visual Block' },
                        ['K'] = { ":move '<-2<CR>gv-gv", desc = 'Move Visual Block' },
                        ['<C-a>'] = { '0', desc = 'Go to line head' },
                        ['<C-e>'] = { '$', desc = 'Go to line tail' },
                        ['<M-mm>'] = {
                                "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
                                desc = 'Toggle comment line',
                        }

                },
        },
        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        ['ray-x/lsp_signature.nvim'] = {
                                event = 'BufRead',
                                config = function()
                                        require('lsp_signature').setup()
                                end,
                        },
                        ['jiaoshijie/undotree'] = {
                                requires = {
                                        'nvim-lua/plenary.nvim',
                                },
                                config = function()
                                        require('undotree').setup({
                                                float_diff = true, -- using float window previews diff, set this `true` will disable layout option
                                                layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
                                                ignore_filetype = {
                                                        'Undotree',
                                                        'UndotreeDiff',
                                                        'qf',
                                                        'TelescopePrompt',
                                                        'spectre_panel',
                                                        'tsplayground',
                                                },
                                                window = {
                                                        winblend = 30,
                                                },
                                                keymaps = {
                                                        ['j'] = 'move_next',
                                                        ['k'] = 'move_prev',
                                                        ['J'] = 'move_change_next',
                                                        ['K'] = 'move_change_prev',
                                                        ['<cr>'] = 'action_enter',
                                                        ['p'] = 'enter_diffbuf',
                                                        ['q'] = 'quit',
                                                },
                                        })
                                end
                        },
                        ["iamcco/markdown-preview.nvim"] = {
                                run = function() vim.fn["mkdp#util#install"]() end,
                        },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ['null-ls'] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ['mason-lspconfig'] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ['mason-null-ls'] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                ['mason-nvim-dap'] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },

                --  Myself Plugin Config
                ['neo-tree'] = {
                        window = {
                                width = 30,
                                mappings = {
                                        ['<space>'] = false, -- disable space until we figure out which-key disabling
                                        o = 'open',
                                        H = 'prev_source',
                                        L = 'next_source',
                                        O = 'system_open',
                                },
                        },
                        filesystem = {
                                follow_current_file = true,
                                hijack_netrw_behavior = 'open_current',
                                use_libuv_file_watcher = true,
                                window = {
                                        mappings = {
                                                P = { 'toggle_preview', config = { use_float = true } },
                                                s = 'open_vsplit',
                                                h = 'toggle_hidden',
                                        },
                                },
                                commands = {
                                        system_open = function(state)
                                                astronvim.system_open(state.tree:get_node():get_id())
                                        end,
                                },
                        },
                        buffers = {
                                follow_current_file = true, -- This will find and focus the file in the active buffer every
                                -- time the current file is changed while the tree is open.
                                group_empty_dirs = true, -- when true, empty folders will be grouped together
                                show_unloaded = true,
                                window = {
                                        mappings = {
                                                ["bd"] = "buffer_delete",
                                                ["<bs>"] = "navigate_up",
                                                ["."] = "set_root",
                                        }
                                },
                        },
                        -- sort_case_insensitive = true,
                        -- sort_function = function(a, b)
                        --         if a.type == b.type then
                        --                 return a.path > b.path
                        --         else
                        --                 return a.type > b.type
                        --         end
                        -- end, -- this sorts files and directories descendantly
                        sort_function = function(a, b)
                                -- 比较类型，确保目录在文件前面
                                if a.type ~= b.type then
                                        return a.type < b.type
                                end

                                -- 获取文件扩展名
                                local function get_extension(path)
                                        return path:match("^.+(%..+)$") or ""
                                end

                                -- 提取a和b的扩展名
                                local a_ext = get_extension(a.path)
                                local b_ext = get_extension(b.path)

                                -- 比较扩展名，如果扩展名不同，则按照扩展名升序排列
                                if a_ext ~= b_ext then
                                        return a_ext < b_ext
                                end

                                -- 如果类型和扩展名都相同，按照路径升序排列
                                return a.path < b.path
                        end
                },
        },
        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },
        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },
        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                -- separators = {
                --   tab = { "", "" },
                -- },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                -- icon_highlights = {
                --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
                --   file_icon = {
                --     winbar = false, -- Filetype icon in the winbar inactive windows
                --     statusline = true, -- Filetype icon in the statusline
                --   },
                -- },
        },
        -- Modify which-key registration (Use this with mappings table in the above.)
        ['which-key'] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ['<leader>'] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ['b'] = { name = 'Buffer' },
                                },
                        },
                },
        },
        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                vim.g.mkdp_auto_close = 0 -- set markdown-preview config
                -- vim.g.mkdp_markdown_css = '~/.config/nvim/github-markdown.css'
                -- vim.g.mkdp_highlight_css = '~/.config/nvim/solarized_dark.css'
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config
