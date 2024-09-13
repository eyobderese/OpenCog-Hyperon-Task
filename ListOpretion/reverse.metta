(: push (-> $t (List $t) (List $t)))
(= (push $element ())
   (:: $element ())
)
(= (push $element (:: $x $xs))
   (:: $x (push $element $xs))
)



(: reverse (-> (List $t) (List $t)))
(= (reverse ())
   ()
)
(= (reverse (:: $x $xs))
   (let $reversed (reverse $xs)
     (push $x $reversed))
)
!(reverse (:: 1 (:: -2 (:: 3 (:: -4 (:: 2 ()))))))