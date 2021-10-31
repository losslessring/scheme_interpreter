#lang racket

(require rnrs/mutable-pairs-6)
(require "../../lookup-variable-value/enclosing-environment/enclosing-environment.rkt")
(require "../../lookup-variable-value/the-empty-environment/the-empty-environment.rkt")
(require "../../lookup-variable-value/first-frame/first-frame.rkt")
(require "../../lookup-variable-value/frame-variables/frame-variables.rkt")
(require "../../lookup-variable-value/frame-values/frame-values.rkt")

(provide set-variable-value!)

(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable --SET!" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

