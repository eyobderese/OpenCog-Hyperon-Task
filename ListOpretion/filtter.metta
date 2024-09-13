; =============================================================
; Function: filter
; Type signature: filter takes a predicate function of type ($t -> Bool),
;                 a list of type (List $t), and returns a new list of type (List $t)
;                 containing only the elements that satisfy the predicate.
(: filter (-> ($t -> Bool) (List $t) (List $t)))

; Case 1: Base case
; If the list is empty, return an empty list.
(= (filter $f ())
   ()
)

; Case 2: Recursive case
; If the list is non-empty, check if the first element satisfies the predicate.
; If it does, prepend it to the filtered list obtained by recursively filtering the rest of the list.
; If it doesn't, skip the element and continue filtering the rest of the list.
(= (filter $f (:: $x $xs))
   (if ($f $x)
       (:: $x (filter $f $xs))  ; Prepend $x to the filtered list.
       (filter $f $xs)         ; Skip $x and continue filtering the rest of the list.
   )
)

; =============================================================
; Function: isPositive
; Type signature: isPositive takes an element of type $t and returns a boolean value.
;                 It checks if the element is greater than 0.
(: isPositive (-> $t Bool))

(= (isPositive $x) (> $x 0))

; =============================================================
; Example: Filtering positive numbers from the list (1 -2 3 -4 2).
!(filter isPositive (:: 1 (:: -2 (:: 3 (:: -4 (:: 2 ()))))))
; The result is the list (:: 1 (:: 3 (:: 2 ()))).
