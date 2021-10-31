#lang racket

(require rackunit
         "the-empty-environment.rkt")

(check-equal? the-empty-environment '() "The empty environment")