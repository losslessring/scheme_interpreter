#lang racket

(provide if-predicate)

(define (if-predicate exp) (cadr exp))