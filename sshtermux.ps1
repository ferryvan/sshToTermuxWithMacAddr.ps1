#SETTINGS
$MAC = "74-59-09-32-1c-ea"
$BIG_MAC = "74:59:09:32:1C:EA"
$port = "8022" # ssh port,default 8022 for Termux sshd
# Search Under 192.168.1.2-253
# Retry once

Write-Output "MAC: ${MAC}"
#sudo arp -d
$str = arp -a
# $str
$str = [system.String]::Join("", $str)
$startpattern = '\b(192\.168\.1\.[0-9]+\b)[ ]+'
$pattern = $startpattern + $MAC

$case = $str -match $pattern
if ($case) {
    $ip = $Matches[1]
    Write-Output "Device found at ${ip}"
    Write-Output "Starting ssh connect"
    ssh ${ip} -p ${port}
}
else 
{
    Write-Output "Device not found in Arp Cache"
    Write-Output "Trying host discovey on 192.168.1.2-253"
    Write-Output "---------------------------------------"
    $str2 = nmap -n -p ${port} -PS 192.168.1.2-253
    $str2
    #nmap -n -Pn -T4 -p ${port} 192.168.1.2-253
    Write-Output "---------------------------------------"
    #$str2 = arp -a
    #$str2
    $pattern2="\b(192\.168\.1\.[0-9]+){1}((?!Nmap).)*(${BIG_MAC}){1}"
    $str2 = [system.String]::Join("", $str2)
    $case2 = $str2 -match $pattern2
    if ($case2){
        $ip = $Matches[1]
        Write-Output "Device found at ${ip}"
        Write-Output "Starting ssh connect"
        ssh ${ip} -p ${port}
    }else {
        Write-Output "Device not found"
    }
}