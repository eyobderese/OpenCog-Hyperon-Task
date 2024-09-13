; =============================================================
; Function: map
; Type signature: map takes a function of type ($t -> $s) and a list of type (List $t),
;                 and returns a new list of type (List $s) where each element is the result
;                 of applying the function to the corresponding element of the input list.
(: map (-> ($t -> $s) (List $t) (List $s)))

; Case 1: Base case
; If the list is empty, return an empty list.
(= (map $f ())
   ()
)

; Case 2: Recursive case
; If the list is non-empty, apply the function to the first element and prepend the result
; to the list obtained by recursively mapping the rest of the list.
(= (map $f (:: $x $xs))
   (:: ($f $x) (map $f $xs))
)

; =============================================================
; Function: sqr
; Type signature: sqr takes an element of type $t and returns its square.
(: sqr (-> $t $t))

(= (sqr $x) (* $x $x))

; =============================================================
; Example: Mapping the sqr function over the list (1 2 3 4 2).
!(map sqr (:: 1 (:: 2 (:: 3 (:: 4 (:: 2 ())))))) 
; The result is the list (:: 1 (:: 4 (:: 9 (:: 16 (:: 4 ()))))).