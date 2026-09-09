-- copied from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
return {
    on_init = function(client)
        local path = client.workspace_folders and client.workspace_folders[1] and client.workspace_folders[1].name or client.root_dir
        if path and not (vim.uv or vim.loop).fs_stat(path .. '/.luarc.json') and not (vim.uv or vim.loop).fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}

