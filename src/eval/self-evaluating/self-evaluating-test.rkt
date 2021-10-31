#lang racket

(require rackunit
         "self-evaluating.rkt")

(check-equal? (self-evaluating? 1) true "Is expression a Number?")

(check-equal? (self-evaluating? "Apple") true "Is expression a String?")

(check-equal? (self-evaluating? 'apple) false "Is expression not a Number or String?")