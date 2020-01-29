;;; inferior-lisp9.el --- LISP9 process in a buffer

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

(require 'lisp9)
(require 'comint)

(defgroup inferior-lisp9 nil
  "Run LISP9 process in a buffer."
  :group 'lisp9)

(provide 'inferior-lisp9)
