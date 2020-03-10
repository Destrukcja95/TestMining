library(tm)
workDir <- "D:\\MK11S"
setwd(workDir)

inputDir <- ".\\data"
outputDir <- ".\\results"
scriptsDir <- ".\\scripts"


corpusDir <- paste(inputDir, "\\", "Literatura streszczenia orginał",
                   sep = ""
                   )

corpus <- VCorpus(
  DirSource(
    corpusDir,
    pattern = "*.txt",
    encoding = "UTF-8"
  ),
  readerControl = list(
    language = "pl_PL"
  )
)
View(corpus)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, content_transformer(tolower))

stoplistFile <-paste (inputDir,
  "stopwords_pl.txt",
  sep = "\\"
)

stoplistFile <- readLines(stoplistFile, encoding ="UTF-8")
corpus <- tm_map(corpus, removeWords, stopList)
corpus <- tm_map(corpus, stripwhitespace)

writeLines(as.character[[1]])




