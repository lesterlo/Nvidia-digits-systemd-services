echo Nvidia DIGITS Install Script
sudo cp nv-digits.service /lib/systemd/system
sudo systemctl enable nv-digits.service
sudo systemctl daemon-reload
echo Done!