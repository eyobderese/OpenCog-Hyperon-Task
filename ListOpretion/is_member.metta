(: is-member (-> $t (List $t) Bool))
(= (is-member $item ())
   false
)
(= (is-member $item (:: $head $tail))
   (if (== $item $head)
       true
       (is-member $item $tail))
)

!(is-member 2 (:: 1 (:: 2 (:: 3 (:: 4 ())))))