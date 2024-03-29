local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspcfg = require("lspconfig")

lspcfg.tsserver.setup{}

lspcfg.bashls.setup{}
lspcfg.clangd.setup{}
lspcfg.cmake.setup{}
lspcfg.jdtls.setup{}
lspcfg.csharp_ls.setup{}
lspcfg.fsautocomplete.setup{}
lspcfg.hls.setup{}
lspcfg.vala_ls.setup{}
lspcfg.jedi_language_server.setup{}
--lspcfg.pylsp.setup{}
lspcfg.java_language_server.setup{
	init_options = {
		diagnostics = {
			enable = false,
		}
	}
}

lspcfg.rust_analyzer.setup{}
lspcfg.zls.setup{}
lspcfg.marksman.setup{}

lspcfg.vls.setup{}
lspcfg.vimls.setup{}

lspcfg.dartls.setup{
	root_dir = lspcfg.util.root_pattern("*.dart"),
	init_options = {
		closingLabels = true,
		flutterOutline = true,
		onlyAnalyzeProjectsWithOpenFiles = true,
		outline = true,
		suggestFromUnimportedLibraries = true
	},
	settings = {
		dart = {
			completeFunctionCalls = true,
			showTodos = true
		}
	}
}

lspcfg.crystalline.setup{}
lspcfg.solargraph.setup{
	root_dir = lspcfg.util.root_pattern("*.rb"),
	init_options = {
		formatting = true,
	},
	settings = {
		solargraph = {
			autoformat = true,
			completion = true,
			diagnostics = true,
			folding = true,
			references = true,
			rename = true,
			symbols = true
		}
	}
}

lspcfg.kotlin_language_server.setup{
	single_file_support = true,
	root_dir = lspcfg.util.root_pattern("*.kt")
}

lspcfg.lua_ls.setup{
	cmd = {"lua-language-server", "--logpath", "~/.config/sumneko", "-E", "/usr/lib/lua-language-server/main.lua"},
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = {
					"?.lua",
					"?/init.lua",
					'/usr/share/lua/5.3/?.lua',
					'/usr/share/lua/5.3/?/init.lua',
					'/usr/share/lua/5.4/?.lua',
					'/usr/share/lua/5.4/?/init.lua',
				},
				pathStrict = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = true,
				maxPreload = 150,
				library = {
					vim.api.nvim_get_runtime_file("", true),
					'/usr/share/lua/5.4',
					'/usr/share/lua/5.3',
					"/usr/share/awesome/lib",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

lspcfg.gopls.setup {
	capabilities = capabilities,
	settings = {
    	gopls = {
    		analyses = {
        		unusedparams = true,
        	},
        	staticcheck = true,
      	},
    },
	init_options = {
		usePlaceholders = false,
		hoverKind = "FullDocumentation",
	},
}

--lspcfg.csharp_ls.setup{}
--[[
lspcfg.omnisharp.setup{
	cmd = {"omnisharp"},
	-- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = true,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = false,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = false,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,
}
]]--

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
