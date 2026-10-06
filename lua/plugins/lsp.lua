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
      diagnostics = {
        float = {
          border = "rounded",
          max_width = 100,
          max_height = 20,
          header = "",
          prefix = "",
          format = function(diagnostic)
            local source = diagnostic.source or "LSP"
            local code = diagnostic.code or ""
            if code ~= "" then
              return string.format("[%s:%s] %s", source, code, diagnostic.message)
            end
            return string.format("[%s] %s", source, diagnostic.message)
          end,
        },
      },
      servers = {
        -- Buffer-local, so these win over LazyVim's K / <leader>ca
        ["*"] = {
          keys = {
            {
              "K",
              function()
                require("pretty_hover").hover()
              end,
              desc = "Hover Documentation",
            },
            {
              "<leader>ca",
              function()
                require("actions-preview").code_actions()
              end,
              mode = { "n", "x" },
              desc = "Code Action Preview",
              has = "codeAction",
            },
          },
        },

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
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
    ft = { "php", "blade" },
    event = { "BufEnter composer.json" },
    keys = {
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Laravel Artisan",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Laravel Routes",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.related()
        end,
        desc = "Laravel Related",
      },
    },
    opts = {
      features = { pickers = { provider = "snacks" } },
    },
  },
}
