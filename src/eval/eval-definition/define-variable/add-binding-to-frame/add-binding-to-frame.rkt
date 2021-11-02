#lang racket

(require rnrs/mutable-pairs-6)

(provide add-binding-to-frame!)

(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame))))