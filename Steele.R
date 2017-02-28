#Michael Steele dataset 
#first attempt at updating data object without affect PIDS

#call packages
devtools::install_github('NCEAS/arcticdatautils')
library(dataone)
library(datapack)
library(arcticdatautils)
library(EML)

#set working directory
getwd()
setwd("/home/lee/Steele")

#convert dataset .dat files to text and format as text/csv
readMe <- publish_object(mn, path = "UpTempO_2015_readme.txt", format_id = "text/plain")
UpTempO_01 <- publish_object(mn, path = "UpTempO_2015_01_Healy-FINAL.txt", format_id = "text/csv")
UpTempO_02 <- publish_object(mn, path = "UpTempO_2015_02_SIZRS-FINAL.txt", format_id = "text/csv")
UpTempO_03 <- publish_object(mn, path = "UpTempO_2015_03_SIZRS-FINAL.txt", format_id = "text/csv")
UpTempO_04 <- publish_object(mn, path = "UpTempO_2015_04_SIZRS-FINAL.txt", format_id = "text/csv")
UpTempO_05 <- publish_object(mn, path = "UpTempO_2015_05_SIZRS-FINAL.txt", format_id = "text/csv")
UpTempO_06 <- publish_object(mn, path = "UpTempO_2015_06_Healy-FINAL.txt", format_id = "text/csv")
UpTempO_07 <- publish_object(mn, path = "UpTempO_2015_07_Healy-FINAL.txt", format_id = "text/csv")
UpTempO_08 <- publish_object(mn, path = "UpTempO_2015_08_SIZRS-FINAL.txt", format_id = "text/csv")


#https://arcticdata.io/catalog/#view/arctic-data.10024.3
#validate XML file and call member node 
eml_validate("science_metadata.xml")
mn <- MNode("https://arcticdata.io/metacat/d1/mn/v2")

#push dataset updates 
PID <- get_package(mn, PID$metadata, file_names = TRUE)
PID
PID <- publish_update(mn, 
                      metadata_pid = PID$metadata,
                      resource_map_pid = PID$resource_map,
                      data_pids = c(readMe, UpTempO_01, UpTempO_02, UpTempO_03, UpTempO_04, UpTempO_05, UpTempO_06,
                                    UpTempO_07, UpTempO_08),
                      metadata_path = "/home/lee/Steele/science_metadata.xml",
                      use_doi = TRUE,
                      )

#get system metadata for the child
getSystemMetadata(mn, PID$metadata)

#update parent and nest the child 
ParentPID <- get_package(mn, "resource_map_urn:uuid:7e2220d9-ba53-4531-af85-d1678dcaaf6d")

ParentPID <- publish_update(mn,
                            metadata_pid = ParentPID$metadata,
                            resource_map_pid = ParentPID$resource_map,
                            metadata_path = "/home/lee/Steele/science_metadata (1).xml",
                            child_pids = c(UpTempO2014$resource_map, UpTempO2012$resource_map, UpTempO2010$resource_map,
                                           UpTempO2011$resource_map, UpTempO2013$resource_map, PID$resource_map),
                            use_doi = FALSE)


#set rights when access is already given to someone else 
#set_rights_and_access(mn, c(project_package$metadata, project_package$resource_map, project_package$data), Arienzo, c("read", "write", "changePermission"))
Michael <- "http://orcid.org/0000-0001-5083-1775"
set_access(mn, c(PID$data, PID$metadata, PID$resource_map), Michael, permissions = c("read", "write", "changePermission"))


#update system metadata to change formatID 
#get package PID for all objects in parent 
UpTempO2013 <- get_package(mn, "resource_map_doi:10.18739/A2064R", file_names = TRUE)
UpTempO2013
UpTempO2011 <- get_package(mn, "resource_map_doi:10.18739/A2406P", file_names = TRUE)
UpTempO2011
UpTempO2012 <- get_package(mn, "resource_map_doi:10.18739/A2QQ0X", file_names =  TRUE)
UpTempO2012
UpTempO2014 <- get_package(mn, "resource_map_doi:10.18739/A2VH2V", file_names = TRUE)
UpTempO2014
UpTempO2010 <- get_package(mn, "resource_map_doi:10.18739/A27P9N", file_names = TRUE)
UpTempO2010

#example script to update metadata without affecting PIDs
#pid1 <- "urn:uuid:48070d96-611d-4285-8b70-009e3dbd0a96"
#sysmeta <- getSystemMetadata(mn, pid1)
#sysmeta@formatId <- "text/plain"
#updateSystemMetadata(mn, pid1, sysmeta)


#UpTempo2013
AllProject_Package<-get_package(mn, "resource_map_doi:10.18739/A2064R", file_names=TRUE)
AllProject_Package
dataPids<-AllProject_Package$data
dataPids
for(i in 1:length(dataPids)){
  dat<-list.files(pattern='*.dat$')
  sysmeta<-getSystemMetadata(mn,dataPids[i])
  sysmeta@formatId<-"text/plain"
  updateSystemMetadata(mn, dataPids[i], sysmeta)
}

#UpTempo2011
UpTempO2011 <- get_package(mn, "resource_map_doi:10.18739/A2406P", file_names = TRUE)
UpTempO2011
dataPids <- UpTempO2011$data
dataPids
for(i in 1:length(dataPids)){
  dat<-list.files(pattern='*.dat$')
  sysmeta<-getSystemMetadata(mn,dataPids[i])
  sysmeta@formatId<-"text/plain"
  updateSystemMetadata(mn, dataPids[i], sysmeta)
}

#UpTempo2010
UpTempO2010 <- get_package(mn, "resource_map_doi:10.18739/A27P9N", file_names = TRUE)
UpTempO2010
dataPids <- UpTempO2010$data
dataPids
for(i in 1:length(dataPids)){
  dat<-list.files(pattern='*.dat$')
  sysmeta<-getSystemMetadata(mn,dataPids[i])
  sysmeta@formatId<-"text/plain"
  updateSystemMetadata(mn, dataPids[i], sysmeta)
}

#UpTempo2012
UpTempO2012 <- get_package(mn, "resource_map_doi:10.18739/A2QQ0X", file_names =  TRUE)
UpTempO2012
dataPids <- UpTempO2012$data
dataPids
for(i in 1:length(dataPids)){
  dat<-list.files(pattern='*.dat$')
  sysmeta<-getSystemMetadata(mn,dataPids[i])
  sysmeta@formatId<-"text/plain"
  updateSystemMetadata(mn, dataPids[i], sysmeta)
}

#UpTempo2014
UpTempO2014 <- get_package(mn, "resource_map_doi:10.18739/A2VH2V", file_names = TRUE)
UpTempO2014
dataPids <- UpTempO2014$data
dataPids
for(i in 1:length(dataPids)){
  dat<-list.files(pattern='*.dat$')
  sysmeta<-getSystemMetadata(mn,dataPids[i])
  sysmeta@formatId<-"text/plain"
  updateSystemMetadata(mn, dataPids[i], sysmeta)
}

#update Rightsholder 
readMePID <- "urn:uuid:ce1ec913-f0e2-4669-8dc9-3844e0ecbc4d"
sysmeta <- getSystemMetadata(mn, readMePID)
sysmeta
sysmeta@rightsHolder <- "http://orcid.org/0000-0001-5083-1775 "
updateSystemMetadata(mn, readMePID, sysmeta)

