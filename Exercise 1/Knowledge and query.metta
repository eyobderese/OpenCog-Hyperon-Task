(Male Chandler) 
(Male John) 
(Male Bob) 
(Male Tim) 
(Male Adam) 
(Male Joey) 
 
(Female Monica) 
(Female Pam) 
(Female Kim) 
(Female Jane) 
(Female Eve) 
 
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


; Parent query 
(= (parent_of $child) (match &self (Parent $x $child) $x )) 


; Mother query
(= (mother_of $child) (match &self (,  
    (Parent $x $child)  
    (Female $x)) $x  
    )  
) 

; sibiling query
(= (sibiling_of $child) (match &self ( 
    , 
   (Parent $x $child)
   (Male $x) 
   (Parent $x $y)
   
) (if(== $child $y) Nil $y)) 
) 


; uncle query
(= (uncle_of $child) (match &self ( 
    , 
    (Parent $par $child)
    (Parent $grand $par)
    (Male $grand) 
    (Parent $grand $uncle) 
    (Male $uncle) 
) $uncle) ) 


; Nephews query
(= (nephews_of $man) (match &self (
    ,
    (Parent $parent $man)
    (Male $parent)
    (Parent $parent $child)
  
) (if(== $man $child) (match &self (Noting $x) $x)
(
    match &self (, (Parent $child $nephew)
    (Male $nephew)) $nephew
)))
)
 
; predecessors query
(= (Predecessors $child)  (parent_of $child)) 
(= (Predecessors $child) (if (== (parent_of $child) ()) Nil (Predecessors (parent_of $child)))) 
 


;=====================================================================
 


 
!(parent_of John) 
!(mother_of Pam) 
!(sibiling_of Pam) 
!(uncle_of Tim) 
!(nephews_of John)
!(Predecessors Bob)


