#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
#include <string.h>
struct dateTime
{
    int date;
    int mth;
    int yr;
    int hr;
    int min;
    int sec;
};
struct date
{
    int date;
    int mth;
    int yr;
};
void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
int compareDateTime(struct dateTime *a, struct dateTime *b)
{
    if (a->yr != b->yr)
        return a->yr <= b->yr;
    if (a->mth != b->mth)
        return a->mth <= b->mth;
    if (a->date != b->date)
        return a->date <= b->date;
    if (a->hr != b->hr)
        return a->hr <= b->hr;
    if (a->min != b->min)
        return a->min <= b->min;
    return a->sec <= b->sec;
}
void swapDateTime(struct dateTime *a, struct dateTime *b)
{
    struct dateTime t = *a;
    *a = *b;
    *b = t;
}
int partitionDateTime(struct dateTime array[], int low, int high)
{

    struct dateTime pivot = array[high];
    int i = (low - 1);
    for (int j = low; j < high; j++)
        if (compareDateTime(&array[j], &pivot))
        {
            i++;
            swapDateTime(&array[i], &array[j]);
        }
    swapDateTime(&array[i + 1], &array[high]);
    return (i + 1);
}
void quickSortDateTime(struct dateTime array[], int low, int high)
{
    if (low < high)
    {
        int pi = partitionDateTime(array, low, high);
        quickSortDateTime(array, low, pi - 1);
        quickSortDateTime(array, pi + 1, high);
    }
}
int main()
{
    clock_t t;
    srand(time(0));
    int size = 10000;
    char mon[12][4];
    sprintf(mon[0], "Jan");
    sprintf(mon[1], "Feb");
    sprintf(mon[2], "Mar");
    sprintf(mon[3], "Apr");
    sprintf(mon[4], "May");
    sprintf(mon[5], "Jun");
    sprintf(mon[6], "Jul");
    sprintf(mon[7], "Aug");
    sprintf(mon[8], "Sep");
    sprintf(mon[9], "Oct");
    sprintf(mon[10], "Nov");
    sprintf(mon[11], "Dec");
    FILE *ptr;
    char name[20];
    int date;
    char mth[4];
    int yr;
    int hr;
    int min;
    int sec;
    for (int i = 0; i < 10; i++)
    {
        t = clock();
        sprintf(name, "dt%dk.txt", size / 1000);
        ptr = fopen(name, "r");
        struct dateTime *a = malloc(size * sizeof *a);
        for (int i = 0; i < size; i++)
        {
            fscanf(ptr, "%d-%3s-%d %d:%d:%d\n", &date, mth, &yr, &hr, &min, &sec);
            int mint;
            if (strcmp(mth, "Jan") == 0)
                mint = 0;
            else if (strcmp(mth, "Feb") == 0)
                mint = 1;
            else if (strcmp(mth, "Mar") == 0)
                mint = 2;
            else if (strcmp(mth, "Apr") == 0)
                mint = 3;
            else if (strcmp(mth, "May") == 0)
                mint = 4;
            else if (strcmp(mth, "Jun") == 0)
                mint = 5;
            else if (strcmp(mth, "Jul") == 0)
                mint = 6;
            else if (strcmp(mth, "Aug") == 0)
                mint = 7;
            else if (strcmp(mth, "Sep") == 0)
                mint = 8;
            else if (strcmp(mth, "Oct") == 0)
                mint = 9;
            else if (strcmp(mth, "Nov") == 0)
                mint = 10;
            else if (strcmp(mth, "Dec") == 0)
                mint = 11;
            struct dateTime x = {date, mint, yr, hr, min, sec};
            a[i] = x;
        }
        fclose(ptr);
        quickSortDateTime(a, 0, size - 1);
        t = clock() - t;
        double tt = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s): %f\n", size, tt);
        t=clock();
        sprintf(name, "qdt%dk.txt", size / 1000);
        ptr = fopen(name, "w");
        for (int i = 0; i < size; i++)
            fprintf(ptr, "%.2d-%3s-%d %.2d:%.2d:%.2d\n", a[i].date, mon[a[i].mth], a[i].yr, a[i].hr, a[i].min, a[i].sec);
        fclose(ptr);
        t = clock() - t;
        double tt1 = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s): %f\n", size, tt1+tt);
        size *= 2;
    }
    return 0;
}