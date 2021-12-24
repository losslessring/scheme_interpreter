#lang racket
(provide procedure-environment)

(define (procedure-environment p) (cadddr p))