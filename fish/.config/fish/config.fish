if status is-interactive

	set -g fish_greeting

	set -Ua fish_user_paths ~/.local/bin
	set -Ua fish_user_paths ~/.cargo/bin

    set -gx EDITOR kak
    set -gx VISUAL kak

#	hyfetch
#	dysk

	zoxide init fish | source
    starship init fish | source

end
