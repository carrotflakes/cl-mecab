#|
  This file is a part of cl-mecab project.
  Copyright (c) 2016 carrotflakes (carrotflakes@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-mecab-test-asd
  (:use :cl :asdf))
(in-package :cl-mecab-test-asd)

(defsystem cl-mecab-test
  :author "carrotflakes"
  :license "LLGPL"
  :depends-on (:cl-mecab
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-mecab"))))
  :description "Test system for cl-mecab"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
