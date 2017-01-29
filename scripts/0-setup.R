# Author: Jared Swan

# Function Declarations --------------------------------------------------------

# installs a package (if necessary) and then loads it
usePackage <- function(packages) {
    usePackage <- function(p){
        if (!is.element(p, installed.packages()[,1]))
            install.packages(p, dep = TRUE)
        require(p, character.only = TRUE)
    }
    for(package in packages) usePackage(package)
}

# clears all variables and reloads the setup script
resetEnv <- function(){
    rm(list = ls(pos = 1), pos = 1)
    on.exit(source('scripts/0-setup.R'))
}

# opens the book from the OS
openBook <- function(){
    file.path('C:','Users','JDKS','Applications','Github',
              '2013 - An Introduction to Analysis of Financial Data with R - Tsay.pdf') %>% 
    shell.exec()    
}

# opens the root folder in the OS
openPath <- function(){
    getwd() %>%
    shell.exec()
}

# opens a chapter's script
openScript <- function(chapter = 0){
    scripts <- c('0-setup.R',list.files('scripts/','Rscripts',full.names = TRUE))
    
    if(chapter+1 > length(scripts)){
        stop("There aren't that many chapters in the book")
    }
    
    scripts[chapter+1] %>%
    str_c(getwd(),'/',.) %>%
    shell.exec()
}











