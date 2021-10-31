#lang racket

(provide frame-variables)

(define (frame-variables frame) (car frame))