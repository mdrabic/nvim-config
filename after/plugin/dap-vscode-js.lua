local dapLocation = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

require("dap").adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "node",
		args = { dapLocation, "8123" },
	},
}

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Test Current File (pwa-node with jest)",
			cwd = vim.fn.getcwd(),
			runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
			runtimeExecutable = "node",
			args = { "${file}", "--coverage", "false" },
			rootPath = "${workspaceFolder}",
			sourceMaps = true,
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "nvim jest unit debug file",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			runtimeArgs = {
				"--inspect-brk",
				"./node_modules/jest/bin/jest.js",
			},
			args = { "${file}", "-c", "./test/unit/jest.config.js", "--runInBand" },
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "nvim jest integration debug file",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			runtimeArgs = {
				"--inspect-brk",
				"./node_modules/jest/bin/jest.js",
			},
			args = { "${file}", "-c", "./test/integration/jest.config.js", "--runInBand" },
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

-- try to read vscode launch.json files
require("dap.ext.vscode").load_launchjs(nil, {
	["pwa-node"] = js_based_languages,
	["node"] = js_based_languages,
	["chrome"] = js_based_languages,
	["pwa-chrome"] = js_based_languages,
})
