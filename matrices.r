## Matrices [in progress - based on datacamp matrix ]

#----------------------------------------------------

matrix() # matrix function
  matrix.name <- matrix(1:9, byrow = TRUE, nrows = 3) # example matrix - 1 through 9 by 3 rows
  # example using vectors
  vector <- c(vec1, vec2, vec3) # combine 3 vectors into one vector - each vector has 3 values
  matrix.name <- matrix(vector, byrow = TRUE, nrows = 3)

rownames() # name rows. Can use vector to name rows
  rownames(matrix.name) <- vector.rownames

colnames() # name columns. Can use vector to name columns
  colnames(matrix.name) <- vector.colnames
