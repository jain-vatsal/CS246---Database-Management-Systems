#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int partition(int A[], int low, int high)
{
    int pivot = A[low];
    int i = low + 1;
    int j = high;
    int temp;
    do
    {
        while (A[i] <= pivot)
        {
            i++;
        }

        while (A[j] > pivot)
        {
            j--;
        }

        if (i < j)
        {
            temp = A[i];
            A[i] = A[j];
            A[j] = temp;
        }
    } while (i < j);

    // Swap A[low] and A[j]
    temp = A[low];
    A[low] = A[j];
    A[j] = temp;
    return j;
}

void quickSort(int A[], int low, int high)
{
    int partitionIndex; // Index of pivot after partition

    if (low < high)
    {
        partitionIndex = partition(A, low, high);
        quickSort(A, low, partitionIndex - 1);  // sort left subarray
        quickSort(A, partitionIndex + 1, high); // sort right subarray
    }
}
int main()
{
    int size = 10000, j;
    clock_t c;
    srand(time(0));
    for (int i = 0; i < 10; i++)
    {
        int *arr = malloc(size * sizeof *arr);
        c = clock();
        FILE *ptr;
        char name[20];
        sprintf(name, "i%dk.txt", size / 1000);
        ptr = fopen(name, "r");
        j = 0;
        while (j < size)
        {
            fscanf(ptr, "%d\n", &arr[j]);
            j++;
        }
        quickSort(arr, 0, size - 1);
        c = clock() - c;
        double time_taken = ((double)c) / CLOCKS_PER_SEC;
        printf("Input size : %d \t Time taken for quicksort only: %f\n", size, time_taken);
        fclose(ptr);
        char outname[20];
        c = clock();
        sprintf(outname, "qi%dk.txt", size / 1000);
        ptr = fopen(outname, "w");
        j = 0;
        while (j < size)
        {
            fprintf(ptr, "%d\n", arr[j]);
            j++;
        }
        fclose(ptr);
        c = clock() - c;
        double time_taken1 = ((double)c) / CLOCKS_PER_SEC;
        printf("Input size : %d \t Time taken for quicksort and printing: %f\n", size, time_taken1 + time_taken);
        size *= 2;
    }
    return 0;
}