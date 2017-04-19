MSG=$(mosh-server new)
PORT=$(echo $MSG | perl -pe 'chomp; s/^MOSH CONNECT (\d+) .*$/$1/;')
upnpc -e mosh -a 10.0.0.11 $PORT $PORT UDP
echo $MSG

