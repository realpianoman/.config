## wifi
```
# status
nmcli general status
nmcli device status

# show all connected
nmcli connection show

# See all wifi connections
nmcli device wifi list

nmcli device wifi connect <WIFI-NAME> password <PASSWORD>

nmcli device disconnect <DEVICE>
```

## processes:
```
# List all processes
ps aux

# Kill a process
pkill -f "process-name"
```

## random bash things to know:
```
# grep is op
grep "term" location/file
    -i is ignore case
    -r recursive
    --include="a.b", really good for searching a specific filetype or name

# find all with something contained
grep -Rni --include="*.ts" "search-term" .

ex:

grep -ir --include="*.ts" "cache" ./
Check all the files recursively in ./ and search all the .ts files for the word "cache" case ignored.
```

## general status
```
# activity
btop

# general status
fastfetch

# thermal
sensors
```

## bluetooth
```
bluetoothctl

power on
agent on
default-agent

# then:
scan on

# find device and then:
pair MAC_ADDRESS
trust MAC_ADDRESS
connect MAC_ADDRESS
```

## git
```
git status
git diff
git switch <banch>
git switch -c <new-branch>
git stash
git stash pop
```
