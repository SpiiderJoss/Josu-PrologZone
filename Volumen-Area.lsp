(defun Volumen(x y z)
    (if(and (/= x 0) (/= y 0) (/= z 0) (> x 0) (> y 0) (> z 0))
    (progn
        (format t "Todos los valores son validos.")
        (* x y z)
    )
    (progn
        (format t "Hay valores invalidos")    
    )
    )
)

(defun Area(a b)
    (if(and (> a 0) (> b 0))
    (progn
        (format t "Los valores son validos")
        (* a b)
    )
    (format t "Alguno de los valores es invalido")
    )
)