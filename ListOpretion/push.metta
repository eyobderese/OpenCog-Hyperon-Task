(: push (-> $t (List $t) (List $t)))
(= (push $element ())
   (:: $element ())
)
(= (push $element (:: $x $xs))
   (:: $x (push $element $xs))
)

!(push 5 (:: 1 (:: 2 (:: 3 (:: 4 ())))))