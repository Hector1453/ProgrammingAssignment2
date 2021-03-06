## There are two functions in this file. Combined properly,
## they calculate the inverse of a matrix and cache the result.

## It is assumed that all the matrix used are invertible.

## The first function (makeCacheMatrix) takes a matrix
## "x" and generates a special "matrix" object, which is
## in fact a list. This new object can be read and modified
## by the second function.

makeCacheMatrix <- function(x = matrix()) {
	  s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) s <<- solve
        getinverse <- function() s
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The result of this function should be assigned to a new object.

## The second function (cacheSolve) takes the object "x"
## (that contains the results generated by makeCacheMatrix from a
## matrix) to return the inverse of the matrix: first, it checks
## if the inverse of the matrix has been calculated and cached
## and returns the cached result; otherwise, it will calculate and
## the inverse of the matrix and modify the object "x" to cache the
## results.

## Obviously, "x" in makeCacheMatrix function and in cacheSolve function
## refers to different objects (the first one is a matrix, the second one,
## the object containing the results of makeCacheMatrix).

cacheSolve <- function(x, ...) {
        s <- x$getinverse()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data)
        x$setinverse(s)
        s
}
