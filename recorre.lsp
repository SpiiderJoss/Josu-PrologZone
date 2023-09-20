(defun recorre(lista)
    (if (null lista)
        (progn
            (princ "fin xd")
        )
    )
    (progn
        (princ (car lista))
        (recorre (cdr lista))
    )
)