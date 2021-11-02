#lang racket

(require "../quoted/tagged-list/tagged-list.rkt")

(provide definition?)

(define (definition? exp)
  (tagged-list? exp 'define))