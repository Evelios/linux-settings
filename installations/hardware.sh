
if [[ "$EUID" -ne 0 ]]; then
  echo "You need to run with root sudoer permissions"
  exit 1
fi

check_hardware() {
  lspci | grep -q $1
}

install_wireless() {
  apt-get install bcmwl-kernel-source
}

motherboard='Z87X-D3H-CF'
cpu='Intel(R) Core(TM) i5-4670 CPU @ 3.40GHz'
graphics='GK106 [GeForce GTX 660]'
wireless='BCM4360 802.11ac Wireless Network Adapter' # chipset 14e4:43a0
