netsh interface ipv4 show excludedportrange protocol=tcp
net stop winnat
net stop LanmanWorkstation
net stop WlanSvc
net stop WwanSvc
netsh int ipv4 add excludedportrange protocol=tcp startport=%1 numberofports=%2
net start winnat
net start LanmanWorkstation
net start WlanSvc
net start WwanSvc