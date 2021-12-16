#lang racket
(provide no-operands?)

(define (no-operands? ops) (null? ops))