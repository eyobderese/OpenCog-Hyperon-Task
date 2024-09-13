; Access the value of a node
(= (value $node)
   (if (== $node ())
       ()  ; If the node is empty, return ()
       (car-atom $node)  ; Otherwise, return the first element (the value) of the node.
   )
)


; Access the left child of a node
(= (left $node)
   (if (== $node ())
       ()  ; If the node is empty, return ()
       (let $child (cdr-atom $node)  ; Extract the list of children from the node.
         (if (== $child ())
             ()  ; If there is no child list, return ()
             (car-atom $child)  ; Otherwise, return the left child (the first element of the child list).
         )
       )
   )
)

; Access the right child of a node
(= (right $node)
   (if (== $node ())
       ()  ; If the node is empty, return ()
       (let $child (cdr-atom $node)  ; Extract the list of children from the node.
         (if (== $child ())
             ()  ; If there is no child list, return ()
             (cdr-atom $child)  ; Otherwise, return the right child (the second element of the child list).
         )
       )
   )
)