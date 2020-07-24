# sshToTermuxWithMacAddr.ps1
Connect to your termux without ip within LAN
---

A Powershell script to ssh to your termux using MAC Addr

1. Search MAC Addr in Arp Cache
2. Try host discovey on 192.168.1.2-253 (using nmap)
3. Ssh ip -p port

Need: 
- nmap for windows >= 7.80 (https://nmap.org)
- powershell >= 7 (https://microsoft.com/PowerShell)

Use: 
- change SETTINGS and ./sshtermux.ps1
- make sure that your termux sshd is online

enjoy!
```

                             o==)_\
|                              ',====_          NO BUG
`========                        \ \  \_____    GOD BLESS ME
(________)/~-----||-----.         \ \  `\  ||
   _\_\__/_______||______\         \ \   `\||
  (||__________________   \        |  |)   `\_
   /          /_~_///  \  /        / /        `-_
  /   -==============- / /        / / ___________\_
 /_____________==//___/_/________/_/___===========|
 _//|  ( () )/ |~`-----------------'  |  ( ()')  |
'-'  \_ `--' _/                        \_ `--' _/
       `----'                            `----'
```
