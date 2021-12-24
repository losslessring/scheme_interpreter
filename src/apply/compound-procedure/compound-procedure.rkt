#lang racket
(require "../../eval/quoted/tagged-list/tagged-list.rkt")

(provide compound-procedure?)

(define (compound-procedure? p)
  (tagged-list? p 'procedure))