.MODEL SMALL
.data
    matriz db 0,0,0,0
           db 0,0,0,0
           db 0,0,0,0
           db 0,0,0,0

.stack 100h
.code

main proc
        mov ax,@data
        mov ds,ax               ;inicia o data

        CALL pega_matriz        ;chama funçao de pegar matriz                
        
        mov ah,2
        mov dl,10               ;pula linha
        int 21h

        CALL escreve_matriz     ;chama funçao para escrever matriz

        mov ah,2
        mov dl,10               ;pula linha
        int 21h

        call escreve_matriz_trans       ;chama funcao para escrever matriz transposta

        mov ah,4ch              ;finaliza o programa
        int 21h
main endp


pega_matriz proc

        xor ax,ax
        xor cx,cx           ;zera registradores
        xor bx,bx

        mov cl,16
        mov ah,01
        
        
            volta1:
                cmp cl,0
                je pula
                
                
                int 21h
                mov matriz[bx],al           ;armazena matriz
                inc bx
                dec cl
                jmp volta1                  ;volta    

            pula:

            ret

pega_matriz endp


escreve_matriz proc

        xor ax,ax
        xor bx,bx
        xor cx,cx           ;zera registradores
        xor dx,dx

        mov AH,2
        mov dl,10           ;pula linha    
        int 21h

        mov ah,02


        volta2:

            cmp bx,16
            jz pula2
            cmp bx,4
            je pula_linha
            cmp bx,8
            je pula_linha           ;verifa contador
            cmp bx,12
            je pula_linha
            jmp print
            
            pula_linha:
            mov ah,2
            mov dl,10               ;pula linha
            int 21h
            
            print:
            mov dl,matriz[bx]       ;printa matriz
            int 21h
            
            mov dl,' '
            int 21h                  ;printa espaco

            inc bx
            jmp volta2               ;volta

        pula2:
            ret                     ;volta pra main

        

escreve_matriz endp

escreve_matriz_trans proc

        xor ax,ax
        xor bx,bx
        xor cx,cx               ;verifa contador
        xor dx,dx
        xor si,si

        mov AH,2
        mov dl,10               ;pula linha
        int 21h


        volta3:

            cmp bx,4            ;verifa contador
            je pula3        

            mov dl,matriz[si][bx]           ;printa matriz
            int 21h

            mov dl,' '
            int 21h                 ;printa espaco



            add si,4
            cmp si,16               ;printa espaco
            je sai
            jmp volta3

            sai:
                mov ah,2
                mov dl,10           ;pula linha
                int 21h

                inc bx
                xor si,si           ;zera registrador
                jmp volta3          ;pula


        pula3:
            ret                     ;volta pra main

escreve_matriz_trans endp

end main




















end main