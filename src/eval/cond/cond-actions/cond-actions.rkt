#lang racket

(provide cond-actions)

(define (cond-actions clause) (cdr clause))