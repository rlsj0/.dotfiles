local jdtls = require 'jdtls'

local home = vim.fn.expand '~'
local lombok = home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar'

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-javaagent:' .. lombok,
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xmx2G',
    '-jar',
    vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data',
    vim.fn.getcwd() .. '/.jdtls-workspace',
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'pom.xml', 'build.gradle' },
}

jdtls.start_or_attach(config)
