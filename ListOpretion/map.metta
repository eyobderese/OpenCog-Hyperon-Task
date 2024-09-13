(: map (-> ($t -> $s) (List $t) (List $s)))
(= (map $f ())
   ()
)
(= (map $f (:: $x $xs))
   (:: ($f $x) (map $f $xs))
)

(= (sqr $x) (* $x $x))

!(map sqr (:: 1 (:: 2 (:: 3 (:: 4 (:: 2 ()))))))