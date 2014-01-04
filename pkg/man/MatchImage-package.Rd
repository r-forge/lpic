\name{MatchImage-package}
\alias{MatchImage-package}
\alias{MatchImage}
\docType{package}
\title{
likelihood-based image identification code
}
\description{
Computer-assisted method for assigning animal ids to a database of 
		images using phenotypic measurements extracted from each image.
}
\details{
\tabular{ll}{
Package: \tab lpic\cr
Version: \tab 0.2\cr
Date: \tab 2014/01/04\cr
Depends: \tab R (>= 3.0.2), jpeg\cr
License: \tab GPL (>= 2)\cr
}

Index:
\preformatted{
lpic           		match a collection of images based on morphological measurements
calErr			Find SDs and weights for lpic based on a sample of measured images
}
}
\author{
Jerod A. Merkle
Maintainer: Jerod A. Merkle <jerod.merkle.1@ulaval.ca>
}
\references{
Merkle, J. A. and Fortin, D. (2013), Likelihood-based photograph identification: Application with 
photographs of free-ranging bison. Wildlife Society Bulletin. doi: 10.1002/wsb.382
}
\keyword{ package }
\examples{
#lpic works like this: lpic(base = base, pics = "pics", sd = sd, wt = wt, preface = "f")
}