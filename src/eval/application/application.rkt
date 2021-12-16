#lang racket

(provide application?)

(define (application? exp) (pair? exp))