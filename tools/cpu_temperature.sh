#!/bin/bash

CPU_TEMP=$(sensors | awk -F'+' '{ print $2}' | cut -d' ' -f1 | grep '.' | head -n 1)

echo "${CPU_TEMP}"
