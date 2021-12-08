#lang racket

(require "../../last-exp/last-exp.rkt")
(require "../../first-exp/first-exp.rkt")
(require "../make-begin/make-begin.rkt")

(provide sequence->exp)

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))