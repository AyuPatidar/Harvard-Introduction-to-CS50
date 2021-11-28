#include<stdio.h>
#include<cs50.h>
int main(void)
{
    //getting name from user
    string ans = get_string("What is your name?");
    printf("Hello, %s\n", ans);
}