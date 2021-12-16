#lang racket
(provide make-if)

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))