

;;; ob-typescript.el --- org-babel functions for VBA (Visual Basic for Applications) evaluation

;; Copyright (C) 2023 Takahiro FUJISAWA

;; Author: Takahiro FUJISAWA
;; Keywords: literate programming, reproducible research, typescript
;; Homepage: https://github.com/lurdan/ob-typescript
;; Version: 0.1
;; Package-Requires: ((emacs "24") (org "8.0"))

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; Exec VBA (Visual Basic for Applications) in org-babel code blocks.

;;; Code:
(require 'ob)
;;(require 'ob-ref)
;;(require 'ob-comint)
;;(require 'ob-eval)


(add-to-list 'org-babel-tangle-lang-exts '("vba" . "bas"))
;(add-to-list 'org-babel-tangle-lang-exts '("vba" . "vba"))

(add-to-list 'org-src-lang-modes '("vba" . visual-basic-mode))

(defun org-babel-execute:vba (body params)
  "Execute a block of VBA code with org-babel."
  (let ((result
         (with-temp-buffer
           (insert body)
           (call-process-region (point-min) (point-max) "cscript" t t nil "-")))
        (result-type (cdr (assoc :result-type params))))
    (org-babel-result-cond result-type result "")))


(provide 'ob-vba)

;;; ob-vba.el ends here
