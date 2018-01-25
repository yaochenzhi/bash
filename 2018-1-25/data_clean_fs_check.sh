all_uuid=``mysql -uroot devops_db -e 'select uuid from warnmonitor_fs_monitor' | grep -v uuid`
for uuid in all_uuid
do
    status=`mysql -uroot devops_db -e 'select fs_status from warnmonitor_fs_monitor where uuid=${uuid}' | uniq`
    not_zero_to_del=`echo $status | grep 0 |wc -l`
    if ! [ $not_zero_to_del = '0' ];then
        for s in $status
        do
            if ! [ $s = '0' ];then
                mysql -uroot devops_db -e 'delete from warnmonitor_fs_monitor where uuid=$uuid and fs_status=$s'
            fi
        done
    fi
done