# ansible


ansible-playbook -i hosts.ini k8s-setup.yaml \
-e "ansible_user=pi" \
-e "master_node_ip=<master_node_ip>" \
-e "worker_node1_ip=<worker_node1_ip>" \
-e "worker_node2_ip=<worker_node2_ip>" \
-e "worker_node3_ip=<worker_node3_ip>" \
-e "nas_ip=<your_nas_ip>" \
-e "nfs_path=<your_nfs_share_path>"
