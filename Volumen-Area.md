;---------------AREAS Y VOLUMENES------------------------------
;Area y volumen de Cubo

;Funciones lambda
(defvar *ACubo* (lambda (x) (* 6(* x x))))
(defvar *VCubo* (lambda (x) (* x x x)))

(defun AVCubo()
    (princ "-----------Area y Volumen de cubo------------------")
    (terpri)
    (princ "Dame el tamaño de un lado: ")
    (setq x(read))
    (if(and (/= x 0) (> x 0))
    (progn
        (princ "El area del cubo es: ")
        (write (funcall *ACubo* x))
        (terpri)
        (terpri)
        (princ "El volumen del cubo es: ")
       (write (funcall *VCubo* x))
        (terpri)
    )
    (progn
        (format t "Hay valores invalidos")    
    )
    )
)
;Area y volumen de Prisma rectangular

;funciones lambda
(defvar *APrismaR* (lambda (x y z) (* 2 (+ (* x y) (* x z) (* y )))))
(defvar *VPrismaR* (lambda (x y z) (* x y z)))

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
        (write (funcall *APrismaR* x y z))
        (terpri)
        (princ "El volumen del prisma es: ")
        (write (funcall *VPrismaR* x y z))
        (terpri)
    )
    )
    )
;Area y Volumen de Circulo 

;funciones lambda circulo
(defvar *ACilindro* (lambda (a b) (* 2 pi a b)))
(defvar *VCilindro* (lambda (a b) (* pi(* a a ) b)))

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
        (write (funcall *ACilindro* a b))
        (terpri)
        (princ "El volumen del Cilindro es: ")
        (write (funcall *VCilindro* a b))
        (terpri)
    )
    (format t "Alguno de los valores es invalido")
    )
    )
;Area de Piramide equilatera

;funciones lambda priamide equilatera
(defvar *ABPE* (lambda (longB) (/ (* (sqrt 3) longB longB) 4)))
(defvar *PBPE* (lambda (longB) (* 3 longB)))
(defvar *ASPE* (lambda (longB a) (+ (funcall *ABPE* longB) (* 0.5 (funcall *PBPE* longB) a) )))
(defvar *VP* (lambda (longB a) (/ (* (funcall *ABPE* longB)) 3)))

(defun AVPiramide()
    (princ "-----------Area y Volumen de piramide equilatera------------------")
    (terpri)    
    (princ "Dame la longitud de la base: ")
    (setq longB(read))
    (terpri)
    (princ "Dame el altura de la piramide: ")
    (setq a(read))
    (terpri)
    (if(and (> longB 0) (> a))
    (progn
        (princ "El area de la superficie es: ")
        (write (funcall *ASPE* longB a))
        (terpri)

        (princ "El volumen de la piramide es: ")
        (write (funcall *VP* longB a))
        (terpri)
    )
    )
)

;Area y volumen de cono
;funciones lambda 
(defvar *GMatriz* (lambda (raco alton) (sqrt (+ (* raco raco) (* altcon altcon)))))
(defvar *ACono* (lambda ( pi raco altcon) (* pi raco (+ raco (funcall *GMatriz* raco altcon)))))
(defvar *VCono* (lambda (pi raco altcon) (/ (* pi (* raco raco) altcon) 3)))

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
            (princ "El area del cono es: ")
            (write (funcall *ACono* pi raco altcon ))
            (terpri)
            (princ "El volumen del cono es: ")
            (write (funcall *VCono* pi raco altcon))
            (terpri)
        )
    )
)
;Area y volumen de una Esfera
;funciones lambda
(defvar *AEsfera* (lambda (pi radio) (* 4 pi (* radio radio))))
(defvar *VEsfera* (lambda (pi radio) (* (/ 4 3) pi (* radio radio radio))))

(defun AVEsfera()
    (princ "-----------Area y Volumen de una Esfera------------------")
    (terpri) 
    (princ "Dame el radio de la esfera: ")
    (setq radio(read))
    (terpri)
    (if (> radio 0)
        (progn
            (princ "El area de la esfera es: ")
            (write (funcall *AEsfera* pi radio))
            (terpri)
            (princ "El volumen de la esfera es: ")
            (write (funcall *VEsfera* pi raco))
            (terpri)
        )
    )
)

;Piramide Hexagonal
;funciones lambda

(defvar *ABPH* (lambda (longbase) (* (/ (* 3 (sqrt 3)) 2) (* longbase longbase))))
(defvar *ALPH* (lambda (longbase altura) (* (/ (* 3 (sqrt 3)) 2) longbase altura)))
(defvar *ATPH* (lambda (longbase altura) (+ (funcall *ABPH* longbase) (* 6 (funcall *ALPH* longbase altura)))))
(defvar *VPH* (lambda (longbase altura) (/ (* (funcall *ABPH* longbase) altura))))

(defun AVPirHex()
    (princ "-----------Area y Volumen de una Piramide Hexagonal------------------")
    (terpri)
    (princ "Dame la longitud de un lado de la base: ")
    (setq longbase(read))
    (terpri)
    (princ "Dame el altura de la piramide: ")
    (setq altura(read))
    (terpri)
    (if(and (> longbase 0) (> altura 0))
        (progn
            (princ "El area de la piramide hexagonal es: ")
            (write (funcall *ATPH* longbase altura))
            (terpri)
            (princ "El volumen es: ")
            (write (funcall *VPH* longbase altura))
        )
    )
)
;Prisma Triangular
;funciones lambda 
(defvar *APT* (lambda (perB altPT) (* perB altPT)))
(defvar *ABPT* (lambda (altB perB) (* 2 (/ (* altB perB) 2))))
(defvar *ATPT* (lambda (altB perB) (+ (funcall *APT* perb altPT) (* (funcall *ABPT* perB altB) 2))))
(defvar *VPT* (lambda (altPT) (* (funcall *ABPT* altB perB) altPT)))

(defun AVPrismaTr()
    (princ "-----------Area y Volumen de un prisma triangular------------------")
    (terpri)
    (princ "dame el perimetro de la base: ")
    (setq perB(read))
    (terpri)
    (princ "Dame la altura de la base: ")
    (setq altB(read))
    (terpri)
    (princ "Dame la altura del Prisma Triangular: ")
    (setq altPT(read))
    (terpri)
    (if(and (> perB 0) (> altB 0) (> altPT 0))
        (progn
            (princ "El area del prisma triangular es: ")
            (write (funcall *ATPT* altB perB))
            (terpri)
            (princ "El volumen del prisma triangular es: ")
            (write (funcall *VPT* altPT))
            (terpri)
        )
    )
)


;Prisma hexagonal
(defun VAPrHEx()
    (princ "-----------Area y Volumen de un prisma HEXAGONAL------------------")
    (terpri)
    (princ "dame la longitud de uno de los lados de la base: ")
    (setq Lbhex(read))
    (terpri)
    (princ "Dame la altura del prisma: ")
    (setq altPHex(read))
    (terpri)

    (if (and (> Lbhex 0) (> altPHex 0))
        (progn
            (setq AreaBaseHex(* (* Lbhex Lbhex) (/ (* 3 (sqrt 3)) 2)))
            (setq AreaTHex(* 6 AreaBaseHex))
            (princ "El area del prisma hexagonal: ")
            (write AreaTHex)
            (terpri)
            (princ "El volumen del prisma hexagonal es: ")
            (setq VolHex(* AreaBaseHex altPHex))
            (write VolHex)
            (terpri)
        )
    )

)


