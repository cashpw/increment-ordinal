;;; increment-ordinal.el --- Increment English ordinal numbers -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Cash Prokop-Weaver
;;
;; Author: Cash Prokop-Weaver <cashbweaver@gmail.com>
;; Maintainer: Cash Prokop-Weaver <cashbweaver@gmail.com>
;; Created: July 01, 2024
;; Modified: July 01, 2024
;; Version: 0.0.1
;; Homepage: https://github.com/cashweaver/increment-ordinal
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Increment ordinal numbers with English suffixes (for example: \"1st\", \"2nd\", \"3rd\", \"4th\")
;;
;;; Code:

(defun increment-ordinal (ordinal)
  "Return incremented ORDINAL string (e.g., \"1st\" -> \"2nd\")."
  (if (not
       (string-match
        "\\([0-9]+\\)\\(st\\|nd\\|rd\\|th\\)"
        ordinal))
      ordinal
    (let* ((number
            (string-to-number
             (match-string 1 ordinal)))
           (next-number
            (1+ number))
           (suffix
            (match-string 2 ordinal))
           (last-digit
            (mod next-number 10))
           (next-suffix
            (cond
             ((= last-digit 1)
              "st")
             ((= last-digit 2)
              "nd")
             ((= last-digit 3)
              "rd")
             (t
              "th"))))
      (format
       "%d%s"
       next-number
       next-suffix))))

(defun increment-ordinals-in-string (s)
  "Return S with all ordinals incremented.

Example: \"1st place\" -> \"2nd place\""
  (let ((start-index 0)
        (with-ordinals-incremented s))
    (while (and
            (< start-index
               (length with-ordinals-incremented))
            (setq
             start-index (string-match
                          "\\([0-9]+\\)\\(st\\|nd\\|rd\\|th\\)"
                          with-ordinals-incremented
                          start-index)))
      (let* ((ordinal
              (concat
               (match-string 1 with-ordinals-incremented)
               (match-string 2 with-ordinals-incremented)))
             (next-ordinal
              (increment-ordinal ordinal)))
        (setq
         with-ordinals-incremented (concat
                                    (substring
                                     with-ordinals-incremented
                                     0
                                     start-index)
                                    next-ordinal
                                    (substring
                                     with-ordinals-incremented
                                     (+ start-index
                                        (length
                                         ordinal))))
         start-index (+ start-index
                        (length next-ordinal)))))
    with-ordinals-incremented))

(provide 'increment-ordinal)
;;; increment-ordinal.el ends here
