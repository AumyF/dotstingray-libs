let useCmd =
      \(cmd : Text) ->
        let cmd-to =
              \(dest : Text) -> \(from : Text) -> "${cmd} ${from} ${dest}"

        let cmd-to-creating-dir =
              \(dir : Text) ->
              \(dest : Text) ->
              \(from : Text) ->
                "mkdir -p ${dir} && ${cmd} ${from} ${dest}"

        in  { zshrc = cmd-to "~/.zshrc"
            , zshenv = cmd-to "~/.zshenv"
            , yabai = cmd-to "~/.yabairc"
            , skhd = cmd-to "~/.skhdrc"
            , fish =
                cmd-to-creating-dir
                  "~/.config/fish"
                  "~/.config/fish/config.fish"
            , starship =
                cmd-to-creating-dir "~/.config/" "~/.config/starship.toml"
            , git = cmd-to-creating-dir "~/.config/git" "~/.config/git/config"
            , neovim-init-lua =
                cmd-to-creating-dir "~/.config/nvim" "~/.config/nvim/init.lua"
            , to = cmd-to
            }

in  { copy = useCmd "cp", symlink = useCmd "ln -s" }
