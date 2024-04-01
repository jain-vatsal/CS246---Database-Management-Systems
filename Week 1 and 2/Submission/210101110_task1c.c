#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
    srand(time(0));
    int size = 10000;
    char mon[12][4];
    char name[40];
    FILE *ptr;
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
    for (int i = 0; i < 10; i++)
    {
        sprintf(name, "dt%dk.txt", size / 1000);
        ptr = fopen(name, "w");
        for (int i = 0; i < size; i++)
        {
            int d = rand() % 31 + 1;
            int yr = rand() % 57 + 1947;
            int hr = rand() % 24;
            int mth = rand() % 12;
            int mts = rand() % 60;
            int sec = rand() % 60;
            if (d <= 15 && mth <= 8 && yr == 1947)
            {
                yr++;
                d = (rand() % 2) + 16;
                mth = (rand() % 2) + 9;
            }
            if ((mth == 3 || mth == 5 || mth == 8 || mth == 10) && d == 31)
                d = rand() % 30 + 1;
            if (mth == 1 && d >= 28)
                d = rand() % 27 + 1;
            fprintf(ptr, "%.2d-%s-%d %02d:%02d:%02d\n", d, mon[mth], yr, hr, mts, sec);
        }
        fclose(ptr);
        size *= 2;
    }
    return 0;
}