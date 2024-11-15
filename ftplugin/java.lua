-- helper function for finding a filename in a directory which matches
-- the specified pattern
local function find_file(directory, pattern)
  local filename_found = ''
  local pfile = io.popen('ls "' .. directory .. '"')

  if (pfile == nil) then
    return ''
  end

  for filename in pfile:lines() do
    if (string.find(filename, pattern) ~= nil) then
      filename_found = filename
      break
    end
  end

  return filename_found
end

local jdtls = require "jdtls"
local jdtls_setup = require "jdtls.setup"

local home = os.getenv("HOME")
local path_to_mason_packages = home .. "/.local/share/nvim/mason/packages"
local path_to_jdtls = path_to_mason_packages .. "/jdtls"
local os_type = vim.fn.has("macunix") and "mac" or "linux"
local path_to_config = path_to_jdtls .. "/config_" .. os_type
local path_to_lombok = path_to_jdtls .. "/lombok.jar"
local path_to_plugins = path_to_jdtls .. "/plugins/"
-- the eclipse jar is suffixed with a bunch of version nonsense, so we find it by pattern matching
local path_to_jar = path_to_plugins .. find_file(path_to_plugins, "org.eclipse.equinox.launcher_")

local config = {
  cmd = {
    -- assumes the java binary is in your PATH and at least java17;
    -- if not, specify the full path to the binary
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "-javaagent:" .. path_to_lombok,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    path_to_jar,

    "-configuration",
    path_to_config,

  },

  capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },

  settings = {
    java = {
      references = {
        includeDecompiledSources = true,
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    }
  },
}

jdtls.start_or_attach(config)
