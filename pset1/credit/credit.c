#include<stdio.h>
#include<stdlib.h>
#include<cs50.h>

int main(void)
{
    long int num, temp; 
    int sum = 0, n = 0, i, temp2 = 0, f = 0;//f is for flag
    
    //Getting number from user
    num = get_long("Number: ");
    temp = num;
    
// Applying Luhn's Algorithm
    
    while (temp > 0)
    {
        n++;
        //For even places
        if ((n % 2) == 0)
        {
            i = (temp % 10) * 2;
            if (i > 9)
            {
                temp2 = 0;
                for (int j = 0; j < 2; j++)
                {
                    temp2 += (i % 10);
                    i /= 10;
                }
            }
            else
            {
                temp2 = i;
            }
            sum += temp2;
        }
        //For odd Places
        else
        {
            sum += (temp % 10);
        }
        temp /= 10;
    }
    
    temp = num;
    
    //Terminating program if end digit of sum is not 0
    if (sum % 10 != 0)
    {
        printf("INVALID\n");
        return 0;
    }
    
    //Printing company of Card. Also, the flag comes in action here.
    //Checking conditions for American Express
    if (n == 15)
    {
        for (i = 0; i <= 13; i++)
        {
            if ((num / 10) == 34 || (num / 10) == 37)
            {
                printf("AMEX\n");
                f = 1;
            }
            num /= 10;
        }
    }
    //Conditions of VISA
    else if (n == 13 || n == 16)
    {
        for (i = 0; i <= 15; i++)
        {
            if (temp / 10 == 4)
            {
                printf("VISA\n");
                f = 1;
            }
            temp /= 10;
        }
    }
    //Conditions of MASTERCARD
    if (n == 16 && f == 0)
    {
        for (i = 0; i < 14; i++)
        {
            if ((num / 10 == 51) || (num / 10 == 52) || (num / 10 == 53) || (num / 10 == 54) || (num / 10 == 55))
            {
                printf("MASTERCARD\n");
                f = 1;
            }
            num /= 10;
        }
    }
    //Rest all cases invalid.
    if (f == 0)
    {
        printf("INVALID\n");
    }
}