
# Data structure HugeMatrix for storing a matrix with more elements than .Machine$integer.max 
# by splitting the matrix into multiple matrices by columns

setClass("HugeMatrix", representation( data="list", matrix.cols="integer", ncol="integer", nrow="integer" ))
setMethod("initialize", "HugeMatrix", function(.Object, fill, ncol, nrow, max.elements.per.matrix=.Machine$integer.max) {

	max.elements.per.matrix = max( nrow, max.elements.per.matrix)
	num.matrices = ceiling( ncol * nrow / max.elements.per.matrix)
	matrix.cols = ceiling( ncol / num.matrices )

	.Object@data = lapply( seq(num.matrices), function(i) { 
		if(i < num.matrices) cols = matrix.cols else cols = ncol - ((num.matrices - 1) * matrix.cols)
		matrix( rep(fill, nrow * cols), nrow, cols)  
	})
	.Object@ncol = as.integer(ncol)
	.Object@nrow = as.integer(nrow)
	.Object@matrix.cols = as.integer(matrix.cols)

	.Object
})

setMethod("show", "HugeMatrix", function(object) {	
	cat(sprintf("HugeMatrix of dimensions [%d x %d], split into %d columns each (%d matrices) \n", object@nrow, object@nrow, object@matrix.cols, length(object@data)))
})

huge.matrix = function(fill, nrow, ncol, max.elements.per.matrix=.Machine$integer.max) {
	new("HugeMatrix", fill=fill, nrow=nrow, ncol=ncol, max.elements.per.matrix=max.elements.per.matrix)	
}
