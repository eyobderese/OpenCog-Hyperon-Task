; =============================================================
; Function: length
; Type signature: length takes a list of type (List $t) and returns a number representing
;                 the length of the list.
(: length (-> (List $t) Number))

; Case 1: Base case
; If the list is empty, return 0.
(= (length ())
   0
)

; Case 2: Recursive case
; If the list is non-empty, add 1 to the length of the rest of the list.
(= (length (:: $x $xs))
   (+ 1 (length $xs))
)

; =============================================================
; Example: Calculating the length of the list (1 2 3 4).
!(length (:: 1 (:: 2 (:: 3 (:: 4 ()))))) 
; The result is 4.