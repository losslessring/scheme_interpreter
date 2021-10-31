#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")

(provide assignment?)

(define (assignment? exp)
  (tagged-list? exp 'set!))