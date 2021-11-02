#lang racket

(require "./make-lambda/make-lambda.rkt")

(provide definition-value)

(define (definition-value exp)
  (if (symbol? (cadr exp))
      (caddr exp)
      (make-lambda (cdadr exp)
                   (cddr exp))))