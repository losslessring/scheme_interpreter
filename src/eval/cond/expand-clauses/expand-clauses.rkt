#lang racket

(require "../cond-else-clause/cond-else-clause.rkt")
(require "../sequence-exp/sequence-exp.rkt")
(require "../cond-actions/cond-actions.rkt")

(provide expand-clauses)

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE branch is not the last --COND->IF"
                       clauses))
            (make-if (cond-predicate first)
                     (sequence->exp (cond-action first))
                     (expand-clauses rest))))))