;---------------VOLUMENES------------------------------
;Volumen de cubo 1
(defun VolumenCubo()
    (princ "Dame el tamaño de un lado: ")
    (setq x(read))
    (if(and (/= x 0) (> x 0))
    (progn
        (format t "Todos los valores son validos.")
        (setq resultado(* 6 (* x x)))
    )
    (progn
        (format t "Hay valores invalidos")    
    )
    )
)
(defun VolumenPrisma()
    (princ "Dame el tamaño del area: ")
    (setq x(read))
    (princ "Dame el tamaño del altura: ")
    (setq y(read))
    (if(and (/= x 0) (/= y 0) (> x 0) (> y 0))
    (progn
        (format t "Todos los valores son validos.")
        (setq resultado(* x y ))
    )
    (progn
        (format t "Hay valores invalidos")    
    )
    )
)
;-----------------AREAS---------------------------------------
;Area cuadrado 1 
(defun AreaCubo()
    (princ "Dame el tamaño de la altura: ")
    (setq a(read))
    (princ "Dame el tamaño del largo: ")
    (setq b(read))
    (if(and (> a 0) (> b 0))
    (progn
        (format t "Los valores son validos")
        (setq resultado(* a b))
    )
    (format t "Alguno de los valores es invalido")
    )
)
