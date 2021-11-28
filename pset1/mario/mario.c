#include<stdio.h>
#include<cs50.h>

void print_block(int, int);
int main(void)
{
    int height;
    // Prompting user to enter height between 1 & 8
    do
    {
        do
        {
            height = get_int("Height: ");
        }
        while (height>8);
    }
    while (height<1);
    
    for(int i = 1; i <= height; i++)
    {
        for(int k = 0; k < height-i ; k++)
        {
            printf(" ");
        }
        
        //builds part of 1st pyramid
        print_block(height, i);
        
        printf("  ");
        
        //builds part of 2nd pyramid
        print_block(height, i);
        
        printf("\n");
    }
}
void print_block(int height, int i)
{
    for(int j = 1; j <= i; j++)
    {
        printf("#");
    }
}