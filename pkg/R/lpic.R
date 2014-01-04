lpic <- function (base = base, sd = sd, wt = wt, pics = "pics", preface = "f") 
{
  if ("jpeg" %in% installed.packages()[, 1] == FALSE) 
    stop("must install package jpeg")
  require("jpeg")
  if (ncol(base) - 3 != length(sd)) 
    stop("length of sd does not equal number of measurements")
  if (ncol(base) - 3 != length(wt)) 
    stop("length of wt does not equal number of measurements")
  if (any(base[4:ncol(base)] < 0, na.rm = TRUE)) 
    print("You have negative numbers in your measurements")
  files <- dir(paste(getwd(), pics, sep = "/"))
  if (paste("Results_", as.character(Sys.Date()), "_", preface, 
            sep = "") %in% dir(getwd()) == TRUE) 
    stop("You already have a results file in your wd")
  if (any(is.na(base$id)) != TRUE) 
    stop("You do not have NAs in your id column")
  if (any(paste(base[, 2], ".JPG", sep = "") %in% files == 
            FALSE)) 
    stop("Your are missing photos in your pics folder")
  if (any(duplicated(base[, 2]) == TRUE)) 
    stop("You have duplicated rows")
  if (max(nchar(as.character(base$info)) > 20)) 
    stop("Your have too many characters in your info column")
  sizes <- do.call(c, lapply(1:length(files), function(i) {
    temp <- file.info(paste(getwd(), pics, files[i], sep = "/"))
    sz <- temp[1, 1]
    return(sz)
  }))
  if (any(sizes > 1e+06) == TRUE) 
    print("The file size of >=1 of your photos is > 1mb, this could slow the program")
  rm(files, sizes)
  print(paste("You have", length(colnames(base)) - 3, "measurements, and", 
              nrow(base), " total pictures. There are", nrow(base[is.na(base$id) == 
                                                                    TRUE, ]), "pictures to assign ids.", sep = " "))
  print("Here is the summary of each measurement:")
  print(summary(base[4:length(colnames(base))]))
  print("Does everything look ok?  Type y to continue, otherwise click Escape")
  t <- readline(prompt = ":")
  if (t != "y") 
    stop()
  d <- as.character(Sys.Date())
  dir.create(paste(getwd(), "/Results_", d, "_", preface, sep = ""))
  main <- base[is.na(base$id) == FALSE, ]
  base <- base[is.na(base$id) == TRUE, ]
  base <- base[2:ncol(base)]
  matches <- do.call(rbind, lapply(1:nrow(base), function(i) {
    base.2 <- do.call(rbind, lapply(1:nrow(main), function(e) {
      base[i, ]
    }))
    colnames(base.2) <- paste(colnames(base.2), "b", sep = "_")
    data <- cbind(main, base.2)
    data$photo_name <- as.character(data$photo_name)
    pair <- paste(data$photo_name, data$photo_name_b, sep = "_")
    data <- cbind(data, pair)
    leng <- ncol(main) - 1
    likelihood <- rowSums(do.call(cbind, lapply(4:ncol(main), 
                                                function(j) {
                                                  dnorm(data[, j], data[, j + leng], sd[j - 3]) * 
                                                    wt[j - 3]
                                                })), na.rm = TRUE)
    max.likel <- sum(do.call(c, lapply(4:ncol(main), function(j) {
      dnorm(data[1, j], data[1, j], sd[j - 3]) * wt[j - 
                                                      3]
    })), na.rm = TRUE)
    data <- cbind(data, score = likelihood/max.likel, likelihood)
    data <- data[order(data$score, decreasing = T), ]
    data <- cbind(data, rank = 1:nrow(data))
    u <- if (length(unique(data$photo_name)) > 5) {
      as.character(unique(data$photo_name[1:5]))
    }
    else (as.character(unique(data$photo_name)))
    par(mfrow = c(2, 3), family = "serif", mai = c(0.2, 0.2, 
                                                   0.2, 0.2), mar = c(1, 1, 1, 1), omi = c(0.1, 0.1, 
                                                                                           0.1, 0.1), oma = c(0, 0, 0, 0))
    img1 <- readJPEG(paste(getwd(), "/", pics, "/", data$photo_name_b[1], 
                           ".JPG", sep = ""))
    dim1 <- ((dim(img1)[1]/dim(img1)[2]) * 800)
    dim1 <- ifelse(dim1 > 800, 800, dim1)
    plot(c(0, 1000), c(0, 800), type = "n", xlab = "", ylab = "", 
         axes = FALSE, main = paste("New:", data$photo_name_b[1], 
                                    ", ", data$info_b[1], sep = " "))
    rasterImage(img1, 0, 0, 1000, dim1)
    for (a in 1:length(u)) {
      plot(c(0, 1000), c(0, 800), type = "n", xlab = "", 
           ylab = "", axes = FALSE, main = paste("#", a, 
                                                 ", ", preface, data$id[a], ", Scr=", signif(data$score[a], 
                                                                                             3), ", ", data$info[a], sep = ""))
      rasterImage(readJPEG(paste(getwd(), "/", pics, "/", 
                                 data$photo_name[a], ".JPG", sep = "")), 0, 0, 
                  1000, dim1)
    }
    print(c(paste("Pic ", i, " of ", nrow(base), " : ", "Identify whether or not the new animal has a match.", 
                  sep = ""), "Specify by typing a string of 0s (for non-matches) and a 1 (for a match).", 
            "Do not specifiy more than one match. If there are less than 5 photo options,", 
            "your string should equal the number of photo options. For example:100 (for 3)"), 
          quote = FALSE)
    numbs <- as.numeric(unlist(strsplit(readline(prompt = ":"), 
                                        split = "", fixed = TRUE)))
    if (length(numbs) != length(u)) 
      print("You made an error, you have one more chance")
    if (length(numbs) != length(u)) {
      numbs <- as.numeric(unlist(strsplit(readline(prompt = ":"), 
                                          split = "", fixed = TRUE)))
    }
    match <- c(numbs, rep(0, times = nrow(data) - length(u)))
    match[match == 1] <- "yes"
    match[match == 0] <- "no"
    data <- cbind(data, match)
    data$match <- as.character(data$match)
    id <- if (any(data$match == "yes")) {
      data$id[data$match == "yes"]
    }
    else (max(main$id) + 1)
    temp <- cbind(id, base[i, ])
    main <<- rbind(main, temp)
    write.table(main, paste(getwd(), "/Results_", d, "_", preface, 
                            "/unique_ids.csv", sep = ""), sep = ",", row.names = FALSE, 
                append = FALSE)
    return(data)
  }))
  id <- paste(preface, as.character(main$id), sep = "")
  main <- cbind(id, main[2:ncol(main)])
  write.table(main, paste(getwd(), "/Results_", d, "_", preface, 
                          "/unique_ids.csv", sep = ""), sep = ",", row.names = FALSE, 
              append = FALSE)
  write.table(matches, paste(getwd(), "/Results_", d, "_", 
                             preface, "/score.matrix.csv", sep = ""), sep = ",", row.names = FALSE, 
              append = FALSE)
  dir.create(paste(getwd(), "/Results_", d, "_", preface, "/population", 
                   sep = ""))
  u2 <- as.character(unique(main$id))
  for (x in 1:length(u2)) {
    dir.create(paste(getwd(), "/Results_", d, "_", preface, 
                     "/population/", u2[x], sep = ""))
  }
  temp2 <- do.call(c, lapply(1:nrow(main), function(p) {
    t <- file.copy(paste(getwd(), "/", pics, "/", main$photo_name[p], 
                         ".JPG", sep = ""), paste(getwd(), "/Results_", d, 
                                                  "_", preface, "/population/", main$id[p], "/", main$photo_name[p], 
                                                  ".JPG", sep = ""))
    return(t)
  }))
  if (any(temp2 == FALSE)) 
    print("!Something went wrong with folder creation!")
  print("Complete")
  return(list(main, matches))
}