#lang racket

(require "./tagged-list/tagged-list.rkt")

(provide quoted?)

(define (quoted? exp)
  (tagged-list? exp 'quote))