#lang racket

(provide make-frame)

(define (make-frame variables values)
  (cons variables values))