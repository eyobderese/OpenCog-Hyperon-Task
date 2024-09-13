(: is-member (-> $t (List $t) Bool))
(= (is-member $item ())
   false
)
(= (is-member $item (:: $head $tail))
   (if (== $item $head)
       true
       (is-member $item $tail))
)


(: remove-duplicate (-> (List $t) (List $t)))
(= (remove-duplicate ())
   ()
)
(= (remove-duplicate (:: $head $tail))
   (if (== (is-member $head $tail) true)
       (remove-duplicate $tail)
       (:: $head (remove-duplicate $tail))
   )
)



!(remove-duplicate (:: 1 (:: 2 (:: 3 (:: 4 (:: 2 ()))))))