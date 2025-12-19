export XDG_CACHE_HOME=${XDG_CACHE_HOME:=${HOME}/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:=${HOME}/.local/state}

export EDITOR="vim"
export VISUAL="vim"

export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
