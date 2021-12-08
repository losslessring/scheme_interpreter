#lang racket

(provide make-begin)

(define (make-begin seq) (cons 'begin seq))