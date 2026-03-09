# Homebrew GNU tools take priority over macOS built-ins
path=(
  /opt/homebrew/opt/coreutils/libexec/gnubin
  /opt/homebrew/opt/curl/bin
  /opt/homebrew/opt/findutils/libexec/gnubin
  /opt/homebrew/opt/gawk/libexec/gnubin
  /opt/homebrew/opt/grep/libexec/gnubin
  /opt/homebrew/opt/gnu-sed/libexec/gnubin
  /opt/homebrew/opt/gnu-tar/libexec/gnubin
  /opt/homebrew/opt/gnu-which/libexec/gnubin
  /opt/homebrew/opt/libpq/bin
  /opt/homebrew/bin
  $path
)

manpath=(
  /opt/homebrew/opt/coreutils/libexec/gnuman
  /opt/homebrew/opt/findutils/libexec/gnuman
  $manpath
)

export HOMEBREW_NO_ENV_HINTS=TRUE
export SHELL_SESSIONS_DISABLE=1
