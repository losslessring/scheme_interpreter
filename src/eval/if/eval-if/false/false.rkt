#lang racket

(provide false?)

(define (false? x)
  (eq? x false))