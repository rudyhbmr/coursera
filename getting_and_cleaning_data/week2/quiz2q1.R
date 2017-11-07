# Load library and require the package:
library(httr)
library(httpuv)
library(jsonlite)

# setting the OAuth for github:
oauth_endpoints("github")

# after register an application through https://github.com/settings/applications
myapp <- oauth_app("github",
                   
                   key = "7c956341a7c1004dd702",
                   
                   secret = "d345a95b22edb310cdf737723be2ddfda282871a")

# get OAuth credentials:
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# use API:
req <- GET("https://api.github.com/users/jtleek/repos", 
           config(token = github_token))
stop_for_status(req)
output <- content(req)
jsondata <- fromJSON(toJSON(output))
subset(jsondata, name == "datasharing", select = c(created_at))
