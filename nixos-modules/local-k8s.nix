{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    argocd
    docker-machine-kvm2
    kubernetes-helm
    libvirt
    minikube
    kubectl # just here for auto completes
  ];

  programs.bash.shellAliases = {
    kubectl = "minikube kubectl --";
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.stusmall = {
    extraGroups = [
      "libvirtd"
    ];
  };
}
