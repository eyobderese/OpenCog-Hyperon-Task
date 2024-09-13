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
; Example: Checking if the number 2 is a member of the list (1 2 3 4).
!(is-member 2 (:: 1 (:: 2 (:: 3 (:: 4 ()))))) 
; The result is true.