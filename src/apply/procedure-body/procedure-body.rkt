#lang racket

(provide procedure-body)

(define (procedure-body p) (caddr p))