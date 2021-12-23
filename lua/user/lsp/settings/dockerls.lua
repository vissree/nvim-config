local status_ok, util = pcall(require, 'lspconfig.util')
if not status_ok then
  return
end

local bin_name = 'docker-langserver'
local cmd = { bin_name, '--stdio' }

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'dockerfile' },
    root_dir = util.root_pattern 'Dockerfile',
    single_file_support = true,
  },
  docs = {
    description = [[
https://github.com/rcjsuen/dockerfile-language-server-nodejs
`docker-langserver` can be installed via `npm`:
```sh
npm install -g dockerfile-language-server-nodejs
```
    ]],
    default_config = {
      root_dir = [[root_pattern("Dockerfile")]],
    },
  },
}
