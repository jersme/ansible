-- Prompt for SSH User
set sshUser to text returned of (display dialog "Enter the SSH User:" default answer "rpiclust")

-- Prompt for Manager IP
set managerIP to text returned of (display dialog "Enter the IP of the Manager Node:" default answer "192.168.1.152")

-- Prompt for Worker IPs
set workerIPList to text returned of (display dialog "Enter IPs of the Worker Nodes (comma-separated):" default answer "192.168.1.130,192.168.1.28")

-- Convert comma-separated IPs into line-by-line format
set oldDelims to AppleScript's text item delimiters
set AppleScript's text item delimiters to ","
set workerIPs to text items of workerIPList
set AppleScript's text item delimiters to "\n"
set workerIPList to workerIPs as string
set AppleScript's text item delimiters to oldDelims

-- Prompt for NFS Mount Path and Address
set nfsMountPath to text returned of (display dialog "Enter the NFS Mount Path:" default answer "/mnt/nfs")
set nfsAddress to text returned of (display dialog "Enter the NFS Address (IP:/path):" default answer "192.168.1.105:/volume1/RPICluster")

-- Prompt for Folder Path
set destFolderPath to text returned of (display dialog "Enter the folder path to save the inventory:" default answer "/Users/jeroen/Repos/ansible/rpiclust-docker-swarm")

-- Prompt for ansible_become_pass
set ansibleBecomePass to text returned of (display dialog "Enter the Ansible Become Password:" default answer "")

set inventoryContent to "[all:vars]
ansible_ssh_user=" & sshUser & "
nfs_mount_path=" & nfsMountPath & "
nfs_address=" & nfsAddress & "
ansible_become_pass=" & ansibleBecomePass & "

[manager]
" & managerIP & "

[workers]
" & workerIPList

-- Ensure the folder exists using a shell command
set posixFolderPath to POSIX path of destFolderPath
do shell script "mkdir -p " & quoted form of posixFolderPath

-- Save to the specified folder
set filePath to posixFolderPath & "/ansible_inventory.ini"
do shell script "echo '" & inventoryContent & "' > " & quoted form of filePath

return "Inventory saved to " & destFolderPath & " as ansible_inventory.ini"
