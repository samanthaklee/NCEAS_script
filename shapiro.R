#shapiro dataset 2/28/2017
#https://arcticdata.io/catalog/#view/arctic-data.10043.1

#install libraries
devtools::install_github('NCEAS/arcticdatautils')
library(dataone)
library(datapack)
library(arcticdatautils)
library(EML)

#set working directory
getwd()
setwd("/home/visitor/shapiro")

#get member node
mn <- MNode("https://arcticdata.io/metacat/d1/mn/v2")

#publish_object(mn, path, format_id = )

#publish a data PID for every object in the directory
publishObject <- list() # creates a list
listfastq <- dir(pattern = "*.fastq") # creates the list of all the csv files in the directory
listfastq
for (k in 1:length(listfastq)){
  publishObject[k] <- publish_object(mn, listfastq[k], format_id = "text/plain") 
}

#show one uuid 
str(publishObject[[30]])

#loop through all uuids 
for (k in 1:length(publishObject)) {
  print(publishObject[k])
}

#publish update 
PID <- get_package(mn, PID$metadata)
PID
#resourceMAPPID <- create_resource_map(mn, "urn:uuid:64cfd4c2-061c-4448-a3b0-5938a71561aa")
#resourceMAPPID
PID <- publish_update(mn,
                      metadata_pid = PID$metadata,
                      resource_map_pid = PID$resource_map,
                      data_pids = c("urn:uuid:7fb9f711-e848-4f8e-8fec-27d85c74ad5f", "urn:uuid:b341ef26-3f23-4f17-a9e1-ebaee4719b56", "urn:uuid:7e28c086-db23-470b-87ef-89e3e8f27f3f", "urn:uuid:ef2ecd57-4b1c-4a03-85a0-e3eefc6b38ad", "urn:uuid:f065a353-b608-469f-86bb-7494ab798f1c", "urn:uuid:6d76d4b7-54d6-4c49-98ab-3e88a3039796",  "urn:uuid:8e904754-2bf7-4e6b-b33e-47621d554ec3", "urn:uuid:96cc80a6-5185-42ac-bf1d-6dda999477c5", "urn:uuid:6cd1a71d-3a12-49cf-ba1b-1f348cc6ecf8", "urn:uuid:493bafe8-1cf7-40bd-accd-a4d96e59cf2a", "urn:uuid:c7ad5970-ea17-4cc3-95b0-7ed84ecfeae3", "urn:uuid:fcb9dcfc-4845-4ed6-bcce-d03b2fdf0aee",  "urn:uuid:a34643a2-a873-49ce-bab0-58c5aff6e20e",  "urn:uuid:f98f6a72-2807-4b58-89c9-e162aee3b780",  "urn:uuid:eede24bc-b5b3-4ee9-9ec2-cd4a0c22e233", "urn:uuid:3cd88995-460d-4647-895b-403324c98fc4", "urn:uuid:e8d5f3d6-82f1-4b47-80ba-52898362cbb0", "urn:uuid:29bdfcc3-1154-4e32-a58a-55184ba72bc1", "urn:uuid:a8b41b43-144b-47fc-946d-e352d9865945","urn:uuid:bc636c24-6115-451c-90b5-e3cec9b5ba78", "urn:uuid:d51a7ece-6c12-4d2f-8661-17aec5c7e6ad", "urn:uuid:0ad593c1-dce5-49d7-b503-35ca4d999344", "urn:uuid:fb0f3383-d5d8-475b-a25f-8ac4e8d165e3", "urn:uuid:da035af0-00bb-4541-9c3a-49c6e83c78da", "urn:uuid:f7a13bab-9ed7-4d23-8238-0e45f0f229b0", "urn:uuid:e31141eb-4f90-455a-bfde-1a120fda9593", "urn:uuid:9a1a169f-25b1-44b6-94ca-139fcac92fd0","urn:uuid:8baf26a8-a115-44d9-94fe-6163d56f79e5", "urn:uuid:58eddff0-2015-4789-9f15-945754583923", "urn:uuid:998c0e5b-4b44-4905-a999-1225359a04cb", "urn:uuid:534bb6a2-905d-48a8-ab2a-8471dc6f5218","urn:uuid:9118eba0-d0a9-492f-aa10-ddf696cb61f4", "urn:uuid:70a3e8f8-cdda-4c0c-9be8-a400f06b8fb5" ,"urn:uuid:a4881ac1-f6f1-4bbb-b913-e809e58569ac" ,"urn:uuid:66ce814f-f652-408d-82d2-6a0a11df6e53", "urn:uuid:9a84be5b-05b8-44c4-beea-89b0a2a04b9b", "urn:uuid:1cd9cbee-1013-4918-94af-87fa2dbe0821", "urn:uuid:c307b37a-22e8-4c2c-9339-c531e271990a", "urn:uuid:e0391c54-afca-4801-b70d-7e3a55d97f7c", "urn:uuid:ac9b53bc-865c-4e0d-9c95-b9510a4f0ed6", "urn:uuid:5cc43c40-72db-46ae-8e83-2616287c603d", "urn:uuid:d73283d2-bd87-4dca-b6ec-fdb7ac71b9f3", "urn:uuid:db6f0a65-8af2-4fbc-a2cf-c9974ea4b5ff", "urn:uuid:deff7878-243b-4a6e-9ce8-c21c2809582f", "urn:uuid:aeaf83fe-e8db-42ad-a103-7552795a81df", "urn:uuid:94499ae6-2889-4d73-8a4c-b14b2c198b00", "urn:uuid:3f0f7692-feb8-4aa4-9fbb-f7c96bb74dc7", "urn:uuid:c7754831-0e08-4b4b-86bd-a3b33a15fe1a", "urn:uuid:13873bd3-3ee0-4411-aae7-345ff605b868", "urn:uuid:02398754-90eb-454e-88e8-ee62d36941bc", "urn:uuid:bc7530ae-6f24-4377-b0b5-fdd7d752d095", "urn:uuid:7609c04d-d764-41b7-91f1-678969c67226", "urn:uuid:1659c27d-1489-4285-a06a-9ff93f57684c", "urn:uuid:243c389c-884c-4a61-b506-2e5d5a859b76"),
                      metadata_path = "/home/lee/science_metadata.xml",
                      public = FALSE)

getSystemMetadata(mn, PID$metadata)
