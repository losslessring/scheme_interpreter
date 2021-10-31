#lang racket

(require "./enclosing-environment/enclosing-environment.rkt")
(require "./the-empty-environment/the-empty-environment.rkt")
(require "./first-frame/first-frame.rkt")
(require "./frame-variables/frame-variables.rkt")
(require "./frame-values/frame-values.rkt")

(provide lookup-variable-value)

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))