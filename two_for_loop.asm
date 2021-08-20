#include <stdio.h>

int main(){

    int A; // $s1
    int B = 0; // $s2
    int I = 10; // $t1
    int temp = 0; // $t2

    while (1){
        if (0 < I){
            temp = 1;
        }
        else temp = 0;
        if (temp == 0) break;
        I--;
        B += 2;
        printf("%d\n", I);
    }

    printf("%d", B);

    return 0;
}