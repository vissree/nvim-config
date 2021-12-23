local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
    formatting.clang_format,
    formatting.eslint_d,
    formatting.gofmt,
		formatting.stylua,
    formatting.shfmt,
    formatting.terraform_fmt,
		formatting.prettier.with({
			filetypes = { "html", "json", "yaml", "markdown" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		diagnostics.pylint,
    diagnostics.codespell,
    diagnostics.eslint_d,
    diagnostics.shellcheck,
    code_actions.gitsigns,
	},
})
