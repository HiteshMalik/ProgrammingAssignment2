## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## @x: a square invertible matrix
## return: a list containing functions to
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse
## 4. get the inverse
## this list is used as the input to cacheSolve()
  m<-NULL
  set<-function(y){
## use `<<-` to assign a value to an object in an environment different from the current environment. 
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set = set, get = get,
   setmatrix = setmatrix, getmatrix = getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {
## @x: output of makeCacheMatrix()
## return: inverse of the original matrix input to makeCacheMatrix()
    m<-x$getmatrix()
## if the inverse has already been calculated,
    if(!is.null(m)){
## get it from the cache and skips the computation.
      message("getting cached data")
      return(m)
    }
## otherwise, calculates the inverse 
    matrix<-x$get()
    m<-solve(matrix, ...)
## sets the value of the inverse in the cache via the solve function.
    x$setmatrix(m)
    m
}
