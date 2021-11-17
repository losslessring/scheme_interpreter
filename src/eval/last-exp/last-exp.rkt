#lang racket

(provide last-exp?)

(define (last-exp? seq) (null? (cdr seq)))