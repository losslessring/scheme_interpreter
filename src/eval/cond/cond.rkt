#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")

(provide cond?)

(define (cond? exp) (tagged-list? exp 'cond))