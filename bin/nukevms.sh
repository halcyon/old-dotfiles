vms=`vboxmanage list vms | awk '{print $1}' | tr '"' '\0'`
for i in $vms ; do vboxmanage unregistervm $i --delete ; done
