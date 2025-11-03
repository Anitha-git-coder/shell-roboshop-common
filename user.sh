source ./common.sh
app_user=user
check_root
app_setup
nodejs_setup
systemd_setup
app_restart
print_total_time