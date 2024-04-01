#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
struct dateTime
{
    int date;
    int month;
    int year;
    int hour;
    int min;
    int sec;
};
struct date
{
    int date;
    int month;
    int year;
};
void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
int compareDateTime(struct dateTime *a, struct dateTime *b)
{
    if (a->year != b->year)
        return a->year <= b->year;
    if (a->month != b->month)
        return a->month <= b->month;
    if (a->date != b->date)
        return a->date <= b->date;
    if (a->hour != b->hour)
        return a->hour <= b->hour;
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
void bubbleSortDateTime(struct dateTime array[], int size)
{
    for (int step = 0; step < size - 1; ++step)
        for (int i = 0; i < size - step - 1; ++i)
            if (!compareDateTime(&array[i], &array[i + 1]))
            {
                struct dateTime temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
            }
}
void dateAndTimeInputGeneratorBubbleSortTask03(int input_size)
{
}
int main()
{
    clock_t t;
    srand(time(0));
    int input_size = 10000;
    for (int i = 0; i < 10; i++)
    {
        t = clock();
        char months[12][4];
        sprintf(months[0], "Jan");
        sprintf(months[1], "Feb");
        sprintf(months[2], "Mar");
        sprintf(months[3], "Apr");
        sprintf(months[4], "May");
        sprintf(months[5], "Jun");
        sprintf(months[6], "Jul");
        sprintf(months[7], "Aug");
        sprintf(months[8], "Sep");
        sprintf(months[9], "Oct");
        sprintf(months[10], "Nov");
        sprintf(months[11], "Dec");
        FILE *file;
        char fileName[20];
        sprintf(fileName, "dt%dk.txt", input_size / 1000);
        file = fopen(fileName, "r");
        struct dateTime *arr = malloc(input_size * sizeof *arr);
        for (int i = 0; i < input_size; i++)
        {
            int date;
            char month[4];
            int year;

            int hour;
            int min;
            int sec;

            fscanf(file, "%d-%3s-%d %d:%d:%d\n", &date, month, &year, &hour, &min, &sec);
            int monthInt;
            if (strcmp(month, "Jan") == 0)
                monthInt = 0;
            else if (strcmp(month, "Feb") == 0)
                monthInt = 1;
            else if (strcmp(month, "Mar") == 0)
                monthInt = 2;
            else if (strcmp(month, "Apr") == 0)
                monthInt = 3;
            else if (strcmp(month, "May") == 0)
                monthInt = 4;
            else if (strcmp(month, "Jun") == 0)
                monthInt = 5;
            else if (strcmp(month, "Jul") == 0)
                monthInt = 6;
            else if (strcmp(month, "Aug") == 0)
                monthInt = 7;
            else if (strcmp(month, "Sep") == 0)
                monthInt = 8;
            else if (strcmp(month, "Oct") == 0)
                monthInt = 9;
            else if (strcmp(month, "Nov") == 0)
                monthInt = 10;
            else if (strcmp(month, "Dec") == 0)
                monthInt = 11;
            struct dateTime x = {date, monthInt, year, hour, min, sec};
            arr[i] = x;
        }
        fclose(file);
        bubbleSortDateTime(arr, input_size);
        t = clock() - t;
        double time_taken = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s): %f\n", input_size, time_taken);
        t=clock();
        sprintf(fileName, "bdt%dk.txt", input_size / 1000);
        file = fopen(fileName, "w");
        for (int i = 0; i < input_size; i++)
            fprintf(file, "%.2d-%3s-%d %.2d:%.2d:%.2d\n", arr[i].date, months[arr[i].month], arr[i].year, arr[i].hour, arr[i].min, arr[i].sec);
        fclose(file);
        t = clock() - t;
        double time_taken1 = ((double)t) / CLOCKS_PER_SEC;
        printf("Input size: %d; Time(s): %f\n", input_size, time_taken+time_taken1);
        input_size *= 2;
    }
    return 0;
}