char <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(char)
close(char)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])
