# Author : Ravi M B 
# Purpose : Function created as a part of course assingment on Coursera 
# The Following function creates
# a special function Matrix object
# the solve function can cache its inverse when necessary
# Programming Assignment 2


# Function for creating a special function that could be used for caching the response for evaluating matrix inverse


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        
        #Create the components for the matrix
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

# Function for evaluating  the inverse of the matrix that is returned by function makeCacheMatrix 

cacheSolve <- function(x, ...) {
        
        inv <- x$getInverse()
        
        
        # Check the relevant conditions and components
        # Compute the inverse of the matrix and cache any relevant responses 
        
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}