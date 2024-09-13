; Defining male individuals
(Male Chandler)
(Male John)
(Male Bob)
(Male Tim)
(Male Adam)
(Male Joey)

; Defining female individuals
(Female Monica)
(Female Pam)
(Female Kim)
(Female Jane)
(Female Eve)

; Defining parent-child relationships
(Parent Chandler John)
(Parent Chandler Pam)
(Parent Chandler Adam)
(Parent Chandler Jane)

(Parent Monica John)
(Parent Monica Pam)
(Parent Monica Adam)
(Parent Monica Jane)

(Parent John Bob)

(Parent Pam Tim)
(Parent Pam Kim)

(Parent Adam Eve)
(Parent Jane Joey)

; =============================================================

; Query to find the parent of a given child
(= (parent_of $child) 
   (match &self 
     (Parent $x $child)  ; If there's a parent-child relation, return the parent
     $x 
   )
)

; Query to find the mother of a given child
(= (mother_of $child) 
   (match &self 
     (,  
       (Parent $x $child)  ; Find the parent of the child
       (Female $x)         ; Ensure the parent is female
     ) 
     $x  
   )  
)

; Query to find the sibling of a given individual
(= (sibling_of $child) 
   (match &self 
     ( , 
       (Parent $x $child)  ; Find the parent of the child
       (Male $x)           ; Ensure the parent is male
       (Parent $x $y)      ; Check if the parent has another child (sibling)
     ) 
     (if(== $child $y) Nil $y)  ; Return the sibling if it's not the same as the child
   ) 
)

; Query to find the uncle of a given child
(= (uncle_of $child) 
   (match &self 
     (, 
       (Parent $par $child)      ; Find the parent of the child
       (Parent $grand $par)      ; Find the grandparent of the child
       (Male $grand)             ; Ensure the grandparent is male
       (Parent $grand $uncle)    ; Find the parent's sibling (uncle)
       (Male $uncle)             ; Ensure the sibling is male
     ) 
     $uncle 
   ) 
)

; Query to find the nephews of a given man
(= (nephews_of $man) 
   (match &self 
     ( , 
       (Parent $parent $man)     ; Find the parent of the man
       (Male $parent)            ; Ensure the parent is male
       (Parent $parent $child)   ; Check for siblings of the man
     ) 
     (if (== $man $child)        ; Ensure the sibling isn't the same as the man
         (match &self (Nothing $x) $x)
         (match &self 
           ( , 
             (Parent $child $nephew)   ; Find the child of the sibling
             (Male $nephew)            ; Ensure the nephew is male
           ) 
           $nephew
         )
     )
   )
)

; Query to find the predecessors of a given individual
(= (Predecessors $child) 
   (parent_of $child))  ; Base case: return the parent of the child

; Recursive case: if the parent exists, find the predecessors of the parent
(= (Predecessors $child) 
   (if (== (parent_of $child) ()) 
       Nil   ; If no parent exists, return Nil
       (Predecessors (parent_of $child))  ; Recursively find predecessors
   )
)

;=====================================================================

; Test cases to query relationships

!(parent_of John)  ; Find the parent of John
!(mother_of Pam)   ; Find the mother of Pam
!(sibling_of Pam)  ; Find Pam's sibling
!(uncle_of Tim)    ; Find Tim's uncle
!(nephews_of John) ; Find John's nephews
!(Predecessors Bob) ; Find Bob's predecessors (ancestor)
