#include<stdio.h>

int main(void){
    unsigned int a,b;
    scanf("%d %d",&a,&b);
    if(-a > -b){
        printf("a < b\n");
    }
    else{
        printf("a >= b\n");
    }
    return 0;
}