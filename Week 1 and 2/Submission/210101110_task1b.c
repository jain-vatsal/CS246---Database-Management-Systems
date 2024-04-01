#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
int main()
{
    srand(time(0));
    int s = 10000, i;
    char mon[12][4];
    strcpy(mon[0], "Jan");
    strcpy(mon[1], "Feb");
    strcpy(mon[2], "Mar");
    strcpy(mon[3], "Apr");
    strcpy(mon[4], "May");
    strcpy(mon[5], "Jun");
    strcpy(mon[6], "Jul");
    strcpy(mon[7], "Aug");
    strcpy(mon[8], "Sep");
    strcpy(mon[9], "Oct");
    strcpy(mon[10], "Nov");
    strcpy(mon[11], "Dec");
    FILE *ptr;
    char name[20];
    for (int i = 0; i < 10; i++)
    {
        sprintf(name, "d%dk.txt", s / 1000);
        ptr = fopen(name, "w");
        for (int i = 0; i < s; i++)
        {
            int yr = rand() % 57 + 1947;
            int mth = rand() % 12;
            int d = rand() % 31 + 1;
            if (d <= 15 && mth <= 8 && yr == 1947)
            {
                d = (rand() % 2) + 16;
                mth = (rand() % 2) + 9;
                yr++;
            }
            if ((mth == 3 || mth == 5 || mth == 8 || mth == 10) && d == 31)
                d = rand() % 30 + 1;
            if (mth == 1 && d >= 28)
                d = rand() % 27 + 1;
            fprintf(ptr, "%02d-%s-%d\n", d, mon[mth], yr);
        }
        fclose(ptr);
        s *= 2;
    }
    return 0;
}