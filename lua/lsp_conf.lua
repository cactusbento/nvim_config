local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspcfg = require("lspconfig") 

lspcfg.bashls.setup{}
lspcfg.clangd.setup{}
lspcfg.cmake.setup{}
lspcfg.jdtls.setup{}
--lspcfg.jedi_language_server.setup{}
lspcfg.pylsp.setup{}
lspcfg.java_language_server.setup{}
lspcfg.kotlin_language_server.setup{}


lspcfg.sumneko_lua.setup{ 
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
		},
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
		telemetry = {
        	enable = false,
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
		usePlaceholders = true,
		hoverKind = "FullDocumentation",
	},
}
