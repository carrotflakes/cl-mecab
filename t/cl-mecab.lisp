(in-package :cl-user)
(defpackage cl-mecab-test
  (:use :cl
        :cl-mecab
        :prove))
(in-package :cl-mecab-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-mecab)' in your Lisp.

(plan nil)


(defun test-parse (sentence)
  (with-mecab ()
    (test-reversibility sentence)))

(defun test-reversibility (sentence)
  (is (apply #'concatenate 'string (mapcar #'first (parse* sentence)))
      (remove-if (lambda (char)
                   (member char '(#\Space #\IDEOGRAPHIC_SPACE #\Tab #\Newline #\Return)))
                 sentence)))


(subtest "Reversibility"
  (test-parse "こんにちは、cl-mecabのテストです。")
  (test-parse "")
  (test-parse " 半角スペースが入ってます")
  (test-parse "I'm a cat."))


(with-mecab ()
  (test-reversibility "こんにちは、cl-mecabのテストです。"))


(with-mecab* ()
  (test-reversibility "こんにちは、cl-mecabのテストです。"))


(load-tagger)
(test-reversibility "こんにちは、cl-mecabのテストです。")


(finalize)
