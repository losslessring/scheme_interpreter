#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")

(provide begin?)

(define (begin? exp) (tagged-list? exp 'begin))