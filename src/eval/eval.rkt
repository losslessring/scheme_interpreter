#lang racket

(require "./eval-assignment/assignment-variable/assignment-variable.rkt")
(require "./eval-assignment/assignment-value/assignment-value.rkt")
(require "./eval-assignment/set-variable-value/set-variable-value.rkt")

(require "./eval-definition/define-variable/define-variable.rkt")
(require "./eval-definition/definition-variable/definition-variable.rkt")
(require "./eval-definition/definition-value/definition-value.rkt")

(require "./self-evaluating/self-evaluating.rkt")
(require "./variable/variable.rkt")
(require "./quoted/quoted.rkt")
(require "./lookup-variable-value/lookup-variable-value.rkt")
(require "./text-of-quotation/text-of-quotation.rkt")
(require "./assignment/assignment.rkt")
(require "./definition/definition.rkt")
(require "./if/if.rkt")

(require "./if/eval-if/true/true.rkt")
(require "./if/eval-if/false/false.rkt")
(require "./if/eval-if/if-predicate/if-predicate.rkt")
(require "./if/eval-if/if-consequent/if-consequent.rkt")
(require "./if/eval-if/if-alternative/if-alternative.rkt")

(require "./lambda/lambda.rkt")
(require "./make-procedure/make-procedure.rkt")
(require "./lambda-parameters/lambda-parameters.rkt")
(require "./lambda-body/lambda-body.rkt")
(require "./begin/begin.rkt")
(require "./last-exp/last-exp.rkt")
(require "./first-exp/first-exp.rkt")
(require "./rest-exps/rest-exps.rkt")
(require "./begin-actions/begin-actions.rkt")

(require "./cond/cond.rkt")
(require "./cond/cond-if/cond-if.rkt")

(require "./application/application.rkt")
(require "./operator/operator.rkt")
(require "./list-of-values/list-of-values.rkt")
(require "./operands/operands.rkt")

(require "../apply/primitive-procedure/primitive-procedure.rkt")
(require "../apply/apply-primitive-procedure/apply-primitive-procedure.rkt")
(require "../apply/compound-procedure/compound-procedure.rkt")
(require "../apply/procedure-body/procedure-body.rkt")
(require "../apply/extend-environment/extend-environment.rkt")
(require "../apply/procedure-parameters/procedure-parameters.rkt")
(require "../apply/procedure-environment/procedure-environment.rkt")



(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (evaluate (assignment-value exp) env)
                       env)
  'ok)

(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
    (evaluate (definition-value exp) env)
    env)
  'ok)

(define (eval-if exp env)
  (if (true? (evaluate (if-predicate exp) env))
      (evaluate (if-consequent exp) env)
      (evaluate (if-alternative exp) env)))

(define (eval-sequence exps env)
  (cond ((last-exp? exps) (evaluate (first-exp exps) env))
        (else (evaluate (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

(define (appl procedure arguments)
  (cond ((primitive-procedure? procedure)
           (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
           (eval-sequence
             (procedure-body procedure)
             (extend-environment
                (procedure-parameters procedure)
                arguments
                (procedure-environment procedure))))
        (else
           (error
            "Unknown procedure type -- APPLY" procedure))))

(define (evaluate exp env)
  (cond ((self-evaluating? exp) exp)
       ((variable? exp) (lookup-variable-value exp env))
       ((quoted? exp) (text-of-quotation exp))
       ((assignment? exp) (eval-assignment exp env))
       ((definition? exp) (eval-definition exp env))
       ((if? exp) (eval-if exp env))
       ((lambda? exp)
        (make-procedure (lambda-parameters exp)
                        (lambda-body exp)
                        env))
       ((begin? exp)
        (eval-sequence (begin-actions exp) env))
       ((cond? exp) (eval (cond->if exp) env))
       ((application? exp)
        (appl (eval (operator exp) env)
               (list-of-values (operands exp) env)))
       (else
          (error "Unknown expression type -- EVAL" exp))))