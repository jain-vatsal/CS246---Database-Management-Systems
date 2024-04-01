#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
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
void bubbleSort(int arr[], int size)
{
    for (int k = 0; k < size - 1; ++k)
        for (int i = 0; i < size - k - 1; ++i)
            if (arr[i] > arr[i + 1])
                swap(&arr[i], &arr[i + 1]);
}
int compareDate(struct date *a, struct date *b)
{
    if (a->yr != b->yr)
        return a->yr <= b->yr;
    if (a->mth != b->mth)
        return a->mth <= b->mth;
    return a->date <= b->date;
}
void swapDate(struct date *a, struct date *b)
{
    struct date t = *a;
    *a = *b;
    *b = t;
}
void bubbleSortDate(struct date arr[], int size)
{
    for (int k = 0; k < size - 1; ++k)
        for (int i = 0; i < size - k - 1; ++i)
            if (!compareDate(&arr[i], &arr[i + 1]))
                swapDate(&arr[i], &arr[i + 1]);
}
int main()
{
    clock_t t;
    srand(time(0));
    int s = 10000;
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
    for (int i = 0; i < 10; i++)
    {
        t = clock();
        sprintf(name, "d%dk.txt", s / 1000);
        ptr = fopen(name, "r");
        struct date *arr = malloc(s * sizeof *arr);
        for (int i = 0; i < s; i++)
        {
            int date;
            char mth[4];
            int yr;
            fscanf(ptr, "%d-%3s-%d\n", &date, mth, &yr);
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
            struct date x = {date, mint, yr};
            arr[i] = x;
        }
        fclose(ptr);
        bubbleSortDate(arr, s);
        t = clock() - t;
        double tt = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s) for sort only : %f\n", s, tt);
        fclose(ptr);
        t=clock();
        sprintf(name, "bd%dk.txt", s / 1000);
        ptr = fopen(name, "w");
        for (int i = 0; i < s; i++)
            fprintf(ptr, "%.2d-%3s-%d\n", arr[i].date, mon[arr[i].mth], arr[i].yr);
        fclose(ptr);
        t = clock() - t;
        double tt1 = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s) for sort and printing: %f\n", s, tt+tt1);
        s *= 2;
    }
    return 0;
}