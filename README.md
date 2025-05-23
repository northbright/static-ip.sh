# static-ip.sh
Script to set static IP using netplan on Ubuntu.

## Usage
* Edit `static-ip.sh`

```bash
# -------------------- #
# Variables
# -------------------- #
interface="eno1"

ip="10.0.10.3/24"
gateway="10.0.10.1"
dns1="223.5.5.5"
dns2="223.6.6.6"
```

* Run `static-ip.sh` with `sudo`

```bash
sudo ./static-ip.sh
```

## License
* [MIT License](LICENSE)
