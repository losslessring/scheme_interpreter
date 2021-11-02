#lang racket

(provide definition-variable)

(define (definition-variable exp)
  (if (symbol? (cadr exp))
  (cadr exp)
  (caadr exp)))