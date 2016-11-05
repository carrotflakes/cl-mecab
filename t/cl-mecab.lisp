(in-package :cl-user)
(defpackage cl-mecab-test
  (:use :cl
        :cl-mecab
        :prove))
(in-package :cl-mecab-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-mecab)' in your Lisp.

(plan nil)


(defun test-reversibility (sentence)
  (with-mecab ()
    (is (apply #'concatenate 'string (mapcar #'first (mecab-parse* sentence)))
        (remove-if (lambda (char) (member char '(#\Space #\IDEOGRAPHIC_SPACE #\Tab #\Newline #\Return)))
                   sentence))))

(test-reversibility "こんにちは、cl-mecabのテストです。")
(test-reversibility "")
(test-reversibility " 半角スペースが入ってます")
(test-reversibility "I'm a cat.")

(finalize)
