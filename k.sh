================================================================================
Beginners Kamoj addon guide.                                          2025-04-20
================================================================================
- The router is always available at: http://www.routerlogin.net (Factory default is http://192.168.1.1)

- Download and read the kamoj documentation from:
  https://www.voxel-firmware.com/Downloads/Voxel/Kamoj/

- To use the Kamoj addon, you must first replace the Netgear FirmWare with FirmWare from Voxel. See below.
  Voxel FW does not remove previous Netgear settings. So it's easy to re-install Netgear FW if wanted.

- After each (re-) installation/update of Voxel FW, the Kamoj addon must be re-installed.
  (All kamoj addon settings are kept, but the Voxel installation removes the kamoj addon itself).

- The FW for the Netgear routers R7800 and R9000 are not the same.
  
- It's good to have a backup if you want to restore to Netgear original Firmware.
  Backup your router settings. 
  ADVANCED, Administration, Backup Settings, Back Up, Save
  (or Issue these commands from the router command prompt:
   udev="$(ls /tmp/mnt|grep "s..1"|head -n1)"
   nvram backup /mnt/$udev/nvram.cfg
  )
  
- BACKUP ROUTER settings in plain text!: Good for many things like SSIDs, Reserved addresses and passwords.
  Issue these commands from the router command prompt:
  udev="$(ls /tmp/mnt|grep "s..1"|head -n1)"
  nvram show > /mnt/$udev/nvram_show.txt
  nvram show | sort > /mnt/$udev/nvram_show_sort.txt
  
- Download and unpack the Voxel FW
   Download from:
   https://voxel-firmware.com/Downloads/Voxel/html/r7800.html
   or
   https://voxel-firmware.com/Downloads/Voxel/html/r9000.html
   E.g.:
   https://voxel-firmware.com/Downloads/Voxel/R7800-Voxel-firmware/R7800-V1.0.2.114SF.zip

   Unpack the .zip to e.g. : C:\Users\xSx\Desktop\Router\R7800-V1.0.2.114SF.img

- Read on these pages to get a idea and overview of how to install the Voxel FW, and Kamoj addon, and what to expect:
  https://www.snbforums.com/threads/kamoj-add-on-v5-for-netgear-r7800-x4s-and-r9000-x10.60590/
  https://www.snbforums.com/threads/kamoj-add-on-beta-testing.67375/
  https://www.snbforums.com/threads/kamoj-add-on-beta-testing-ii.72238/
  https://www.snbforums.com/threads/kamoj-addon-5-5-beta-for-netgear-r7800-r8900-r9000-with-voxel-fw.76440/
  https://www.snbforums.com/threads/kamoj-addon-5-5-beta-for-netgear-r7800-r8900-r9000-with-voxel-fw-continuation.92851/

  
- Install Voxel FW
   Open the routers ADVANCED page : (http://192.168.1.1/adv_index.htm)
   Administration: Firmware Update: 
   "Locate and select the upgrade file on your hard disk." 
   Browse, C:\Users\xSx\Desktop\Router\R7800-V1.0.2.114SF.img, File name: R7800-V1.0.2.114SF.img, Open, Upload
   Ignore the warnings about installing older firmware.

- Install Kamoj addon
   Enable Telnet on your PC:
   http://www.routerlogin.net/debug.htm
   Check (Set a tick in the box for) "Enable Telnet". (No apply needed)

   Login to the router using telnet:
   telnet www.routerlogin.net
   The password is the same as from the normal router login page http://routerlogin.net

   Download and install the add-on. From the router telnet command window:
   curl -fkso- https://www.voxel-firmware.com/Downloads/Voxel/Kamoj/.Download/addon_install.sh | sh -s

- Login to the router after the reboot: http://routerlogin.net

--------------------------------------------
- Make recommended settings for the router:
--------------------------------------------
INTERNET:
- Setup Default DNS servers: Basic: Internet: Domain Name Server (DNS) Address:
  Use These DNS Servers (The Netgear defaults is to get from your ISP - not recommended!)
  Primary DNS     : 1.1.1.1  (Cloudflare, Excellent DDoS protection, good for gaming)
  Secondary DNS   : 9.9.9.9  (Quad9 DNS - Excellent security)
  Third DNS       : 8.8.8.8  (Google primary DNS)
  + Apply

- Setup MAC address for the WAN:
  Router MAC Address: Use This MAC Address
  + Apply

WIRELESS:
- Set up your WiFi SSIDs (WiFi radio names!) and passwords:
  Basic: Wireless: Wireless Network (2.4GHz b/g/n): Name (SSID): MYWIFI
  Basic: Wireless: Security Options (WPA2-PSK): Password (Network Key): MyFineWiFiPassword

  Basic: Wireless: Wireless Network (5GHz 802.11a/n/ac): Name (SSID): MYWIFI-5G
  Basic: Wireless: Wireless Network (5GHz 802.11a/n/ac): Channel: 36
  Basic: Wireless: Security Options (WPA2-PSK): Password (Network Key): MyFineWiFiPassword
  + Apply
 
- Enable WiFi "Enable Smart Connect" for same SSID for 2.4 and 5 GHz networks. (Not recommended though...)
  Basic: Wireless: Enable Smart Connect + Apply

WIRELESS GUEST NETWORK:
- Enable Guest WiFi network for vistors/friends to use: 
  Basic: Guest Network: Wireless Settings(2.4GHz b/g/n): Enable Guest Network
                       ("Allow guests to see each other and access my local network" may be needed to pair different home devices to each other!)
                        Guest Wireless Network Name (SSID) : GUESTNET
                        Security Options: WPA2-PSK [AES] 
                        Security Options (WPA2-PSK): Password (Network Key) : MyFineWiFiGuestPassword 
  Basic: Guest Network: Wireless Settings (5GHz 802.11a/n/ac): Enable Guest Network
                        Guest Wireless Network Name (SSID) : GUESTNET-5G
                        Security Options: WPA2-PSK [AES] 
                        Security Options (WPA2-PSK): Password (Network Key) : MyFineWiFiGuestPassword 
  + Apply

WIRELESS SECURITY:
- Switch off WPS:
  Advanced: Advanced Setup: Wireless Settings: WPS Settings: Enable Router's PIN: Uncheck the box
   + Apply

WIRELESS SAFETY: For R9000 only
- Switch off the 60 MHz WiFi:
  Advanced: Advanced Setup: Wireless Settings: Advanced Wireless Settings (60GHz 802.11ad): Uncheck the box
  + Apply
  
TIME ZONE and DAYLIGHT SAVING:
- Set up your Time Zone and NTP time servers:
  Advanced: Administration: NTP Settings: 
      Set your preferred NTP server: Primary NTP server: pool.ntp.org
      Time Zone: Select your time zone, e.g. GMT+1.
      Automatically adjust for daylight savings time
  + Apply

ROUTER LIGHTS/LEDS:
- To turn off blinking or lit LEDs/lamps on the router:
  Advanced: Advanced Setup: LED Control Settings: 
  Select
  "Disable blinking on Internet LED, LAN LED, Wireless LED and USB LED when data traffic is detected"
  or
  "Turn off all LEDs except Power LED"
  + Apply
  
 
KAMOJ ADDON SETTINGS:  
- For R9000 this is very important, since they are known for overheating and then frying the WiFi radios!
  ADVANCED: Hidden Menus: Netgear Debug Info: Fan Algorithm: Fan speed: 3500 rpm
  ADVANCED: Hidden Menus: Netgear Debug Info: Always enable Fan: Check the box 
  + Save
  Make sure the fan is running!

- IMPORTANT: Start to check the status of the routers Flash memories:
  Advanced: Kamoj Menu: System Information: flash info

- See all devices connected to the router:
  Advanced: Kamoj Menu: VPN Bypassing: Check "Show Only Active Devices"

- Install Aegis. Firewall blocklist that blocks all traffic to and from malicious IPs.
  Advanced: Kamoj Menu: DNS Privacy/Ad-Blocking: 
  Aegis. Firewall blocklist. Filter all traffic to and from malicious IPs via WAN/Wireguard/OpenVPN:
  Install/Enable: Check the box

- Install encrypted DNS service. The addon support DNSCrypt Proxy 2, Stubby and AdGuardHome.
  For the simple user without needs for filtering/blocking e.g. adult contents DNSCrypt is recommended.
  See separate description/instruction for the amazing AdGuardHome!
  Advanced: Kamoj Menu: DNS Privacy/Ad-Blocking: DNS Filter/Encryption: DNSCrypt Proxy v2

- Enable Ad-blocking using DNSCrypt:
  Advanced: Kamoj Menu: DNS Privacy/Ad-Blocking: Dnscrypt-Proxy 2 Ad-Blocking: Public lists:
  It's a free choice here. If your favorite site gets blocked, add it in the white-list, or change block list!
  Try e.g.: Mybase () - https://download.dnscrypt.info
  Check "Auto update Public lists"
  Submit
  (Refresh the page to see that it's working. E.g. "Now filtering 464298 unique domains")
  
- Switch on extra DDoS protection:
  Advanced: Kamoj Menu: Settings
  Check: "Extra DDoS (distributed denial-of-service) protection firewall rules": On

- Disable Router "Phone home" and feeding Amazon a.o. with info etc:
  Advanced: Kamoj Menu: Settings:
  Check all boxes in the section "Router Analytics / Data Collection / Phone Home".
- Make some recommended settings:
  Advanced: Kamoj Menu: Settings: Disable USB Printer drivers
  Advanced: Kamoj Menu: Settings: Disable WPS (Reboot router to take effect)
  Advanced: Kamoj Menu: Settings: Disable Transmission torrent client
  Advanced: Kamoj Menu: Settings: Disable Apple Filing Protocol (AFP) / Netatalk / Time Machine
  Advanced: Kamoj Menu: Settings: Set power LED amber when WAN/Internet is down (R7800)
  Advanced: Kamoj Menu: Settings: Set power LED off when WAN/Internet is down (R9000)
  Advanced: Kamoj Menu: Settings: Set antenna LEDs off
  Advanced: Kamoj Menu: Settings: Show idle devices in device lists
  Advanced: Kamoj Menu: Settings: Hide wireless password on Basic Home page
  Advanced: Kamoj Menu: Settings: Set an_router_flag in nvram to indicate 802.11a and 802.11n capability
  Advanced: Kamoj Menu: Settings: Set vt100 as terminal for shells to enable e.g. nano from Telnet
  Advanced: Kamoj Menu: Settings: Disable Router GUI timeout
  Advanced: Kamoj Menu: Settings: Download and use MAC address list to identify devices
  + reboot if any pop-up window informed that it is needed.
- Save configuration!
  Advanced: Admin: Backup Settings: Save a copy of current settings: Back Up, Save as: ...

WIREGUARD:
  Advanced: Kamoj Menu: Wireguard Client: 
  - Settings:
  WireGuard Client: Automatic Status update: Check
  WireGuard Client - General settings: Install
  WireGuard Client - General settings: Killswitch On
  WireGuard Client - General settings: No Killswitch for Bypass devices
  WireGuard Client - General settings: Keep Killswitch On when restarting client
  WireGuard Client - General settings: Restart on connection failure
  WireGuard Client - General settings: Restart on DNS failure
  WireGuard Client - General settings: Synchronize addon created configurations with USB-device
  WireGuard Client - General settings: Start delay at boot 0 seconds
  - Configure Wireguard:
  WireGuard Client - Create/Edit an WireGuard Client Configuration manually:
  Configuration name: Fill in the name of your service/server, e.g.: azirevpn-fi-hel.conf
  In the input filed below, enter the information from your Wireguard provider, e.g.:
   [Interface]
   PrivateKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   Address = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   DNS = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

   [Peer]
   PublicKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   AllowedIPs = 0.0.0.0/0, ::/0
   Endpoint = fi-hel.azirevpn.net:51820

  - Click "Create/Save VPN Configuration"
  - Start Wireguard:
    Select and Run WireGuard Client Configuration: 
    Get all configuration files: Click
    Select your configuration: azirevpn-fi-hel.conf
    Click the green button: Start Wireguard Client with this
  - Verify that Wireguard is running and working:
    - After 10 seconds, click "Show current wireguard status"
      Here you should get information e.g. "latest handshake: "
    - The "VPN tunnel Status:" shield is green.
    - Connect to some web-pages and verify you can reach intgernet.
    - Connect to your ISP/Wireguard provider to verify you are using the encryption.

SUPERVISION:
  Advanced: Kamoj Menu: SUPERVISION: 
  Supervision on: Check
  RESTART SUPERVISION (Supervise and Restart failed resources): DNS: Check dnsmasq + dnscrypt2 + stubby + adguard
  VPN Client: Check all boxes
  WIFI (2.4 GHz and 5 GHz bands): Supervise WiFi radios: Check
  Alternative timeouts: Use alternative timeout when high cpu load (recommended): Check
  Use alternative timeout when high kernel load (recommended): Check
  
RESERVE IP ADDRESSES:
- BASIC: Setup: LAN Setup:

SAVE CONFIGURATION:
  Advanced: Admin: Backup Settings: Save a copy of current settings: Back Up, Save as: ...

CHECK THAT ALL IS OK:
  Advanced: Kamoj Menu: Router Information 
  (It takes "some time" to collect all information before displaying the page! So have patience.).
