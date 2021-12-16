#lang racket

(provide operands)

(define (operands exp) (cdr exp))