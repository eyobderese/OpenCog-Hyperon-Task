(: filter (-> ($t -> Bool) (List $t) (List $t)))
(= (filter $f ())
   ()
)
(= (filter $f (:: $x $xs))
   (if ($f $x)
       (:: $x (filter $f $xs))
       (filter $f $xs))
)

(= (isPosetive $x)  (> $x 0))


!(filter isPosetive (:: 1 (:: -2 (:: 3 (:: -4 (:: 2 ()))))))