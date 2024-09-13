(: remove-element (-> $t (List $t) (List $t)))
(= (remove-element $item ())
   ()
)
(= (remove-element $item (:: $head $tail))
   (if (== $item $head)
       (remove-element $item $tail)
       (:: $head (remove-element $item $tail))
   )
)


! (remove-element 2 (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ()))))))
