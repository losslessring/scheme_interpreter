#lang racket

(provide assignment-variable)

(define (assignment-variable exp) (cadr exp))