#lang racket

(provide begin-actions)

(define (begin-actions exp) (cdr exp))