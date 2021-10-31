#lang racket

#|
(require "./assignment-variable/assignment-variable.rkt")
(require "./assignment-value/assignment-value.rkt")
(require "./set-variable-value/set-variable-value.rkt")

(provide eval-assignment)

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)
|#