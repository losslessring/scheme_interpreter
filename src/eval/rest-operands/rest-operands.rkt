#lang racket

(provide rest-operands)

(define (rest-operands ops) (cdr ops))