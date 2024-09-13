; Define a node in a binary tree
(= (Node $value $left $right)
   ; Create a node with a value, a left child, and a right child.
   ; The node structure is a list where the first element is the value,
   ; the second element is the left child, and the third element is the right child.
   (let $child (cons-atom $left $right) ; Combine the left and right children into a single list.
     (cons-atom $value $child)         ; Create the node by combining the value with the child list.
   )
)

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

; Creating a tree with values
(insert 14 (insert 1 (insert 8 (insert 7 ()))))

; Searching for a value in the tree
!(search 8 (insert 14 (insert 1 (insert 8 (insert 7 ())))))

; Traversing the tree in order
 !(inorder (insert 14 (insert 1 (insert 8 (insert 7 ())))))
