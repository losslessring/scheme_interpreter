#lang racket

(provide enclosing-environment)

(define (enclosing-environment env) (cdr env))