{-# LANGUAGE GADTs #-}

module ShouldSucceed5 where 


data T a where 
  C :: T Bool 
  D :: T Int 


data Y a where 
  E :: Y Bool 


-- should succeed, the first branch is simply inaccessible 
foo :: T Bool -> Bool 
foo (D) = True 
foo (C) = False 

-- should succeed, the branch is inaccessible and not even type checked
baz :: Y Int -> Int 
baz (E) = "dimitris!"   

-- should fail => it is an attempt to call an inaccessible branch
test = baz (E) 
