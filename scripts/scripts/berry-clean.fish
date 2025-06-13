#!/usr/bin/env fish

cat /tmp/berry-clean.pid | while read -l pid
	kill $pid
end
rm /tmp/berry-clean.pid
