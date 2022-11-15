
#!/bin/bash
echo "---install elixir---"

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi
export DEBIAN_FRONTEND=noninteractive

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
apt-get update
apt-get install esl-erlang -y
apt-get install elixir -y
rm erlang-solutions_2.0_all.deb

echo "---install elixir done---"