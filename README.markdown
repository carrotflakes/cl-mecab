# cl-mecab

## Usage

```lisp
(ql:quickload :cl-mecab)

(cl-mecab:with-mecab ()
  (cl-mecab:parse* "今日の天気は晴れです"))
;; =>
;; (("今日" "名詞" "副詞可能" "*" "*" "*" "*" "今日" "キョウ" "キョー")
;;  ("の" "助詞" "連体化" "*" "*" "*" "*" "の" "ノ" "ノ")
;;  ("天気" "名詞" "一般" "*" "*" "*" "*" "天気" "テンキ" "テンキ")
;;  ("は" "助詞" "係助詞" "*" "*" "*" "*" "は" "ハ" "ワ")
;;  ("晴れ" "名詞" "一般" "*" "*" "*" "*" "晴れ" "ハレ" "ハレ")
;;  ("です" "助動詞" "*" "*" "*" "特殊・デス" "基本形" "です" "デス" "デス"))
```

## Installation

Assuming you already installed [MeCab](http://taku910.github.io/mecab/).

``` lisp
(ql:quickload :cl-mecab)
```

## APIs
### `(with-mecab (&optional (option "")) &body body)`
This macro makes MeCab Tagger and enables function `parse` within the `body`.
The MeCab Tagger will be made only once while that execution.
The `option` is taken MeCab Tagger initialization.

### `(with-mecab* (&optional (option "")) &body body)`
This macro similar to `with-mecab`. but, this creates MeCab Tagger each call.

### `(load-tagger &optional (option ""))`
This function makes MeCab Tagger on global.
You can use function `parse` after calling the `load-tagger` only once.
This is useful for experimental implementations.

### `(parse text)`
This function parses the text by MeCab Tagger and returns result as a string.

### `(parse* text)`
This function parses the text by MeCab Tagger and returns result as list seems above example.

## Author

* carrotflakes (carrotflakes@gmail.com)

## Copyright

Copyright (c) 2016-2018 carrotflakes (carrotflakes@gmail.com)

## License

Licensed under the LLGPL License.
