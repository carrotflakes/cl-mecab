# Cl-Mecab

## Usage

```lisp
(ql:quickload :cl-mecab)

(cl-mecab:with-mecab ()
  (cl-mecab:mecab-parse* "今日の天気は晴れです"))
;; =>
;; (("今日" "名詞" "副詞可能" "*" "*" "*" "*" "今日" "キョウ" "キョー")
;;  ("の" "助詞" "連体化" "*" "*" "*" "*" "の" "ノ" "ノ")
;;  ("天気" "名詞" "一般" "*" "*" "*" "*" "天気" "テンキ" "テンキ")
;;  ("は" "助詞" "係助詞" "*" "*" "*" "*" "は" "ハ" "ワ")
;;  ("晴れ" "名詞" "一般" "*" "*" "*" "*" "晴れ" "ハレ" "ハレ")
;;  ("です" "助動詞" "*" "*" "*" "特殊・デス" "基本形" "です" "デス" "デス"))
```

## Installation

```
$ ros install carrotflakes/cl-mecab
```

## Author

* carrotflakes (carrotflakes@gmail.com)

## Copyright

Copyright (c) 2016 carrotflakes (carrotflakes@gmail.com)

## License

Licensed under the LLGPL License.
