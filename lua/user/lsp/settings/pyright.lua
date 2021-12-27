local status_ok, util = pcall(require, 'lspconfig.util')
if not status_ok then
  return
end

local bin_name = 'pyright-langserver'
local cmd = { bin_name, '--stdio' }

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

local function organize_imports()
  local params = {
    command = 'pyright.organizeimports',
    arguments = { vim.uri_from_bufnr(0) },
  }
  vim.lsp.buf.execute_command(params)
end

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'python' },
    root_dir = util.root_pattern(unpack(root_files)),
    single_file_support = true,
  },
  commands = {
    PyrightOrganizeImports = {
      organize_imports,
      description = 'Organize Imports',
    },
  },
  docs = {
    package_json = 'https://raw.githubusercontent.com/microsoft/pyright/master/packages/vscode-pyright/package.json',
    description = [[
https://github.com/microsoft/pyright
`pyright`, a static type checker and language server for python
]],
  },
}
