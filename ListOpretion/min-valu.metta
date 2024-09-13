(: length (-> (List $t) Number))
(= (length ())
   0
)
(= (length (:: $x $xs))
   (+ 1 (length $xs))
)

(: min-value (-> (List Number) Number))
(= (min-value ())
   (error "Empty list") ; Handle empty list case
)
(= (min-value (:: $x $xs))
   (if (== (length $xs) 0)
       $x
       (let $min (min-value $xs)
         (if (> $x $min)
             $min
             $x))
   )
)

!(min-value (:: 1 (:: 2 (:: 3 (:: 4 ())))))