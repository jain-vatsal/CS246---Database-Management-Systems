int d = rand() % 31 + 1;
            int mth = rand() % 12;
            int yr = rand() % 57 + 1947;
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
            fprintf(ptr, "%.2d-%s-%d\n", d, mon[mth], yr);