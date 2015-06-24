# Get all species and define their color
species <- levels(iris$Species)
colors  <- rainbow(length(species))

# Get Sepal and Petal boundaries
sepalBoundaries <- getSpecialValues(iris,"Sepal.Width","Sepal.Length")
petalBoundaries <- getSpecialValues(iris,"Petal.Width","Petal.Length")

# Add noise to the data in order to plot every point
jitteredIris <- addNoise(iris,"Sepal.Width","Sepal.Length",sepalBoundaries)
jitteredIris <- addNoise(jitteredIris,"Petal.Width","Petal.Length",petalBoundaries)
