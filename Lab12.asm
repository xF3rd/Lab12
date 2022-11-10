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
        mov ds,ax

        CALL pega_matriz
        
        mov ah,2
        mov dl,10
        int 21h

        CALL escreve_matriz

        mov ah,4ch
        int 21h
main endp


pega_matriz proc

        xor ax,ax
        xor cx,cx
        xor bx,bx

        mov cl,16
        mov ah,01
        
        
            volta1:
                cmp cl,0
                je pula
                
                
                int 21h
                mov matriz[bx],al
                inc bx
                dec cl
                jmp volta1

            pula:

            ret

pega_matriz endp


escreve_matriz proc

        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor dx,dx

        mov AH,2
        mov dl,10
        int 21h

        mov ah,02


        volta2:

            cmp bx,16
            jz pula2
            cmp bx,4
            je pula_linha
            cmp bx,8
            je pula_linha
            cmp bx,12
            je pula_linha
            jmp print
            
            pula_linha:
            mov ah,2
            mov dl,10
            int 21h
            
            print:
            mov dl,matriz[bx]
            int 21h
            
            mov dl,' '
            int 21h

            inc bx
            jmp volta2

        pula2:
            ret

        

escreve_matriz endp
end main




















end main