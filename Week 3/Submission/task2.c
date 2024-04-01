#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void quickSortMainbyName(char items[][100], int roll[], int count);
void quickSortbyName(char items[][100], int roll[], int left, int right);

void quickSortMainbyName(char items[][100], int roll[], int count)
{
    quickSortbyName(items, roll, 0, count - 1);
}

void quickSortbyName(char items[][100], int roll[], int left, int right)
{
    int i, j;
    char *x;
    char temp[100];

    i = left;
    j = right;
    x = items[(left + right) / 2];

    do
    {
        while ((strcmp(items[i], x) < 0) && (i < right))
        {
            i++;
        }
        while ((strcmp(items[j], x) > 0) && (j > left))
        {
            j--;
        }
        if (i <= j)
        {
            strcpy(temp, items[i]);
            strcpy(items[i], items[j]);
            strcpy(items[j], temp);
            int t = roll[i];
            roll[i] = roll[j];
            roll[j] = t;
            i++;
            j--;
        }
    } while (i <= j);

    if (left < j)
    {
        quickSortbyName(items, roll, left, j);
    }
    if (i < right)
    {
        quickSortbyName(items, roll, i, right);
    }
}

void quicksortbyCredit(int newcredits[], int first, int last, char newcoursename[][100], char newgrade[][100])
{
    int i, j, pivot, temp;
    char s[100];
    if (first < last)
    {
        pivot = first;
        i = first;
        j = last;
        while (i < j)
        {
            while (newcredits[i] <= newcredits[pivot] && i < last)
                i++;
            while (newcredits[j] > newcredits[pivot])
                j--;
            if (i < j)
            {
                temp = newcredits[i];
                newcredits[i] = newcredits[j];
                newcredits[j] = temp;
                strcpy(s, newcoursename[i]);
                strcpy(newcoursename[i], newcoursename[j]);
                strcpy(newcoursename[j], s);
                strcpy(s, newgrade[i]);
                strcpy(newgrade[i], newgrade[j]);
                strcpy(newgrade[j], s);
            }
        }
        temp = newcredits[pivot];
        newcredits[pivot] = newcredits[j];
        newcredits[j] = temp;
        quicksortbyCredit(newcredits, first, j - 1, newcoursename, newgrade);
        quicksortbyCredit(newcredits, j + 1, last, newcoursename, newgrade);
    }
}

void quicksortbyGrade(int newcredits[], int first, int last, char newcoursename[][100], char newgrade[][100])
{
    int i, j, pivot, temp;
    char s[100];
    if (first < last)
    {
        pivot = first;
        i = first;
        j = last;
        while (i < j)
        {
            while (strcmp(newgrade[i],newgrade[pivot])<=0 && i < last)
                i++;
            while (strcmp(newgrade[j],newgrade[pivot])>0)
                j--;
            if (i < j)
            {
                temp = newcredits[i];
                newcredits[i] = newcredits[j];
                newcredits[j] = temp;
                strcpy(s, newcoursename[i]);
                strcpy(newcoursename[i], newcoursename[j]);
                strcpy(newcoursename[j], s);
                strcpy(s, newgrade[i]);
                strcpy(newgrade[i], newgrade[j]);
                strcpy(newgrade[j], s);
            }
        }
        temp = newcredits[pivot];
        newcredits[pivot] = newcredits[j];
        newcredits[j] = temp;
        quicksortbyGrade(newcredits, first, j - 1, newcoursename, newgrade);
        quicksortbyGrade(newcredits, j + 1, last, newcoursename, newgrade);
    }
}


int main()
{
    FILE *ptr1;
    ptr1 = fopen("students01.csv", "r");
    char name[159][100];
    int roll[159];
    int i = 0;
    while (i < 159)
    {
        char sen[100];
        fgets(sen, 100, ptr1);
        strcpy(name[i], sen);
        int j = strlen(name[i]) - 1;
        while (1)
        {
            if (name[i][j] == ',')
                break;
            else
                name[i][j] = '\0';
            j--;
        }
        name[i][j] = '\0';
        j++;
        roll[i] = 0;
        while (sen[j] != '\n')
        {
            roll[i] = roll[i] * 10 + (sen[j] - '0');
            j++;
        }
        i++;
    }
    roll[158] = 180101020;

    FILE *ptr2;
    ptr2 = fopen("courses01.csv", "r");
    int credits[63];
    char coursecode[63][10];
    char coursename[63][100];
    i = 0;
    while (i < 63)
    {
        char sen[100];
        fgets(sen, 100, ptr2);
        int j = 0;
        credits[i] = sen[0] - '0';
        int t = 0;
        j = 2;
        while (sen[j] != ',')
        {
            coursecode[i][t++] = sen[j++];
        }
        j++;
        t = 0;
        while (!(sen[j] == ','))
        {
            coursename[i][t++] = sen[j++];
        }
        i++;
        if (coursename[i][strlen(coursename[i]) - 2] == ' ')
            coursename[i][strlen(coursename[i]) - 2] = '\0';
    }
    FILE *ptr3;
    ptr3 = fopen("grades01.csv", "r");
    i = 0;
    int givenroll[9954];
    char givencode[9954][7];
    char givengrade[9954][6];

    FILE *ptr4;
    ptr4 = fopen("sample4.txt", "w");
    while (i < 9954)
    {
        char sen[100];
        fgets(sen, 100, ptr3);
        int k = strlen(sen);
        for (int j = 0; j < k; j++)
            if (sen[j] == ',')
                sen[j] = ' ';
        fprintf(ptr4, "%s", sen);
        i++;
    }
    i = 0;
    fclose(ptr4);
    FILE *ptr9;
    ptr9 = fopen("sample4.txt", "r");
    FILE *ptr5;
    ptr5 = fopen("sample5.txt", "w");
    while (i < 9954)
    {
        fscanf(ptr9, "%d", &givenroll[i]);
        fscanf(ptr9, "%s", givencode[i]);
        fscanf(ptr9, "%s", givengrade[i]);
        i++;
    }

    // sorting by student's name, using bubble sort
    // char p[100];
    // for (int i = 0; i < 159 - 1; i++)
    // {
    //     for (int j = 0; j < 159 - 1 - i; j++)
    //         if (strcmp(name[j], name[j + 1]) > 0)
    //         {
    //             strcpy(p, name[j]);
    //             strcpy(name[j], name[j + 1]);
    //             strcpy(name[j + 1], p);
    //             int t = roll[j];
    //             roll[j] = roll[j + 1];
    //             roll[j + 1] = t;
    //         }
    // }

    // sorting names using quicksort
    quickSortMainbyName(name, roll, 159);
    int newcredits[9954];
    char newcoursename[9954][100];
    char newname[9954][100];
    char newgrade[9954][10];
    int t = 0;
    for (i = 0; i < 159; i++)
    {
        for (int j = 0; j < 9954; j++)
            if (roll[i] == givenroll[j])
            {
                for (int k = 0; k < 63; k++)
                    if (strcmp(givencode[j], coursecode[k]) == 0)
                    {
                        newcredits[t] = credits[k];
                        strcpy(newname[t], name[i]);
                        strcpy(newcoursename[t], coursename[k]);
                        strcpy(newgrade[t], givengrade[j]);
                        // fprintf(ptr5, "%s , %s , %d , %s\n", newname[t], newcoursename[t], newcredits[t], newgrade[t]);
                        t++;
                    }
            }
    }
    int startindex = 0;
    int endindex = 0;
    int x = 0;

    for (int u = 0; u < 159; u++)
    {

        endindex = startindex + 62;

        // sorting credits by bubble
        for (int i = startindex; i < endindex - startindex + 1 - 1; i++)
        {
            char p[100];
            for (int j = startindex; j < endindex - startindex + 1 - 1 - i; j++)
                if (newcredits[j] < newcredits[j + 1])
                {
                    strcpy(p, newcoursename[j]);
                    strcpy(newcoursename[j], newcoursename[j + 1]);
                    strcpy(newcoursename[j + 1], p);
                    int t = newcredits[j];
                    newcredits[j] = newcredits[j + 1];
                    newcredits[j + 1] = t;
                    strcpy(p, newgrade[j]);
                    strcpy(newgrade[j], newgrade[j + 1]);
                    strcpy(newgrade[j + 1], p);
                }
        }

        startindex += 63;
    }

    startindex = 0;
    endindex = 0;
    x = 0;

    for (int u = 0; u < 159; u++)
    {

        endindex = startindex + 62;

        // sorting grade by bubble
        for (int i = startindex; i < endindex - startindex + 1 - 1; i++)
        {
            char p[100];
            for (int j = startindex; j < endindex - startindex + 1 - 1 - i; j++)
                if (strcmp(newgrade[j], newgrade[j + 1]) < 0)
                {
                    strcpy(p, newcoursename[j]);
                    strcpy(newcoursename[j], newcoursename[j + 1]);
                    strcpy(newcoursename[j + 1], p);
                    int t = newcredits[j];
                    newcredits[j] = newcredits[j + 1];
                    newcredits[j + 1] = t;
                    strcpy(p, newgrade[j]);
                    strcpy(newgrade[j], newgrade[j + 1]);
                    strcpy(newgrade[j + 1], p);
                }
        }

        startindex += 63;
    }

    startindex = 0;
    // for (int u = 0; u < 159; u++)
    // {
    //     endindex = startindex + 62;
    //     quicksortbyCredit(newcredits, startindex, endindex - 1, newcoursename, newgrade);
    //     startindex += 63;
    // }

    for (int u = 0; u < 159; u++)
    {
        endindex = startindex + 62;
        quicksortbyGrade(newcredits, startindex, endindex - 1, newcoursename, newgrade);
        startindex += 63;
    }

    for (int j = 0; j < 9954; j++)
        fprintf(ptr5, "%s , %s , %d , %s\n", newname[j], newcoursename[j], newcredits[j], newgrade[j]);
    return 0;
}