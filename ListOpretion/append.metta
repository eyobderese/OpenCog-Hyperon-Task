(: append (-> $t (List $t) (List $t)))
(= (append $element ())
   (:: $element ())
)
(= (append $element (:: $x $xs))
   (:: $x (append $element $xs))
)

!(append 5 (:: 1 (:: 2 (:: 3 (:: 4 ())))))