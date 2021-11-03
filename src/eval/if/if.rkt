#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")

(provide if?)

(define (if? exp) (tagged-list? exp 'if))