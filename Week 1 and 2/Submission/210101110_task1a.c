#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main()
{
    int s = 10000, r, j;
    srand(time(0));
    char name[100];
    for (int i = 0; i < 10; i++)
    {
        int r = s / 1000;
        FILE *ptr;
        sprintf(name, "i%dK.txt", r);
        ptr = fopen(name, "w");
        j = 0;
        while (j < s)
        {
            r = rand() % 1000005;
            fprintf(ptr, "%d\n", r);
            j++;
        }
        s *= 2;
        fclose(ptr);
    }
    return 0;
}
