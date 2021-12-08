#lang racket

(require "../cond-predicate/cond-predicate.rkt")
(provide cond-else-clause?)

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))