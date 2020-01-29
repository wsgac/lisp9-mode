;;; lisp9.el --- LISP9 editing mode

;; Copyright (C) 2020 Wojciech S. Gac

;; Author: Wojciech S. Gac <wojciech.s.gac@gmail.com>
;; Keywords: languages, lisp, lisp9

;; This file is not part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Code:

(require 'lisp-mode)

(defgroup lisp9 nil
  "Editing LISP9 code."
  ;; :link '(custom-group-link :tag "Font Lock Faces group" font-lock-faces)
  :group 'lisp)

(defconst lisp9-keywords
  '(;; List operations
    "list" "cons" "car" "cdr" "caar" "cadr" "cdar" "cddr" "caaar"
    "caadr" "cadar" "caddr" "cdaar" "cdadr" "cddar" "cdddr" "caaaar"
    "caaadr" "caadar" "caaddr" "cadaar" "cadadr" "caddar" "cadddr"
    "cdaaar" "cdaadr" "cdadar" "cdaddr" "cddaar" "cddadr" "cdddar"
    "cddddr" "nth-tail" "nth" "memq" "memv" "member" "length" "conc"
    "nconc" "nreconc" "reconc" "setcar" "setcdr" "assq" "assv" "assoc"
    ;; Functional constructs & iteration
    "mapcar" "fold" "foldr" "filter" "foreach" "do"
    ;; Vector operations
    "vector" "subvec" "mkvec" "vsize" "vset" "vconc" "vref" "vfill"
    ;; String operations
    "string" "mkstr" "substr" "ssize" "s<" "s<=" "s=" "s>" "s>=" "si<"
    "si<=" "si=" "si>" "si>=" "sset" "numstr" "strnum" "format"
    "scopy" "sfill" "sref" "sconc"
    ;; Characters
    "c<" "c<=" "c=" "c>" "c>=" "char" "charval" "upcase"
    "downcase" "whitec" "upperc" "numeric" "lowerc" "alphac"
    ;; Miscellaneous sequence operations
    "rever" "nrever" "veclist" "listvec" "strlist" "liststr"
    ;; Math
    "evenp" "oddp" "gcd" "lcm" "expt" "mod" "<" "<=" "=" ">" ">=" "+"
    "*" "-" "rem" "div" "max" "min" "abs"
    ;; Bit operations
    "andb" "xorb" "orb" "norb" "eqvb" "notb" "nandb" "shlb" "shrb"
    "asrb" "bitop"
    ;; Equality
    "eqv" "equal" "eq"
    ;; Conditional execution
    "cond" "if" "if*" "when" "case"
    ;; WITH macros
    "with" "with-infile" "with-outfile" "with-inport" "with-outport"
    ;; Error handling
    "error" "catch-errors" "errport" "catch" "catch*" "throw" "throw*"
    "unwind" "unwind*"
    ;; IO
    "inport" "outport" "terpri" "print" "readln" "close-port"
    "set-inport" "set-outport" "open-outfile" "prin" "princ" "writec"
    "peekc" "read" "readc" "open-infile" "flush"
    ;; Evaluation
    "eval" "apply" "quote" "qquote"
    ;; Functions
    "defun" "lambda"
    ;; Bindings
    "let" "let*" "labels"
    ;; Logic
    "and" "or" "not"
    ;; Symbols
    "symbol" "symbolp" "symname" "gensym"
    ;; Memory management & images
    "gc" "dump-image" "save" "symtab" "obtab" "untag" "reanme"
    "%compare"
    ;; OS
    "syscmd" "load" "cmdline" "quit" "delete" "existsp"  
    ;; Predicates
    "inportp" "atom" "pair" "ctagp" "constp" "outportp" "funp" "fixp"
    "null" "charp" "stringp" "vectorp" "listp" "eofp"
    ;; Macros
    "defmac" "mx" "mx1"
    ))

(defvar lisp9-font-lock-keywords
  `((,(concat "(" (regexp-opt lisp9-keywords t) "\\>") 1 font-lock-keyword-face)))

(defun lisp9-mode-variables ()
  (set-syntax-table lisp9-mode-syntax-table)
  (setq font-lock-defaults
	'(lisp9-font-lock-keywords
	  nil t)))

(defcustom lisp9-mode-hook nil
  "Normal hook run when entering `lisp9-mode'.
See `run-hooks'."
  :type 'hook
  :group 'lisp9)

;;;###autoload
(defun lisp9-mode ()
  "Major mode for editing LISP9 code.
Editing commands are similar to those of `lisp-mode'.

Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.  Semicolons start comments.
\\{lisp9-mode-map}
Entry to this mode calls the value of `lisp9-mode-hook'
if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map lisp9-mode-map)
  (setq major-mode 'lisp9-mode)
  (setq mode-name "LISP9")
  (lisp9-mode-variables)
  (run-mode-hooks 'lisp9-mode-hook))

(autoload 'run-lisp9 "inferior-lisp9"
  "Run an inferior LISP9 process, input and output via buffer `*lisp9*'.
If there is a process already running in `*lisp9*', switch to that buffer.
With argument, allows you to edit the command line (default is value
of `lisp9-program-name').
Runs the hook `inferior-lisp9-mode-hook' \(after the `comint-mode-hook'
is run).
\(Type \\[describe-mode] in the process buffer for a list of commands.)"
  t)

(provide 'lisp9)
