{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    argocd
    kubectl
    kubernetes-helm
  ];

  services.k3s.enable = true;
}
