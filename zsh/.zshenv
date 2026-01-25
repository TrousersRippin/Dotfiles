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
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

#export VAULT_ADDR='http://127.0.0.1:8200'
#export CONSUL_HTTP_ADDR='127.0.0.1:8500'
#export NOMAD_ADDR='http://127.0.0.1:4646'

#export VAULT_CONFIG_PATH="${XDG_CONFIG_HOME}/vault"
#export CONSUL_CONFIG_DIR="${XDG_CONFIG_HOME}/consul"
#export NOMAD_CONFIG_DIR="${XDG_CONFIG_HOME}/nomad"