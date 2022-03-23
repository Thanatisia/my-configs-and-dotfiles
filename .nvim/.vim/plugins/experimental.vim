function ExperimentPlugInstaller(plugin_manager, plugins, plugin_params)
    "==========================
    " - Test Install Function to simplify plugging and installing with
    "   different plugin managers
    " :: Params
    "   plugin_manager
    "       - Your Plugin Manager of choice
    "       Type: String
    "   plugins
    "       - Your plugin names
    "       - Syntax: 'author/repository'
    "       Type: List
    "   plugin_params
    "       - Your Plugin Parameters
    "       - Syntax: { 'author/repository' : {'key', 'value'} }
    "       - Examples:
    "           {'author/repository' : { 'branch' : 'release' } }
    "       Type: Dictionary
    "==========================
    for plugin in plugins
        " Variables
        let curr_plugin = '''' . plugin . ''''
        let curr_plugin_info = curr_plugin
        
        " Append parameters for plugin if provided
        " Check if key is in plugin_params
        if has_key(plugin_params, plugin) 
            " Plugin has extra parameters
            " Get current plugin's parameters for looping
            let curr_plugin_params = plugin_params[plugin]
       
            " Concatenate Parameters into String 
            let curr_plugin_info .= ', { '
            for [Key, Value] in items(curr_plugin_params)

                " Prepare current plugin header
                let curr_plugin_info .= '''' . Key . '''' . ' : '

                " Check if type is dictionary
                if type(Value) != type(v:t_dict)
                    " Append value as string if is not
                    let curr_plugin_info .= '''' . Value . '''' . ', '
                endif
            endfor
            let curr_plugin_info .= ' }'
        endif

        " Plug the plugin
        " To Debug : 
        "   echom 'Plug ' . curr_plugin_info
        if plugin_manager == "vim-plug"
            # vim-plug uses 'Plug'
            execute 'Plug ' . curr_plugin_info
        endif
    endfor
endfunction
