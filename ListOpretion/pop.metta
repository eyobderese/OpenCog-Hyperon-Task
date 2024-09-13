;popping from a list
(: pop (-> (List $t) (List $t)))
(= (pop (:: $x $xs))
    $xs
)


! (pop (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ()))))))