(: foldl (-> ($t $t -> $t) $t (List $t) $t))
(= (foldl $f $acc ())
   $acc
)
(= (foldl $f $acc (:: $x $xs))
   (let $currAcc ($f $acc $x) (foldl $f $currAcc $xs))
)

(= (add $x $y) (+ $x $y))

!(foldl add 0 (:: 1 (:: -2 (:: 3 (:: 40 (:: 2 ()))))))