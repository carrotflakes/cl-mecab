#|
  This file is a part of cl-mecab project.
  Copyright (c) 2016 carrotflakes (carrotflakes@gmail.com)
|#

#|
  Author: carrotflakes (carrotflakes@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-mecab-asd
  (:use :cl :asdf))
(in-package :cl-mecab-asd)

(defsystem cl-mecab
  :version "0.1"
  :author "carrotflakes"
  :license "LLGPL"
  :depends-on (:cffi
               :split-sequence)
  :components ((:module "src"
                :components
                ((:file "cl-mecab"))))
  :description "Interface of MeCab that is a morpheme analyzer"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-mecab-test))))
