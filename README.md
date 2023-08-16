# ansible


ansible-playbook \
-i "[master] <master_node_ip>," \
-i "[workers] <worker_node1_ip>,<worker_node2_ip>,<worker_node3_ip>," \
-e "ansible_user=pi" \
-e "nas_ip=<your_nas_ip>" \
-e "nfs_path=<your_nfs_share_path>" \
rpi_cluster_Setup.yaml

