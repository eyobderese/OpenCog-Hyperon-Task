; =============================================================
; Function: is-member
; Type signature: is-member takes an element of type $t and a list of type (List $t),
;                 and returns a boolean value indicating whether the element is a member of the list.
(: is-member (-> $t (List $t) Bool))

; Case 1: Base case
; If the list is empty, return false.
(= (is-member $item ())
   false
)

; Case 2: Recursive case
; If the list is non-empty, check if the first element is equal to the item.
; If it is, return true.
; If it isn't, recursively check the rest of the list.
(= (is-member $item (:: $head $tail))
   (if (== $item $head)
       true
       (is-member $item $tail))
)

; =============================================================
; Function: remove-duplicate
; Type signature: remove-duplicate takes a list of type (List $t) and returns a new list of type (List $t)
;                 with all duplicate elements removed.
(: remove-duplicate (-> (List $t) (List $t)))

; Case 1: Base case
; If the list is empty, return an empty list.
(= (remove-duplicate ())
   ()
)

; Case 2: Recursive case
; If the list is non-empty, check if the head is a member of the tail.
; If it is, skip the head and continue removing duplicates from the tail.
; If it isn't, prepend the head to the list obtained by recursively removing duplicates from the tail.
(= (remove-duplicate (:: $head $tail))
   (if (== (is-member $head $tail) true)
       (remove-duplicate $tail)
       (:: $head (remove-duplicate $tail))
   )
)

; =============================================================
; Example: Removing duplicates from the list (1 2 3 4 2).
!(remove-duplicate (:: 1 (:: 2 (:: 3 (:: 4 (:: 2 ())))))) 
; The result is the list (:: 1 (:: 2 (:: 3 (:: 4 ())))).