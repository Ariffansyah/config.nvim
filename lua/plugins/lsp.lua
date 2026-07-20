return {
  -- Add Treesitter support for all languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          -- JavaScript/TypeScript Frameworks
          "svelte",
          "vue",
          "astro",
          "tsx",
          "typescript",
          "javascript",
          -- PHP/Laravel
          "php",
          "phpdoc",
          "blade",
          -- Systems Programming
          "rust",
          "go",
          "gomod",
          "gosum",
          "c",
          "cpp",
          -- Web
          "html",
          "css",
          "scss",
          "json",
          "yaml",
          "toml",
          -- Java
          "java",
          -- Others
          "lua",
          "markdown",
          "markdown_inline",
        })
      end
    end,
  },

  -- Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ==========================================
        -- JavaScript/TypeScript Frameworks
        -- ==========================================

        -- Svelte
        svelte = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
            },
          },
        },

        -- Vue
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },

        -- Astro
        astro = {},

        -- Angular
        angularls = {},

        -- TypeScript/JavaScript
        ts_ls = {
          enabled = false, -- Use vtsls instead for better framework support
        },
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              enableMoveToFileCodeAction = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              suggest = {
                autoImports = true,
                includeCompletionsForImportStatements = true,
                completeFunctionCalls = true,
                includeAutomaticOptionalChainCompletions = true,
                paths = true,
              },
              preferences = {
                importModuleSpecifier = "relative",
                includePackageJsonAutoImports = "on",
              },
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            javascript = {
              suggest = {
                autoImports = true,
                includeCompletionsForImportStatements = true,
                completeFunctionCalls = true,
                includeAutomaticOptionalChainCompletions = true,
                paths = true,
              },
              preferences = {
                importModuleSpecifier = "relative",
                includePackageJsonAutoImports = "on",
              },
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },

        -- ESLint (relaxed)
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            format = false,
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = "separateLine",
              },
            },
          },
        },

        -- ==========================================
        -- PHP & Laravel
        -- ==========================================

        -- Intelephense (PHP)
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
              environment = {
                phpVersion = "8.2",
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                -- Laravel stubs
                "laravel",
                "phpunit",
              },
            },
          },
        },

        -- PHPActor (Alternative PHP LSP)
        phpactor = {
          enabled = false, -- Enable if you prefer phpactor over intelephense
        },

        -- Blade (Laravel templates) - handled by separate plugin

        -- ==========================================
        -- Systems Programming
        -- ==========================================

        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              checkOnSave = {
                command = "clippy",
                allFeatures = true,
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always",
                },
              },
            },
          },
        },

        -- Go
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                shadow = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },

        -- C/C++
        clangd = {
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            local root = util.root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja",
              "compile_commands.json",
              "compile_flags.txt",
              ".git"
            )(fname)

            if root then
              return root
            end

            -- Fallback to current file directory
            return vim.fn.fnamemodify(fname, ":p:h")
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },

        -- ==========================================
        -- Web Development
        -- ==========================================

        -- Tailwind CSS
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },

        -- HTML
        html = {
          filetypes = { "html", "blade" },
        },

        -- CSS
        cssls = {},

        -- JSON (simple)
        jsonls = {
          settings = {
            json = {
              format = { enable = true },
              validate = { enable = true },
            },
          },
        },

        -- YAML (simple)
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
              format = { enable = true },
              validate = true,
              schemaStore = {
                enable = true, -- Use yamlls built-in schema store
              },
            },
          },
        },

        -- ==========================================
        -- DevOps & Containers
        -- ==========================================

        -- Docker
        dockerls = {},
        docker_compose_language_service = {},

        -- ==========================================
        -- Other Languages
        -- ==========================================

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
          on_init = function(client)
            local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
            if vim.fn.executable(venv_path) == 1 then
              client.config.settings.python.pythonPath = venv_path
            end
          end,
        },

        -- C#
        omnisharp = {
          cmd = { "omnisharp" },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },

        -- ==========================================
        -- Java / Spring Boot
        -- ==========================================

        -- Eclipse JDT Language Server
        -- Handles Java editing, refactoring, navigation, and Spring Boot support
        jdtls = {
          settings = {
            java = {
              configuration = {
                -- jdtls will auto-detect Java runtimes if JAVA_HOME is set
                runtimes = {},
              },
              eclipse = {
                downloadSources = true,
              },
              maven = {
                downloadSources = true,
              },
              implementationsCodeLens = {
                enabled = true,
              },
              referencesCodeLens = {
                enabled = true,
              },
              references = {
                includeDecompiledSources = true,
              },
              inlayHints = {
                parameterNames = {
                  enabled = "all",
                },
              },
              format = {
                enabled = true,
              },
              completion = {
                favoriteStaticMembers = {
                  "org.assertj.core.api.Assertions.*",
                  "org.mockito.Mockito.*",
                  "org.mockito.ArgumentMatchers.*",
                  "org.springframework.boot.test.context.SpringBootTest",
                },
                importOrder = {
                  "java",
                  "javax",
                  "jakarta",
                  "com",
                  "org",
                  "io",
                  "net",
                  "",
                  "\\#",
                },
              },
              sources = {
                organizeImports = {
                  starThreshold = 3,
                  staticStarThreshold = 3,
                },
              },
            },
          },
          init_options = {
            bundles = {},
          },
        },

        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },

        -- Markdown
        marksman = {},

        -- TOML
        taplo = {},
      },
    },
  },

  -- Add schemas for JSON/YAML
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Laravel Blade support
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
    },
    event = { "BufRead **/*/app/*.php" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension("laravel")
    end,
  },

  -- Ensure formatters are configured
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- JavaScript/TypeScript
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        svelte = { "prettierd", "prettier" },
        vue = { "prettierd", "prettier" },
        astro = { "prettierd", "prettier" },
        -- Web
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        jsonc = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        -- PHP/Laravel
        php = { "php_cs_fixer", "pint" },
        blade = { "blade-formatter" },
        -- Systems
        rust = { "rustfmt" },
        go = { "gofumpt", "goimports" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- Lua
        lua = { "stylua" },
        -- Python
        python = { "isort", "black" },
        -- Java
        java = { "google-java-format" },
        -- TOML
        toml = { "taplo" },
      },
    },
  },
}
