#!/bin/bash
rm -f *.xml *.sql
wget ftp://chanpin:chanpin_fangan@122.226.207.236:56118/wsz_tx/B*
server=wsz_tx_center
_sql(){
        sed -i "s/\xEF\xBB\xBF//g" *.sql
        for i in `ls -l *.sql|awk '{print $NF}'`;do j=`echo $i|cut -d "." -f 1`;mysql $server -e "delete from $j;"; mysql $server < $i ;done
}
_xml(){
        [ -f BattleActivity.xml ] &&  \cp -avf BattleActivity.xml /data/home/wangxian/wsz_tx_center/release/Config/
}
ls |grep -E "B*.sql" && _sql
ls |grep -E "B*.xml" && _xml
sh /data/scripts/updateAdmin.sh restart
1
