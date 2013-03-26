\name{calcErr}
\alias{calcErr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate photograph and measurer errors
}
\description{
Calculate photograph error and measurer error from a sample of images
}
\usage{
calcErr(data = data, imageID = "imageID", animalID = "animalID", weights = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
A dataframe containing image file name, animal ID, and each images' associated 
measurements.  
}
  \item{imageID}{
A character providing the column name of the column identifying the name of each
image.  In most cases, this is the file name.
}
  \item{animalID}{
A character providing the column name of the column identifying animal ID for
each image.  
}
  \item{weights}{
Logical.  Indicating whether weights should be calculated.  For use in weights for
lpic().
}
}
\details{
calErr() identifies SD and weights (if desired) for use in lpic(). For SD,
or the calculation of photograph error, a database of multiple images taken of 
multiple animals is provided.  For weight, or the calculation of measurer error,
a database of measurements of the same images from multiple animals is provided.

The function also calculates the grand mean, based on imageID as a stratum.
}
\value{
A dataframe with measurement name, grand mean, SD, and weight (if specified) is returned.
}
\author{
Jerod A. Merkle (jerod.merkle.1@ulaval.ca)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{lpic}}
}
\examples{
#generate some random image data
data <- data.frame(imageID=paste("f", 1:12, sep = ""), 
                   animalID=rep(1:3, times=4), m1=rnorm(12, 5, 2),
                   m2=rnorm(12, 8, 1), m3=rnorm(12, 20, 5))
#to find SD or photograph error for each measurement
calcErr(data)
#to find weight or measurer error for each measurement
#note, multple measurements of the same image must be supplied.
test <- calcErr(data, weights = TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ standard deviation }
\keyword{ error }% __ONLY ONE__ keyword per line
