#lang racket

(provide rest-exps)

(define (rest-exps seq) (cdr seq))