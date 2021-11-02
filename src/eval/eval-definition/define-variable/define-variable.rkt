#lang racket

(require rnrs/mutable-pairs-6)
(require "../../lookup-variable-value/first-frame/first-frame.rkt")
(require "../../lookup-variable-value/frame-variables/frame-variables.rkt")
(require "../../lookup-variable-value/frame-values/frame-values.rkt")

(require "./add-binding-to-frame/add-binding-to-frame.rkt")

(provide define-variable!)

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (add-binding-to-frame! var val frame))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
      (scan (frame-variables frame)
            (frame-values frame))))