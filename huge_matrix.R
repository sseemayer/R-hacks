
setClass("HugeMatrix", representation( data="list", matrix.cols="integer", ncol="integer", nrow="integer" ))
setMethod("initialize", "HugeMatrix", function(.Object, fill, ncol, nrow, max.elements.per.matrix=.Machine$integer.max) {

	num.matrices = ceiling( ncol * nrow / max.elements.per.matrix)
	

	.Object@data = list()
	.Object@ncol = as.integer(ncol)
	.Object@nrow = as.integer(nrow)
	.Object@matrix.cols = as.integer(matrix.cols)

	.Object
})

huge.matrix = function(data, nrow, ncol, max.elements.per.matrix=.Machine$integer.max) {
	
	

}
