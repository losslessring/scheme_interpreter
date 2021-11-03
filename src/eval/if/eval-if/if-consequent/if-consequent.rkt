#lang racket

(provide if-consequent)

(define (if-consequent exp) (caddr exp))