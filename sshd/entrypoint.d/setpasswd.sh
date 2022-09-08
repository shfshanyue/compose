#!/usr/bin/env bash

set -e

echo 'root:$6$deUegwkHU4fpzcnF$omBwqeKcW53tyObLg9tMSpSNYdA/k8uulTySL1j2lppB6owoe5oYtRYgugJjwqPzmLG7yMSSC960vLVjQ3qMR0' | chpasswd --encrypted

# Or if you don't pre-hash the password remove the line above and uncomment the line below.
# echo "user1:user1password" | chpasswd