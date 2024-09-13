; =============================================================
; Function: append
; Type signature: append takes an element of type $t and a list of type (List $t),
;                 and returns a new list of type (List $t) with the element appended.
(: append (-> $t (List $t) (List $t)))

; Case 1: Base case
; If the list is empty, create a new list with the single element as its first element.
(= (append $element ())
   (:: $element ())  ; Create a new list containing just $element.
)

; Case 2: Recursive case
; If the list is non-empty, recursively append the element to the end of the list.
(= (append $element (:: $x $xs))
   (:: $x (append $element $xs))  ; Construct a new list with the same head ($x)
                                  ; and recursively append $element to the tail ($xs).
)

; =============================================================
; Example: Appending the element 5 to the list (1 2 3 4).
!(append 5 (:: 1 (:: 2 (:: 3 (:: 4 ())))))
; The result is the list (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ()))))).
