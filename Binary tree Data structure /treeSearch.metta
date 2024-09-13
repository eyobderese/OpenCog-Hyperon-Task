; Search for a value in the binary tree
(= (search $value $tree)
   (if (== $tree ())
       false ; If the tree is empty, the value doesn't exist.
       (if (== $value (value $tree))
           true ; If the value matches the current node, return true.
           (if (< $value (value $tree))
               (search $value (left $tree)) ; Search in the left subtree.
               (search $value (right $tree)) ; Search in the right subtree.
           )
       )
   )
)