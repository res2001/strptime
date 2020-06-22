strptime for Windows.
It's a modified version NetBSD strptime(): http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/lib/libc/time/strptime.c?only_with_tag=HEAD
Format description: https://netbsd.gw.com/cgi-bin/man-cgi?strptime+3+NetBSD-current

Build test.
MSVC: cl test-strptime.c strptime.c -o test-strptime
MINGW: gcc -std=c99 test-strptime.c strptime.c -o test-strptime
