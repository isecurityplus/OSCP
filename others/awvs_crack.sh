echo "开始破解..."
sleep 1
cp -a patch_awvs /home/acunetix/.acunetix_trial/v_190325161/scanner/
chmod 777 /home/acunetix/.acunetix_trial/v_190325161/scanner/patch_awvs
/home/acunetix/.acunetix_trial/v_190325161/scanner/patch_awvs

echo "正在处理wa_data.dat文件，防止破解失效..."
sleep 1
chattr +i /home/acunetix/.acunetix_trial/data/license/license_info.json
rm -fr /home/acunetix/.acunetix_trial/data/license/wa_data.dat
touch /home/acunetix/.acunetix_trial/data/license/wa_data.dat
chattr +i /home/acunetix/.acunetix_trial/data/license/wa_data.dat

echo "正在重启 acunetix.service 服务..."
sleep 1
systemctl restart acunetix_trial.service 

echo "恭喜你，破解完成."
