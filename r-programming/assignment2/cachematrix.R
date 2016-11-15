## Functions for calculating and caching the result of processing the inverse of a matrix;
## As the operation can be expensive, caching will normally make it faster

## makeCacheMatrix function creates a special matrix that stores in itself the result of 
## the inverse operation applied to it

makeCacheMatrix <- function(x = matrix()) {
    # initialization of internal inverse field
    inverse <- NULL
    # set function initializes the internal matrix and inverse field
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    # get function retrieves the value of the original matrix stored internally
    get <- function() x
    # setinverse function caches the inverse of the matrix
    setinverse <- function(inverse) inverse <<- inverse
    # getinverse function retrieves the inverse of the matrix from cache
    getinverse <- function() inverse
    # returns a list containing all objects to the caller
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve calculates the inverse of a matrix, using cache to speed up the operation

cacheSolve <- function(x, ...) {
    # try to retrieve the cached inverse; returns it if available
    inverse <- x$getinverse()
    if (!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    
    # inverse not solved yet; retrieve original matrix, calculate the inverse and 
    # store it at cache
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    
    # return the inverse result
    inverse
}
