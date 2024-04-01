#include <stdio.h>
#include <stdlib.h>
#include <time.h>
void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
int main()
{
    clock_t c;
    srand(time(0));
    int s = 10000, j;
    FILE *ptr;
    char name[20];
    for (int i = 0; i < 10; i++)
    {
        c = clock();
        sprintf(name, "i%dk.txt", s / 1000);
        ptr = fopen(name, "r");
        int *a = malloc(s * sizeof *a);
        j = 0;
        while (j < s)
        {
            fscanf(ptr, "%d\n", &a[j]);
            j++;
        }
        int n = s;
        for (int k = 0; k < n - 1; k++)
            for (int j = 0; j < n - 1 - k; j++)
                if (a[j] > a[j + 1])
                    swap(&a[j], &a[j + 1]);
        c = clock() - c;
        double tt = ((double)c) / CLOCKS_PER_SEC;
        printf("Input size : %d \t Time taken for bubblesort only : %f\n", s, tt);
        fclose(ptr);
        c = clock();
        sprintf(name, "bi%dk.txt", s / 1000);
        ptr = fopen(name, "w");
        j = 0;
        while (j < s)
        {
            fprintf(ptr, "%d\n", a[j]);
            ;
            j++;
        }
        fclose(ptr);
        c = clock() - c;
        double tt1 = ((double)c) / CLOCKS_PER_SEC;
        printf("Input size : %d \t Time taken for bubblesort and printing : %f\n", s, tt + tt1);
        s *= 2;
    }
    return 0;
}