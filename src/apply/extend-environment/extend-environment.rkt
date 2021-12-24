#lang racket

(require "../make-frame/make-frame.rkt")

(provide extend-environment)

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
  (cons (make-frame vars vals) base-env)
  (if (< (length vars) (length vals))
      (error "Got too many arguments" vars vals)
      (error "Got too few arguments" vars vals))))