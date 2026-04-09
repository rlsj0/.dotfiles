-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'rebelot/kanagawa.nvim' },
  { 'ronisbr/nano-theme.nvim' },
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function()
          local jdtls = require 'jdtls'
          local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'

          local jdtls_cmd = mason_path .. '/bin/jdtls'
          local lombok_jar = mason_path .. '/lombok.jar'

          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
          local workspace_dir = vim.fn.expand '~/.cache/jdtls-workspace/' .. project_name

          local root_dir = jdtls.setup.find_root { '.git', 'mvnw', 'gradlew', 'pom.xml' } or vim.fn.getcwd()

          local config = {
            cmd = {
              jdtls_cmd,
              -- '-javaagent:' .. lombok_jar,
              '--jvm-arg=-javaagent:' .. lombok_jar,
              '-data',
              workspace_dir,
            },
            root_dir = root_dir,
          }

          jdtls.start_or_attach(config)
        end,
      })
    end,
  },
}
