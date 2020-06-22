#include "strptime.h"

#include <string.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    if(argc < 3)
    {
        printf("Usage: %s <date/time format> <date and time as string>\n", argv[0]);
        printf("See the description of the format in the description of the strptime() function.\n");
        return -1;
    }

    const char *format = argv[1];
    struct tm stm;
    for(int i = 2; i < argc; ++i)
    {
        memset(& stm, 0, sizeof(stm));
        //printf("%s - %s:", format, argv[i]);
        if(strptime(argv[i], format, & stm) == NULL)
        {
            printf("strptime error\n");
            continue;
        }
        printf("%d.%02d.%02d %02d:%02d:%02d, yday: %d, wday: %d, isdst: %d\n",
               1900 + stm.tm_year, stm.tm_mon + 1, stm.tm_mday ? stm.tm_mday : 1,
               stm.tm_hour, stm.tm_min, stm.tm_sec,
               stm.tm_yday, stm.tm_wday, stm.tm_isdst);
    }
    return 0;
}
