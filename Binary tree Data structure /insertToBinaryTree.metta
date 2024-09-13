; Insert a value into the binary tree
(= (insert $value $tree)
   (if (== $tree ())
       (Node $value () ()) ; If the tree is empty, create a new node with the given value.
       (if (< $value (value $tree))
           (Node (value $tree) (insert $value (left $tree)) (right $tree)) ; Insert in the left subtree.
           (Node (value $tree) (left $tree) (insert $value (right $tree))) ; Insert in the right subtree.
       )
   )
)