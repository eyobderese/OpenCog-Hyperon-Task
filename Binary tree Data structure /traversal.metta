; Perform an in-order traversal of the binary tree
(= (inorder $tree)
   (if (== $tree ())
       ()  ; If the tree is empty, return ()
       (let* (
           ($left (inorder (left $tree)))  ; Traverse the left subtree.
           ($right (inorder (right $tree))) ; Traverse the right subtree.
           ($value (value $tree))  ; Get the value of the current node.
           ($child (cons-atom $value $right))  ; Create a new list with the value and right subtree.
           )
         (cons-atom $left $child)  ; Combine left subtree, current node, and right subtree.
       )
   )
)

; Perform a post-order traversal of the binary tree
(= (postorder $tree)
   (if (== $tree ())
       ()  ; If the tree is empty, return ()
       (let* (
           ($left (postorder (left $tree)))   ; Traverse the left subtree.
           ($right (postorder (right $tree))) ; Traverse the right subtree.
           ($value (value $tree))             ; Get the value of the current node.
           ($child (cons-atom $value ()))     ; Create a new list with just the node value.
           )
         (let $combined (cons-atom $right $child) ; Combine right subtree with node value.
           (cons-atom $left $combined)           ; Combine left subtree, right subtree, and node value.
         )
       )
   )
)