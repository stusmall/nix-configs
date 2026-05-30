{ ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      if [ "$TERM" = "alacritty" ]; then
        eval "$(zellij setup --generate-auto-start bash)"
      fi
      # Needed to use yubkiey for SSH key
      export GPG_TTY="$(tty)"
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    '';
  };
}
