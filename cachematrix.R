## The following two functions uses Lexical Scoping property of R to cache the inverse of the matrix as the matrix
## is tedious. This saves a lot of memory. 

## The given function has 4 inbuilt functions. They are similar to the one in the example given for this assignment. 
## get prints the input of the function 
##set replaces the matrix with other. 
## setinv replaces the inverse of the matrix(m) with the input of the function
## getinv prints the inverse of the matrix. 


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) m <<- inverse
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}



## The following function gives the inverse of the function. 
## The first time, it will calculate inverse of the fucntion but then it will fix the value to "m". 
## When we run the function the next time, it will see if "m" already exists. If it exits, then it will print the value of m
## instead of calculating inverse of the matrix. 

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data.")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinv(m)
  m
}

