#include<stdio.h>
#include<stdlib.h>

void swap(int *a, int *b) {
    if (a == b) return;  // 如果 a 和 b 指向同一个地址，直接返回

    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;
}

        void sort(int *a, int n){
            //sort a[0] ~ a[n-1]
            for(int i = 0; i < n-1; i++){
                int min = i;
                for(int j = i; j < n; j++){
                    if(a[j] < a[min])
                        min = j;
                }
                if(a[i] != a[min]) {    // 唯一改动处
                    swap(&a[i], &a[min]);                     
                }
               
            }
        }

int main(){
    int a[10] = {5,4,3,2,1,0,9,5,7,5};
    sort(a, 10);
    for(int i = 0; i < 10; i++){
        printf("%d ", a[i]);
    }
    printf("\n");
    return 0;
}