#lang racket
(provide primitive-implementation)

(define (primitive-implementation proc) (cadr proc))