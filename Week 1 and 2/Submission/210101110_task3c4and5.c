#include <stdio.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>
struct Date
{
    int d;
    int mth;
    int yr;
};
int compareDate(struct Date *a, struct Date *b)
{
    if (a->yr != b->yr)
        return a->yr <= b->yr;
    if (a->mth != b->mth)
        return a->mth <= b->mth;
    return a->d <= b->d;
}
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}
void swapDate(struct Date *a, struct Date *b)
{
    struct Date t = *a;
    *a = *b;
    *b = t;
}
int partitionDate(struct Date arr[], int low, int high)
{
    struct Date pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j < high; j++)
        if (compareDate(&arr[j], &pivot))
        {
            i++;
            swapDate(&arr[i], &arr[j]);
        }
    swapDate(&arr[i + 1], &arr[high]);
    return (i + 1);
}
void quickSortDate(struct Date arr[], int low, int high)
{
    if (low < high)
    {
        int pi = partitionDate(arr, low, high);
        quickSortDate(arr, low, pi - 1);
        quickSortDate(arr, pi + 1, high);
    }
}
int main()
{
    clock_t t;
    srand(time(0));
    int s = 10000;
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
    for (int p = 0; p < 10; p++)
    {
        t = clock();
        FILE *ptr;
        char name[20];
        sprintf(name, "d%dk.txt", s / 1000);
        ptr = fopen(name, "r");
        struct Date *a = malloc(s * sizeof *a);
        for (int i = 0; i < s; i++)
        {
            int d;
            char mth[4];
            int yr;
            fscanf(ptr, "%d-%3s-%d\n", &d, mth, &yr);
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
            struct Date x = {d, mint, yr};
            a[i] = x;
        }
        fclose(ptr);
        quickSortDate(a, 0, s - 1);
        t = clock() - t;
        double time_taken = ((double)t) / CLOCKS_PER_SEC;
        printf("Input s: %d; Time(s) for sort only : %f\n", s, time_taken);
        fclose(ptr);
        t=clock();
        sprintf(name, "qd%dk.txt", s / 1000);
        ptr = fopen(name, "w");
        for (int i = 0; i < s; i++)
            fprintf(ptr, "%.2d-%3s-%d\n", a[i].d, mon[a[i].mth], a[i].yr);
        fclose(ptr);
        t = clock() - t;
        double time_taken1 = ((double)t) / CLOCKS_PER_SEC;
        printf("Input s: %d; Time(s) for sort and printing: %f\n", s, time_taken1+time_taken);
        s *= 2;
    }
    return 0;
}