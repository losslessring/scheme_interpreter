#lang racket

(provide lambda-body)

(define (lambda-body exp) (cddr exp))