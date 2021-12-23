#lang racket
(require "../../eval/quoted/tagged-list/tagged-list.rkt")
(provide primitive-procedure?)

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))