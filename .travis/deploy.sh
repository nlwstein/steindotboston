#!/bin/bash
eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 .travis/id_rsa # Allow read access to the private key
ssh-add .travis/id_rsa # Add the private key to SSH
touch ~/.ssh/known_hosts
echo "stein.boston,104.236.109.211 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJ1mumrrLbRZQzZpV77fZlp01REslj8kKWvuGYypCop0fFQdejQyFVEs0kbpvQy6g1l3SMLav6dCp6+6UwI9C7A=" >> ~/.ssh/known_hosts
git config --global push.default matching
git remote add deploy ssh://nstein@stein.boston:22/var/www/html
git push deploy master