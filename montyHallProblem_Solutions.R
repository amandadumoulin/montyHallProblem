#The Monty Hall Game Show Problem
#3 doors, one with car, other two empty.
# What is the chance of selecting the car?
# After selection, an empty door opened and you are given chance to switch. 
#  What is the chance of selecting the car? 
#  is it the same chance as previous probability?

x <- 0
counter1 <- 0
counter2 <- 0
counter3 <- 0

#Game can be played many times automatically with a loop
for (x in 1:100000){
  
#create the three doors
  A <- 'empty1'
  B <- 'empty'
  C <- 'car'

#create the vector containing the 3 doors
  options <- c(A,B,C)

#door randomly selected  
  choice1 <- sample(options, 1, replace = F)

#counter1 increases every time the car is selected the first try
  if (choice1 == 'car'){
    counter1 = counter1 + 1
  }
  
#remove an empty door
  if (choice1 == 'car'){
    options <- options[-1]
  } else if (choice1 == 'empty'){
    options <- options[-1]
  } else {
    options <- options[-2]
  }

  
#####Select a choice option
#option 1: randomly pick a door
  #choice2 <- sample(options, 1)
  
#option 2: forced-switch for choice 2
  choice2 <- options[options != choice1]

#####

#counter 2 increases if car is picked on second attempt  
  if (choice2 == 'car'){
    counter2 <- counter2 + 1
  }
  
#counter if choice1 and choice2 are both 'car'
  if (choice1 == 'car' & choice2 == 'car'){
    counter3 <- counter3 + 1
  }
}

#display
counter1 #car selected first try
counter2 #car picked on second attempt
counter3 #picked car first try and stayed with it
x #number of times played

#probabilities 
counter1/x
counter2/x
counter3/x
