;;; packages.el --- common-lisp-sly layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Antony Blakey <antony@tallis.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `common-lisp-sly-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `common-lisp-sly/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `common-lisp-sly/pre-init-PACKAGE' and/or
;;   `common-lisp-sly/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst common-lisp-sly-packages
  '(
     sly
     sly-company
     evil-cleverparens
     )
  )

(defun common-lisp-sly/init-sly ()
  "Initialize sly"
  (use-package sly
    :init
    (progn
      (spacemacs/register-repl 'sly 'sly))
    :config
    (spacemacs/set-leader-keys-for-major-mode 'lisp-mode
      "'" 'sly

      "cc" 'sly-compile-file
      "cC" 'sly-compile-and-load-file
      "cl" 'sly-load-file
      "cf" 'sly-compile-defun
      "cr" 'sly-compile-region
      "cn" 'sly-remove-notes

      "eb" 'sly-eval-buffer
      "ed" 'sly-eval-defun
      "eu" 'sly-undefine-function
      "ee" 'sly-eval-last-expression
      "er" 'sly-eval-region
      "ef" 'sly-eval-file
      "eo" 'sly-eval-last-expression-display-output
      "ep" 'sly-eval-print-last-expression

      "gb" 'sly-pop-find-definition-stack
      "gd" 'sly-edit-definition
      "gn" 'sly-next-note
      "gN" 'sly-previous-note

      "ha" 'sly-apropos
      "hA" 'sly-apropos-all
      "hb" 'sly-who-binds
      "hd" 'sly-disassemble-symbol
      "hD" 'sly-documentation-lookup
      "hh" 'sly-describe-symbol
      "hH" 'sly-hyperspec-lookup
      "hf" 'sly-describe-function
      "hp" 'sly-apropos-package
      "ht" 'sly-toggle-trace-fdefinition
      "hT" 'sly-untrace-all
      "h<" 'sly-who-calls
      "h>" 'sly-calls-who
      ;; TODO: Add key bindings for who binds/sets globals?
      "hr" 'sly-who-references
      "hm" 'sly-who-macroexpands
      "hs" 'sly-who-specializes
      "hS" 'sly-who-sets

      "ma" 'sly-macroexpand-all
      "mo" 'sly-macroexpand-1

      "se" 'sly-eval-last-expression-in-repl
      "si" 'sly
      "sq" 'sly-quit-lisp

      "tf" 'sly-toggle-fancy-trace)
    ;; prefix names for which-key
    (mapc (lambda (x)
            (spacemacs/declare-prefix-for-mode 'lisp-mode (car x) (cdr x)))
      '(("mh" . "help")
         ("me" . "eval")
         ("ms" . "repl")
         ("mc" . "compile")
         ("mg" . "nav")
         ("mm" . "macro")
         ("mt" . "toggle")))))

(defun common-lisp-sly/init-sly-company ()
  "Initialize sly-company"
  (use-package sly-company)
  )

(defun common-lisp-sly/init-evil-cleverparens ()
  "Initialize evil-cleverparens"
  (use-package evil-cleverparens :config
    (add-hook 'lisp-mode-hook #'evil-cleverparens-mode))
  )

;;; packages.el ends here
