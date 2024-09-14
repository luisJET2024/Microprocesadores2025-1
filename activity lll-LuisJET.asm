;activity lll
.org 0000H ; en la posicion dado en hexa generamos la primer parte del codigo principal
 LD SP,27FFH ;Hl siendo un par de registros lo cargamos en sp para nuestros msjs
 LD HL,msj1 ;cargamos lo que seria el mensaje a mostrar en este caso el primero solicitando una clave
 CALL showmsj ; donde hacemos condiciones las cuales si no se cumplen salta con la otra en forma secuencial

; generamos un apartado donde almacenamos datos como pularmente lo conocemos como variables 

 .org 0005 ; dirección para datos en decimal

msj1 .DB	"Ingrese su clave: &" ;recordado db como una variable y la caracteristica y el uso de & para limitar hasta donde semostraria el texto al usuario
teclado .equ 01h
pantalla .equ 00h
password .db "1234"

; crearemos la condición secuencial
showmsj:
 ld a,(hl)
 cp '&' ;compara 
 jp z,termina
 out (pantalla),a
 inc hl
 jp showmsj
termina:
ret

;poco profe pero eslo que entendi por ahora gracias por su atención y catedra
.end