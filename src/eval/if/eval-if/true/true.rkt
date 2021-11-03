#lang racket

(provide true?)

(define (true? x)
  (not (eq? x false)))