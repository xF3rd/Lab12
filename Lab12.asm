.MODEL SMALL
.stack 100h
.data
    matriz  db        ?,?,?,?
            db        ?,?,?,?
            db        ?,?,?,?
            db        ?,?,?,?

    msg db 10,"numero: ",10,"$"
.code
main proc
        mov ax,@data
        mov ds,ax

        CALL pega_matriz
        CALL escreve_matriz

        mov ah,4ch
        int 21h
main endp


pega_matriz proc

        xor ax,ax
        xor cx,cx
        mov cl,16
        xor bl,bl
        
            volta1:
                cmp cl,0
                je pula
                mov ah,09
                mov dx,offset msg
                int 21h
                mov ah,01
                int 21h
                mov matriz[bx],al
                inc bx
                dec cl
                jmp volta1

            pula:

            ret

pega_matriz endp


escreve_matriz proc
        mov cl,16
        xor bl,bl
        volta2:

            cmp cl,0
            je pula2
            
            mov dl,matriz[bx]

            mov ah,02
            int 21h
            inc bl
            jmp volta2

        pula2:
            ret

        

escreve_matriz endp
end main




















end main