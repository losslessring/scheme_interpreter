#lang racket

(provide frame-values)

(define (frame-values frame) (cdr frame))