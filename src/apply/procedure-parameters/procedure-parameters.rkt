#lang racket

(provide procedure-parameters)

(define (procedure-parameters p) (cadr p))