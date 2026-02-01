export XDG_CACHE_HOME=${XDG_CACHE_HOME:=${HOME}/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:=${HOME}/.local/state}

export EDITOR="vim"
export VISUAL="vim"

export LANG="en_GB.UTF-8"

export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export CONSUL_HTTP_ADDR='https://consul.thenoisykeyboard.com'
export NOMAD_ADDR='https://nomad.thenoisykeyboard.com'
export VAULT_ADDR='https://vault.thenoisykeyboard.com'
