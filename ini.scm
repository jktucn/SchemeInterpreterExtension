(define (eqv? x y)
	(if (and (number? x) (number? y))
		(= x y)
		(eq? x y)))
		
(define (equal? x y)
	(cond 	((eqv? x y) #t)
			((and 	(pair? x)
					(pair? y) 
					(equal? (car x) (car y))
					(equal? (cdr x) (cdr y))) #t)
			(else #f)))
			
(define (= . l)
	(if (null? l) #t
		(and (b= (car l) (apply = (cdr l))))))

(define (= x y . l)
		(cond 	((not (eqv? x y)) #f)
				((null? l) #t)
				(else (apply = (cons y l)))))
		
