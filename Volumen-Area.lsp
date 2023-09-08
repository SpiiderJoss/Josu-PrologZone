;---------------AREAS Y VOLUMENES------------------------------
;Area y volumen de Cubo
(defun AVCubo()
    (princ "-----------Area y Volumen de cubo------------------")
    (terpri)
    (princ "Dame el tamaño de un lado: ")
    (setq x(read))
    (if(and (/= x 0) (> x 0))
    (progn
        (princ "El area del cubo es: ")
        (write (* 6(* x x)))
        (terpri)
        (terpri)
        (princ "El volumen del cubo es: ")
        (write (* x x x))
        (terpri)
    )
    (progn
        (format t "Hay valores invalidos")    
    )
    )
)
;Area y volumen de Prisma rectangular
(defun AVPrisma()
    (princ "-----------Area y Volumen de prisma rectangular------------------")
    (terpri)
    (princ "Dame el tamaño del largo: ")
    (setq x(read))
    (princ "Dame el tamaño del ancho: ")
    (setq y(read))
    (princ "Dame el tamaño de la altura: ")
    (setq z(read))
    (terpri)
    (if(and (/= x 0) (/= y 0) (> x 0) (> y 0) (/= z 0) (> z 0))
    (progn
        (princ "El area del Prisama es: ")
        (write (* 2 (+ (* x y) (* x z) (* y z))))
        (terpri)
        (princ "El volumen del prisma es: ")
        (write (* x y z))
        (terpri)
    )
    )
    )
;Area y Volumen de Circulo 
(defun AVCirculo()
    (princ "-----------Area y Volumen de circulo/Cilindro------------------")
    (terpri)
    (princ "Dame el tamaño del radio: ")
    (setq a(read))
    (princ "Dame el tamaño de la altura: ")
    (setq b(read))
    (terpri)
    (if(and (> a 0) (> b 0))
    (progn
        (princ "El area del Cilindro es: ")
        (setq area(* 2 pi a b))
        (write area)
        (terpri)
        (princ "El volumen del Cilindro es: ")
        (setq volumen(* pi(* a a ) b))
        (write volumen)
        (terpri)
    )
    (format t "Alguno de los valores es invalido")
    )
    )
;Area de Piramide equilatera

(defun AVPiramide()
    (princ "-----------Area y Volumen de circulo/Cilindro------------------")
    (terpri)    
    (princ "Dame la longitud de la base: ")
    (setq longitud(read))
    (terpri)
    (princ "Dame el altura de la piramide: ")
    (setq altpi(read))
    (terpri)
    (if(and (> longitud 0) (> altpi))
    (progn
        (princ "El area de la superficie es: ")
        (setq areabase(/ (* (sqrt 3) longitud longitud) 4))
        (setq perminetrobase(* 3 longitud))
        (setq areasuperficie(+ areabase (* 0.5 perminetrobase altpi)))
        (write areasuperficie)
        (terpri)

        (princ "El volumen de la piramide es: ")
        (setq volumen(/ (* areabase altpi) 3))
        (write volumen)
        (terpri)
    )
    )
)

;Area y volumen de cono
(defun AVCono()
    (princ "-----------Area y Volumen de Cono------------------")
    (terpri)    
    (princ "Dame el radio del cono: ")
    (setq raco(read))
    (terpri)
    (princ "Dame la altura del cono: ")
    (setq altcon(read))
    (terpri)

    (if (and (> raco 0) (> altcon 0))
        (progn
            (setq generatriz(sqrt (+ (* raco raco) (* altcon altcon))))
            (setq areaCono(* pi raco (+ raco generatriz)))
            (princ "El area del cono es: ")
            (write areaCono)
            (terpri)
            (princ "El volumen del cono es: ")
            (setq volCono(/ (* pi (* raco raco) altcon) 3))
            (write volCono)
            (terpri)
        )
    )
)
;Area y volumen de una Esfera
(defun AVEsfera()
    (princ "-----------Area y Volumen de una Esfera------------------")
    (terpri) 
    (princ "Dame el radio de la esfera: ")
    (setq radio(read))
    (terpri)
    (if (> radio 0)
        (progn
            (princ "El area de la esfera es: ")
            (setq area(* 4 pi (* radio radio)))
            (write area)
            (terpri)
            (princ "El volumen de la esfera es: ")
            (setq volumen(* (/ 4 3) pi (* radio radio radio)))
            (write volumen)
            (terpri)
        )
    )
)


