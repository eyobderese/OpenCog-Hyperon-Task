(: foldr (-> ($t $t -> $t) $t (List $t) $t))
(= (foldr $f $acc ())
   $acc
)
(= (foldr $f $acc (:: $x $xs))
   ($f $x (foldr $f $acc $xs))
)

(= (add $x $y) (+ $x $y))

!(foldr add 0 (:: 1 (:: -2 (:: 3 (:: 40 (:: 2 ()))))))