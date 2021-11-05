#lang racket

(provide lambda-parameters)

(define (lambda-parameters exp) (cadr exp))