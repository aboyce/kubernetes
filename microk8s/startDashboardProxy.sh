echo "Dashboard is available at:"
echo "http://$(hostname):8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy"
echo ""
microk8s kubectl proxy --address='0.0.0.0' --accept-hosts='^*$'
