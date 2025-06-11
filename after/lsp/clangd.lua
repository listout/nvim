return {
	-- Command and arguments to start the server.
	cmd = { 'clangd' },
	-- Filetypes to automatically attach to.
	filetypes = { 'c', 'cpp', 'h', 'hpp' },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { '.clangd', 'compile_commands.json' },
}
