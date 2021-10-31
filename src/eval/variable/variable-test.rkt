#lang racket

(require rackunit
         "variable.rkt")

(check-equal? (variable? 'apple) true "Is expression a Symbol?")