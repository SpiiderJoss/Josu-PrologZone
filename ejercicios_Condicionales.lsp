(defun Ej1()
    (princ "Cuantos pantalones quieres comprar: ")
    (setq pantalones(read))
    (terpri)
    (when (< pantalones 5)
            (princ "Pantalones a precio normal.")
            (terpri)
    )
    (when (and (>= pantalones 5) (< pantalones 12))
        (princ "Descuento de 15% en cada pantalon.")
        (terpri)
    )
    (when (> pantalones 12)
        (princ "Descuento de 30% en cada pantalón. ")
        (terpri)
    )
)  

(defun Ej2()
    (princ "Escribe el nombre: ")
    (setq Nom(read))
    (terpri)
    (princ "Historia crediticia (bueno o mala): ")
    (setq histC(read))
    (terpri)
    (princ "Cantidad pedida: ")
    (setq cantidad(read))
    (terpri)
    (princ "Salario anual: ")
    (setq salarioA(read))
    (terpri)
    (princ "Valor de otras propiedades: ")
    (setq ValorOP(read))
    (terpri)

    (when (equal histC "bueno" )
        (when (>= salario (* cantidad 0.5))
            (setq (+ contador 5))
        )
        (when (and (< salario (* cantidad 0.25)) (>= salario (* cantidad 0.25)))
            (setq (+ contador 3))
        )
        (when (and (< salario (* cantidad 0.25)) (>= salario (* cantidad 0.10)))
            (setq (+ contador 3))
        )
        (when (>= ValorOP (* cantidad 2))
            (setq (+ contador 5))
        )
        (when (and (>= ValorOP cantidad) (< ValorOP (* cantidad 2)))
            (setq (+ contador 3))
        )

        (when (> contador 5)
            (princ "El prestamo puede ser solicitado ")
            (terpri )
            (write contador)
        )
    )
    (unless (equal histC "malo" )
        (princ "No se puede realizar el prestamo por historial malo")
    )

)

(defun Ej3()
    (princ "Dame una letra minuscula :")
    (setq letra(read-char))
        (if (equal letra (char-downcase letra))
            (progn 
                (case letra
                ((#\a #\e #\i #\o #\u) (format t "La letra ~a es una vocal.~%" letra))
                (#\y (format t "La letra ~a es una semivocal.~%" letra))
                (t (format t "La letra ~a es una consonante.~%" letra))
                )
            )
            (princ "la letra debe ser minuscula. ") 
        )
)

(defun Ej4()
    (princ "Dame el año para determinar si es bisiesto o no.")
    (setq año(read))
    (terpri)
    

)