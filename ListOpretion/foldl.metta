; =============================================================
; Function: foldl
; Type signature: foldl takes a binary function of type ($t $t -> $t),
;                 an initial accumulator value of type $t, and a list of type (List $t).
;                 It returns a single value of type $t obtained by applying the function
;                 cumulatively to the elements of the list, starting from the left.
(: foldl (-> ($t $t -> $t) $t (List $t) $t))

; Case 1: Base case
; If the list is empty, return the accumulator.
(= (foldl $f $acc ())
   $acc
)

; Case 2: Recursive case
; If the list is non-empty, apply the function to the accumulator and the first element.
; Then, recursively fold the rest of the list using the new accumulator value.
(= (foldl $f $acc (:: $x $xs))
   (let $currAcc ($f $acc $x) (foldl $f $currAcc $xs))
)

; =============================================================
; Function: add
; Type signature: add takes two elements of type $t and returns their sum.
(: add (-> $t $t $t))

(= (add $x $y) (+ $x $y))

; =============================================================
; Example: Folding the list (1 -2 3 40 2) with the add function and initial accumulator 0.
!(foldl add 0 (:: 1 (:: -2 (:: 3 (:: 40 (:: 2 ()))))))
; The result is 44.