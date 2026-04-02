#!/bin/bash
security find-identity -v -p codesigning
echo "\nHere are the valid development teams:"
security find-identity -v -p codesigning | grep -oE '\([A-Z0-9]{10}\)' | tr -d '()' | uniq