let base = ./dot-base.dhall

let homebrew = base.withArgumentList "brew install"

let pacman = base.withArgumentList "sudo pacman -S"

let paru = base.withArgumentList "paru -S"

let nix-env-iA = base.withArgumentList "nix-env -iA"

let nix-profile = base.withArgumentList "nix profile install"

let aurMakePkg =
      \(pkg : Text) ->
        "git clone https://aur.archlinux.org/${pkg}.git /tmp/dotstingray/${pkg} && cd /tmp/dotstingray/${pkg} && makepkg -si"

in  { homebrew, pacman, paru, aurMakePkg }
