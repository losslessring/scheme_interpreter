#lang racket

(provide assignment-value)

(define (assignment-value exp) (caddr exp))