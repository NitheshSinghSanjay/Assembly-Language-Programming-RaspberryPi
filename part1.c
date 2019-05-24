#include <stdio.h>
#include <string.h>

int check_password(char passwd[]){
    char pass[4] = "aX2";
    int check = 0;
    
    if(pass[0] == passwd[0]){
        check = check + 100;
    }
    
    if(pass[1] == passwd[1]){
        check = check + 10;
    }
    
    if(pass[2] == passwd[2]){
        check = check + 1;
    }
    
    return check;
}

int main()
{
    char smallAlpha[27] = "abcdefghijklmnopqrstuvwxyz";
    char largeAlpha[27] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    char num[11] = "0123456789";
    int validPass = 0;
    
    
    for(int i=0; i<strlen(smallAlpha); i++){
        for(int j=0; j<strlen(largeAlpha); j++){
            for(int k=0; k<10; k++){
                    char message[] = "";
                    char sa[2];
                    sa[0] = smallAlpha[i];
                    strcpy(message, sa);
                    
                    char message2[] = "";
                    char la[2];
                    la[0] = largeAlpha[j];
                    strcpy(message2, la);
                    
                    strcat(message, message2);
                    
                    char message3[] = "";
                    sprintf(message3, "%d", k);
                    // strcpy(message3, );
                    // message3 = num[0];
                    
                    strcat(message, message3);
                    
                    int check = check_password(message);
                    
                    if(check == 111){
                        printf("password found\n");
                        printf("%s", message);
                    }
                    
            }
        }
    }
    
    return 0;
}