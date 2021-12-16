#lang racket
(provide cond-clauses)

(define (cond-clauses exp) (cdr exp))