#lang racket
(require "../apply-in-underlying-scheme/apply-in-underlying-scheme.rkt")

(provide apply-primitive-procedure)

(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme
   (primitive-implementation proc) args))