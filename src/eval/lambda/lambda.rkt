#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")
(provide lambda?)

(define (lambda? exp) (tagged-list? exp 'lambda))