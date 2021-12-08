#lang racket

(provide cond-predicate)

(define (cond-predicate clause) (car clause))