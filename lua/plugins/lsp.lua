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

        -- Angular
        angularls = { workspace_required = true },

        -- TypeScript/JavaScript
        ts_ls = {
          enabled = false, -- Use vtsls instead for better framework support
        },
        vtsls = {
          settings = {
            typescript = {
              preferences = { importModuleSpecifier = "relative", includePackageJsonAutoImports = "on" },
              inlayHints = { variableTypes = { enabled = true } },
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

        -- Go (rest comes from the go extra)
        gopls = {
          settings = { gopls = { analyses = { shadow = true } } },
        },

        -- ==========================================
        -- Web Development
        -- ==========================================

        -- Tailwind CSS
        tailwindcss = {},

        -- HTML
        html = {
          filetypes = { "html", "blade" },
        },

        -- CSS
        cssls = {},

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

        -- Markdown
        marksman = {},
      },
    },
  },

  -- Rust: keep clippy + lifetime hints on top of the rust extra
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            inlayHints = { lifetimeElisionHints = { enable = "always" } },
          },
        },
      },
    },
  },

  -- Java / Spring Boot (nvim-jdtls comes from the java extra)
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
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
    },
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
}
