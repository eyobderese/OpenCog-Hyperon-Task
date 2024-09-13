
(: length (-> (List $t) Number))
(= (length ())
   0
)
(= (length (:: $x $xs))
   (+ 1 (length $xs))
)


; I put lenght at the top because of I used inside max-value function which help me to chack condition 

(: max-value (-> (List Number) Number))
(= (max-value ())
   (error "Empty list") ; Handle empty list case
)
(= (max-value (:: $x $xs))
   (if (== (length $xs) 0)
       $x
       (let $max (max-value $xs)
         (if (< $x $max)
             $max
             $x))
   )
)

!(max-value (:: 1 (:: 2 (:: 3 (:: 4 ())))))