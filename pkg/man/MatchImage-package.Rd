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
Version: \tab 0.1\cr
Date: \tab 2013/03/21\cr
Depends: \tab R (>= 2.15.1), jpeg\cr
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
No references
}
\keyword{ package }
\examples{
#lpic works like this: lpic(base = base, pics = "pics", sd = sd, wt = wt, preface = "f")
}