(: insert (-> Number (List Number) (List Number)))
(= (insert $x ())
   (:: $x ())
)
(= (insert $x (:: $y $ys))
   (if (< $x $y)
       (:: $x (:: $y $ys))
       (:: $y (insert $x $ys)))
)

(: sort (-> (List Number) (List Number)))
(= (sort ())
   ()
)
(= (sort (:: $x $xs))
   (let* (
       ($sorted-tail (sort $xs))
       ($inserted (insert $x $sorted-tail))
   )
   $inserted
   )
)

!(sort (:: 1 (:: -2 (:: 3 (:: -4 (:: 2 ()))))))

