###################
# Create tables to pull out differences in larval connections between sensitivity runs, example used for number of particles sensitivity test
###################

# load libraries
library(tidyr)
library(dplyr)
library(stringr)
library(reshape2)
#set folder
setwd("/Users/taylorely/Documents/OceanModeling")

###############################################
# load files created from nearest_neighbor.ipynb

#100 particles released per event for PLD of 180, 60, 90, and 180 days
n100_60<-read.table("settled_per_release_and_settledsite_particlesredo_n100_PLD30_settledist10.csv",sep="\t", header = TRUE)
n100_60$comparison<-paste(n100_60$release_site,"/",n100_60$closest_island) # create a column that contains both the release and settled site
n100_60<-n100_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
n100_60<-n100_60[n100_60$Settled=="Settled",] # only keep rows with settled particles

n100_60<-read.table("settled_per_release_and_settledsite_particlesredo_n100_PLD60_settledist10.csv",sep="\t", header = TRUE)
n100_60$comparison<-paste(n100_60$release_site,"/",n100_60$closest_island)
n100_60<-n100_60[4:6]
n100_60<-n100_60[n100_60$Settled=="Settled",]

n100_90<-read.table("settled_per_release_and_settledsite_particlesredo_n100_PLD90_settledist10.csv",sep="\t", header = TRUE)
n100_90$comparison<-paste(n100_90$release_site,"/",n100_90$closest_island)
n100_90<-n100_90[4:6]
n100_90<-n100_90[n100_90$Settled=="Settled",]

n100_180<-read.table("settled_per_release_and_settledsite_particlesredo_n100_PLD180_settledist10.csv",sep="\t", header = TRUE)
n100_180$comparison<-paste(n100_180$release_site,"/",n100_180$closest_island)
n100_180<-n100_180[4:6]
n100_180<-n100_180[n100_180$Settled=="Settled",]


###################
#100 repeat
#n100_repeat_60<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD30_settledist10.csv",sep="\t", header = TRUE)
#n100_repeat_60$comparison<-paste(n100_repeat_60$release_site,"/",n100_repeat_60$closest_island)
#n100_repeat_60<-n100_repeat_60[4:6]
#n100_repeat_60<-n100_repeat_60[n100_repeat_60$Settled=="Settled",]
#
#n100_repeat_60<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD60_settledist10.csv",sep="\t", header = TRUE)
#n100_repeat_60$comparison<-paste(n100_repeat_60$release_site,"/",n100_repeat_60$closest_island)
#n100_repeat_60<-n100_repeat_60[4:6]
#n100_repeat_60<-n100_repeat_60[n100_repeat_60$Settled=="Settled",]
#
#n100_repeat_90<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD90_settledist10.csv",sep="\t", header = TRUE)
#n100_repeat_90$comparison<-paste(n100_repeat_90$release_site,"/",n100_repeat_90$closest_island)
#n100_repeat_90<-n100_repeat_90[4:6]
#n100_repeat_90<-n100_repeat_90[n100_repeat_90$Settled=="Settled",]
#
#n100_repeat_180<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD180_settledist10.csv",sep="\t", header = TRUE)
#n100_repeat_180$comparison<-paste(n100_repeat_180$release_site,"/",n100_repeat_180$closest_island)
#n100_repeat_180<-n100_repeat_180[4:6]
#n100_repeat_180<-n100_repeat_180[n100_repeat_180$Settled=="Settled",]

###################
#250
n250_60<-read.table("settled_per_release_and_settledsite_particlesredo_n250_PLD30_settledist10.csv",sep="\t", header = TRUE)
n250_60$comparison<-paste(n250_60$release_site,"/",n250_60$closest_island)
n250_60<-n250_60[4:6]
n250_60<-n250_60[n250_60$Settled=="Settled",]

n250_60<-read.table("settled_per_release_and_settledsite_particlesredo_n250_PLD60_settledist10.csv",sep="\t", header = TRUE)
n250_60$comparison<-paste(n250_60$release_site,"/",n250_60$closest_island)
n250_60<-n250_60[4:6]
n250_60<-n250_60[n250_60$Settled=="Settled",]

n250_90<-read.table("settled_per_release_and_settledsite_particlesredo_n250_PLD90_settledist10.csv",sep="\t", header = TRUE)
n250_90$comparison<-paste(n250_90$release_site,"/",n250_90$closest_island)
n250_90<-n250_90[4:6]
n250_90<-n250_90[n250_90$Settled=="Settled",]

n250_180<-read.table("settled_per_release_and_settledsite_particlesredo_n250_PLD180_settledist10.csv",sep="\t", header = TRUE)
n250_180$comparison<-paste(n250_180$release_site,"/",n250_180$closest_island)
n250_180<-n250_180[5:7]
n250_180<-n250_180[n250_180$Settled=="Settled",]


###################
#500 
n500_60<-read.table("settled_per_release_and_settledsite_particlesredo_n500_PLD30_settledist10.csv",sep="\t", header = TRUE)
n500_60$comparison<-paste(n500_60$release_site,"/",n500_60$closest_island)
n500_60<-n500_60[5:7]
n500_60<-n500_60[n500_60$Settled=="Settled",]

n500_60<-read.table("settled_per_release_and_settledsite_particlesredo_n500_PLD60_settledist10.csv",sep="\t", header = TRUE)
n500_60$comparison<-paste(n500_60$release_site,"/",n500_60$closest_island)
n500_60<-n500_60[5:7]
n500_60<-n500_60[n500_60$Settled=="Settled",]

n500_90<-read.table("settled_per_release_and_settledsite_particlesredo_n500_PLD90_settledist10.csv",sep="\t", header = TRUE)
n500_90$comparison<-paste(n500_90$release_site,"/",n500_90$closest_island)
n500_90<-n500_90[5:7]
n500_90<-n500_90[n500_90$Settled=="Settled",]

n500_180<-read.table("settled_per_release_and_settledsite_particlesredo_n500_PLD180_settledist10.csv",sep="\t", header = TRUE)
n500_180$comparison<-paste(n500_180$release_site,"/",n500_180$closest_island)
n500_180<-n500_180[5:7]
n500_180<-n500_180[n500_180$Settled=="Settled",]

###################
#750
#n750_60<-read.table("settled_per_release_and_settledsite_n750_PLD30_settledist10.csv",sep="\t", header = TRUE)
#n750_60$comparison<-paste(n750_60$release_site,"/",n750_60$closest_island)
#n750_60<-n750_60[5:7]
#n750_60<-n750_60[n750_60$Settled=="Settled",]
#
#n750_60<-read.table("settled_per_release_and_settledsite_n750_PLD60_settledist10.csv",sep="\t", header = TRUE)
#n750_60$comparison<-paste(n750_60$release_site,"/",n750_60$closest_island)
#n750_60<-n750_60[5:7]
#n750_60<-n750_60[n750_60$Settled=="Settled",]
#
#n750_90<-read.table("settled_per_release_and_settledsite_n750_PLD90_settledist10.csv",sep="\t", header = TRUE)
#n750_90$comparison<-paste(n750_90$release_site,"/",n750_90$closest_island)
#n750_90<-n750_90[5:7]
#n750_90<-n750_90[n750_90$Settled=="Settled",]
#
#n750_180<-read.table("settled_per_release_and_settledsite_n750_PLD180_settledist10.csv",sep="\t", header = TRUE)
#n750_180$comparison<-paste(n750_180$release_site,"/",n750_180$closest_island)
#n750_180<-n750_180[5:7]
#n750_180<-n750_180[n750_180$Settled=="Settled",]

###################
#1000
n1000_60<-read.table("settled_per_release_and_settledsite_particlesredo_n1000_PLD30_settledist10_newKiritimati.csv",sep="\t", header = TRUE)
n1000_60$comparison<-paste(n1000_60$release_site,"/",n1000_60$closest_island)
n1000_60<-n1000_60[5:7]
n1000_60<-n1000_60[n1000_60$Settled=="Settled",]

n1000_60<-read.table("settled_per_release_and_settledsite_particlesredo_n1000_PLD60_settledist10_newKiritimati.csv",sep="\t", header = TRUE)
n1000_60$comparison<-paste(n1000_60$release_site,"/",n1000_60$closest_island)
n1000_60<-n1000_60[5:7]
n1000_60<-n1000_60[n1000_60$Settled=="Settled",]

n1000_90<-read.table("settled_per_release_and_settledsite_particlesredo_n1000_PLD90_settledist10_newKiritimati.csv",sep="\t", header = TRUE)
n1000_90$comparison<-paste(n1000_90$release_site,"/",n1000_90$closest_island)
n1000_90<-n1000_90[5:7]
n1000_90<-n1000_90[n1000_90$Settled=="Settled",]

n1000_180<-read.table("settled_per_release_and_settledsite_particlesredo_n1000_PLD180_settledist10_newKiritimati.csv",sep="\t", header = TRUE)
n1000_180$comparison<-paste(n1000_180$release_site,"/",n1000_180$closest_island)
n1000_180<-n1000_180[5:7]
n1000_180<-n1000_180[n1000_180$Settled=="Settled",]

##############################################################################

#Make tables by merging all the different # particle runs per PLD and then only keep rows where there are differences

#PLD 30
#all_100_60<-merge(n100_60,n100_repeat_60,all = TRUE,by="comparison") #merge
#colnames(all_100_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60")
all100250_60<-merge(n100_60,n250_60,all = TRUE,by="comparison") #merge
colnames(all100250_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_250_60","Particles_250_60")
all100500_60<-merge(all100250_60,n500_60,all = TRUE,by="comparison") #merge
colnames(all100500_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500")
all_60<-merge(all100500_60,n1000_60,all = TRUE,by="comparison") #merge
colnames(all_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 1000","# Particles Settled 1000")

#all100750_60<-merge(all100500_60,n750_60,all = TRUE,by="comparison") #merge
#colnames(all100750_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_250_60","Particles_250_60","Connection_500_60","Particles_500_60","Connection_750_60","Particles_750_60")
#all_60<-merge(all100750_60,n1000_60,all = TRUE,by="comparison") #merge
#colnames(all_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 750","# Particles Settled 750","Connection 1000","# Particles Settled 1000")

all_60[is.na(all_60)] <- "Not"

all_different_60<-all_60[(all_60$'Connection 100' =="Not" | all_60$'Connection 250' =="Not" |  all_60$'Connection 500' =="Not"|  all_60$'Connection 1000' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_60,"connectivity_matrix_nodifferences_PLD30days_precomp15days_settledist10km.csv")
all_60$shared<-all_60$'Connection 100'
all_60$shared[all_60$'Connection 100' =="Not" | all_60$'Connection 250' =="Not" | all_60$'Connection 500' =="Not" | all_60$'Connection 1000' =="Not" ] <- "No"
all_60$shared[all_60$'Connection 100' =="Settled" & all_60$'Connection 250' =="Settled"  & all_60$'Connection 500' =="Settled"& all_60$'Connection 1000' =="Settled"] <- "Yes"
write.csv(all_60,"all_connectivity_matrix_PLD30days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_60[c('Release Site', 'Settled Site')] <- str_split_fixed(all_60$comparison, ' / ', 2)
all_60$Region_Settled<-all_60$`Settled Site`
all_60$Region_Settled[all_60$`Settled Site` == "Oahu" | all_60$`Settled Site` == "Hawaii" | all_60$`Settled Site` == "Kauai" | all_60$`Settled Site` == "Maui" | all_60$`Settled Site` == "Lanai" | all_60$`Settled Site` == "Kahoolawe" | all_60$`Settled Site` == "Molokai" | all_60$`Settled Site` == "??" | all_60$`Settled Site` == "Niihau"| all_60$`Settled Site` == "Kaula"]<-"MHI"
all_60$Region_Settled[all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_60$`Settled Site` == "Nihoa_Island" | all_60$`Settled Site` == "Necker_Island" | all_60$`Settled Site` == "French_Frigate_Shoals" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_60$`Settled Site` == "St._Rogatien_Bank"| all_60$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_60$`Settled Site` == "Gardner_Pinnacles" | all_60$`Settled Site` == "Laysan_South_Pinnacle" | all_60$`Settled Site` == "Maro_Reef" | all_60$`Settled Site` == "Raita_Bank" | all_60$`Settled Site` == "Laysan_West_pinnacle" | all_60$`Settled Site` == "Laysan_Island" | all_60$`Settled Site` == "Pioneer_Bank" | all_60$`Settled Site` == "Lisianski_Island" | all_60$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_60$`Settled Site` == "Midway_Islands" | all_60$`Settled Site` == "Kure_Atoll"]<-"NWHI"

all_60[all_60 == "Not"] <- 0
all_60[is.na(all_60)]<-0
heatmap30<-aggregate(cbind(all_60$'# Particles Settled 100',all_60$'# Particles Settled 250',all_60$'# Particles Settled 500',all_60$'# Particles Settled 1000') ~ all_60$`Release Site`+all_60$Region_Settled, FUN=sum) 
colnames(heatmap30)<-c("Release_Site","Region_Settled","100","250","500","1000")
heatmap30$PLD<-"30"

all_60$"# Particles Settled 100"<- as.numeric(all_60$"# Particles Settled 100")
all_60$"# Particles Settled 250"<- as.numeric(all_60$"# Particles Settled 250")
all_60$"# Particles Settled 500"<- as.numeric(all_60$"# Particles Settled 500")
all_60$"# Particles Settled 1000"<- as.numeric(all_60$"# Particles Settled 1000")

degree<-aggregate(cbind(all_60$'# Particles Settled 100',all_60$'# Particles Settled 250',all_60$'# Particles Settled 500',all_60$'# Particles Settled 1000'), list(all_60$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","100","250","500","1000")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_60_region<-all_60[c("Release Site", "Region_Settled","Connection 100","Connection 250","Connection 500","Connection 1000")]
all_60_region<-all_60_region[!duplicated(all_60_region), ]
melt30<-melt(all_60_region, id.vars=c("Release Site", "Region_Settled"))
melt30<-melt30[melt30$value == "Settled",]
melt30<-melt30[c("Release Site", "Region_Settled","variable")]
melt30<-melt30[!duplicated(melt30), ]
melt30<-melt30[order(melt30[,'Region_Settled']), ]
sum30<-aggregate(melt30$`Release Site` ~ variable + Region_Settled, data = melt30, paste, collapse = ",")
sum30<-sum30[!duplicated(sum30), ]
sum30$Release_Site<-as.character(sum30$'melt30$`Release Site`')
sum30<-dcast(sum30,sum30$variable~sum30$Region_Settled,value.var = "Release_Site")
sum30$"MHI"<-"None"
sum30$Parameter<-c("100","250","500","1000")
sum30$PLD<-"30"
sum30$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum30$"# Larvae Transported to NWHI"<-degreet$NWHI
sum30$"# Larvae Transported to MHI"<-0
sum30[is.na(sum30)] <- "None"
sum30<-sum30[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

###################
#PLD 60
#all_100_60<-merge(n100_60,n100_repeat_60,all = TRUE,by="comparison") #merge
#colnames(all_100_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60")
all100250_60<-merge(n100_60,n250_60,all = TRUE,by="comparison") #merge
colnames(all100250_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_250_60","Particles_250_60")
all100500_60<-merge(all100250_60,n500_60,all = TRUE,by="comparison") #merge
colnames(all100500_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500")
all_60<-merge(all100500_60,n1000_60,all = TRUE,by="comparison") #merge
colnames(all_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 1000","# Particles Settled 1000")

#all100750_60<-merge(all100500_60,n750_60,all = TRUE,by="comparison") #merge
#colnames(all100750_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60","Connection_250_60","Particles_250_60","Connection_500_60","Particles_500_60","Connection_750_60","Particles_750_60")
#all_60<-merge(all100750_60,n1000_60,all = TRUE,by="comparison") #merge
#colnames(all_60)<-c("comparison","Connection 100","# Particles Settled 100","Connection 100 repeat","# Particles Settled 100 repeat","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 750","# Particles Settled 750","Connection 1000","# Particles Settled 1000")

all_60[is.na(all_60)] <- "Not"

all_different_60<-all_60[(all_60$'Connection 100' =="Not" | all_60$'Connection 250' =="Not" | all_60$'Connection 500' =="Not"| all_60$'Connection 1000' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_60,"connectivity_matrix_nodifferences_PLD60days_precomp15days_settledist10km.csv")
all_60$shared<-all_60$'Connection 100'
all_60$shared[all_60$'Connection 100' =="Not" | all_60$'Connection 250' =="Not" | all_60$'Connection 500' =="Not"| all_60$'Connection 1000' =="Not"] <- "No"
all_60$shared[all_60$'Connection 100' =="Settled" & all_60$'Connection 250' =="Settled" & all_60$'Connection 500' =="Settled"& all_60$'Connection 1000' =="Settled"] <- "Yes"
write.csv(all_60,"all_connectivity_matrix_PLD60days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_60[c('Release Site', 'Settled Site')] <- str_split_fixed(all_60$comparison, ' / ', 2)
all_60$Region_Settled<-all_60$`Settled Site`
all_60$Region_Settled[all_60$`Settled Site` == "Oahu" | all_60$`Settled Site` == "Hawaii" | all_60$`Settled Site` == "Kauai" | all_60$`Settled Site` == "Maui" | all_60$`Settled Site` == "Lanai" | all_60$`Settled Site` == "Kahoolawe" | all_60$`Settled Site` == "Molokai" | all_60$`Settled Site` == "??" | all_60$`Settled Site` == "Niihau"| all_60$`Settled Site` == "Kaula"]<-"MHI"
all_60$Region_Settled[all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_60$`Settled Site` == "Nihoa_Island" | all_60$`Settled Site` == "Necker_Island" | all_60$`Settled Site` == "French_Frigate_Shoals" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_60$`Settled Site` == "St._Rogatien_Bank"| all_60$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_60$`Settled Site` == "Gardner_Pinnacles" | all_60$`Settled Site` == "Laysan_South_Pinnacle" | all_60$`Settled Site` == "Maro_Reef" | all_60$`Settled Site` == "Raita_Bank" | all_60$`Settled Site` == "Laysan_West_pinnacle" | all_60$`Settled Site` == "Laysan_Island" | all_60$`Settled Site` == "Pioneer_Bank" | all_60$`Settled Site` == "Lisianski_Island" | all_60$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_60$`Settled Site` == "Midway_Islands" | all_60$`Settled Site` == "Kure_Atoll"]<-"NWHI"


all_60[all_60 == "Not"] <- 0
all_60[is.na(all_60)]<-0
all_60$"# Particles Settled 100"<- as.numeric(all_60$"# Particles Settled 100")
all_60$"# Particles Settled 250"<- as.numeric(all_60$"# Particles Settled 250")
all_60$"# Particles Settled 500"<- as.numeric(all_60$"# Particles Settled 500")
all_60$"# Particles Settled 1000"<- as.numeric(all_60$"# Particles Settled 1000")

heatmap60<-aggregate(cbind(all_60$'# Particles Settled 100',all_60$'# Particles Settled 250',all_60$'# Particles Settled 500',all_60$'# Particles Settled 1000') ~ all_60$`Release Site`+all_60$Region_Settled, FUN=sum) 
colnames(heatmap60)<-c("Release_Site","Region_Settled","100","250","500","1000")
heatmap60$PLD<-"60"


degree<-aggregate(cbind(all_60$'# Particles Settled 100',all_60$'# Particles Settled 250',all_60$'# Particles Settled 500',all_60$'# Particles Settled 1000'), list(all_60$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","100","250","500","1000")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_60_region<-all_60[c("Release Site", "Region_Settled","Connection 100","Connection 250","Connection 500","Connection 1000")]
all_60_region<-all_60_region[!duplicated(all_60_region), ]
melt60<-melt(all_60_region, id.vars=c("Release Site", "Region_Settled"))
melt60<-melt60[melt60$value == "Settled",]
melt60<-melt60[c("Release Site", "Region_Settled","variable")]
melt60<-melt60[!duplicated(melt60), ]
melt60<-melt60[order(melt60[,'Region_Settled']), ]
sum60<-aggregate(melt60$`Release Site` ~ variable + Region_Settled, data = melt60, paste, collapse = ",")
sum60<-sum60[!duplicated(sum60), ]
sum60$Release_Site<-as.character(sum60$'melt60$`Release Site`')
sum60<-dcast(sum60,sum60$variable~sum60$Region_Settled,value.var = "Release_Site")
sum60$Parameter<-c("100","250","500","1000")
sum60$PLD<-"60"
sum60$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum60$"# Larvae Transported to NWHI"<-degreet$NWHI
sum60$"# Larvae Transported to MHI"<-degreet$MHI
sum60[is.na(sum60)] <- "None"
sum60<-sum60[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

###################
#PLD 90
#all_100_90<-merge(n100_90,n100_repeat_90,all = TRUE,by="comparison") #merge
#colnames(all_100_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90")
all100250_90<-merge(n100_90,n250_90,all = TRUE,by="comparison") #merge
colnames(all100250_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_250_90","Particles_250_90")
all100500_90<-merge(all100250_90,n500_90,all = TRUE,by="comparison") #merge
colnames(all100500_90)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500")
all_90<-merge(all100500_90,n1000_90,all = TRUE,by="comparison") #merge
colnames(all_90)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 1000","# Particles Settled 1000")

#all100750_90<-merge(all100500_90,n750_90,all = TRUE,by="comparison") #merge
#colnames(all100750_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90","Connection_250_90","Particles_250_90","Connection_500_90","Particles_500_90","Connection_750_90","Particles_750_90")
#all_90<-merge(all100750_90,n1000_90,all = TRUE,by="comparison") #merge
#colnames(all_90)<-c("comparison","Connection 100","# Particles Settled 100","Connection 100 repeat","# Particles Settled 100 repeat","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 750","# Particles Settled 750","Connection 1000","# Particles Settled 1000")

all_90[is.na(all_90)] <- "Not"

all_different_90<-all_90[(all_90$'Connection 100' =="Not" | all_90$'Connection 250' =="Not" | all_90$'Connection 500' =="Not"| all_90$'Connection 1000' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_90,"connectivity_matrix_nodifferences_PLD90days_precomp15days_settledist10km.csv")
all_90$shared<-all_90$'Connection 100'
all_90$shared[all_90$'Connection 100' =="Not" | all_90$'Connection 250' =="Not" | all_90$'Connection 500' =="Not"| all_90$'Connection 1000' =="Not"] <- "No"
all_90$shared[all_90$'Connection 100' =="Settled" & all_90$'Connection 250' =="Settled" & all_90$'Connection 500' =="Settled"& all_90$'Connection 1000' =="Settled"] <- "Yes"
write.csv(all_90,"all_connectivity_matrix_PLD90days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_90[c('Release Site', 'Settled Site')] <- str_split_fixed(all_90$comparison, ' / ', 2)
all_90$Region_Settled<-all_90$`Settled Site`
all_90$Region_Settled[all_90$`Settled Site` == "Oahu" | all_90$`Settled Site` == "Hawaii" | all_90$`Settled Site` == "Kauai" | all_90$`Settled Site` == "Maui" | all_90$`Settled Site` == "Lanai" | all_90$`Settled Site` == "Kahoolawe" | all_90$`Settled Site` == "Molokai" | all_90$`Settled Site` == "??" | all_90$`Settled Site` == "Niihau"| all_90$`Settled Site` == "Kaula"]<-"MHI"
all_90$Region_Settled[all_90$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_90$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_90$`Settled Site` == "Nihoa_Island" | all_90$`Settled Site` == "Necker_Island" | all_90$`Settled Site` == "French_Frigate_Shoals" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_90$`Settled Site` == "St._Rogatien_Bank"| all_90$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_90$`Settled Site` == "Gardner_Pinnacles" | all_90$`Settled Site` == "Laysan_South_Pinnacle" | all_90$`Settled Site` == "Maro_Reef" | all_90$`Settled Site` == "Raita_Bank" | all_90$`Settled Site` == "Laysan_West_pinnacle" | all_90$`Settled Site` == "Laysan_Island" | all_90$`Settled Site` == "Pioneer_Bank" | all_90$`Settled Site` == "Lisianski_Island" | all_90$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_90$`Settled Site` == "Midway_Islands" | all_90$`Settled Site` == "Kure_Atoll"]<-"NWHI"


all_90[all_90 == "Not"] <- 0
all_90[is.na(all_90)]<-0
all_90$"# Particles Settled 100"<- as.numeric(all_90$"# Particles Settled 100")
all_90$"# Particles Settled 250"<- as.numeric(all_90$"# Particles Settled 250")
all_90$"# Particles Settled 500"<- as.numeric(all_90$"# Particles Settled 500")
all_90$"# Particles Settled 1000"<- as.numeric(all_90$"# Particles Settled 1000")

heatmap90<-aggregate(cbind(all_90$'# Particles Settled 100',all_90$'# Particles Settled 250',all_90$'# Particles Settled 500',all_90$'# Particles Settled 1000') ~ all_90$`Release Site`+all_90$Region_Settled, FUN=sum) 
colnames(heatmap90)<-c("Release_Site","Region_Settled","100","250","500","1000")
heatmap90$PLD<-"90"


degree<-aggregate(cbind(all_90$'# Particles Settled 100',all_90$'# Particles Settled 250',all_90$'# Particles Settled 500',all_90$'# Particles Settled 1000'), list(all_90$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","100","250","500","1000")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_90_region<-all_90[c("Release Site", "Region_Settled","Connection 100","Connection 250","Connection 500","Connection 1000")]
all_90_region<-all_90_region[!duplicated(all_90_region), ]
melt90<-melt(all_90_region, id.vars=c("Release Site", "Region_Settled"))
melt90<-melt90[melt90$value == "Settled",]
melt90<-melt90[c("Release Site", "Region_Settled","variable")]
melt90<-melt90[!duplicated(melt90), ]
melt90<-melt90[order(melt90[,'Region_Settled']), ]
sum90<-aggregate(melt90$`Release Site` ~ variable + Region_Settled, data = melt90, paste, collapse = ",")
sum90<-sum90[!duplicated(sum90), ]
sum90$Release_Site<-as.character(sum90$'melt90$`Release Site`')
sum90<-dcast(sum90,sum90$variable~sum90$Region_Settled,value.var = "Release_Site")
sum90$Parameter<-c("100","250","500","1000")
sum90$PLD<-"90"
sum90$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum90$"# Larvae Transported to NWHI"<-degreet$NWHI
sum90$"# Larvae Transported to MHI"<-degreet$MHI
sum90[is.na(sum90)] <- "None"
sum90<-sum90[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]
###################
#PLD 180
#all_100_180<-merge(n100_180,n100_repeat_180,all = TRUE,by="comparison") #merge
#colnames(all_100_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180")
all100250_180<-merge(n100_180,n250_180,all = TRUE,by="comparison") #merge
colnames(all100250_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_250_180","Particles_250_180")
all100500_180<-merge(all100250_180,n500_180,all = TRUE,by="comparison") #merge
colnames(all100500_180)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500")
all_180<-merge(all100500_180,n1000_180,all = TRUE,by="comparison") #merge
colnames(all_180)<-c("comparison","Connection 100","# Particles Settled 100","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 1000","# Particles Settled 1000")

#all100750_180<-merge(all100500_180,n750_180,all = TRUE,by="comparison") #merge
#colnames(all100750_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180","Connection_250_180","Particles_250_180","Connection_500_180","Particles_500_180","Connection_750_180","Particles_750_180")
#all_180<-merge(all100750_180,n1000_180,all = TRUE,by="comparison") #merge
#colnames(all_180)<-c("comparison","Connection 100","# Particles Settled 100","Connection 100 repeat","# Particles Settled 100 repeat","Connection 250","# Particles Settled 250","Connection 500","# Particles Settled 500","Connection 750","# Particles Settled 750","Connection 1000","# Particles Settled 1000")

all_180[is.na(all_180)] <- "Not"

all_different_180<-all_180[(all_180$'Connection 100' =="Not" | all_180$'Connection 250' =="Not" | all_180$'Connection 500' =="Not"| all_180$'Connection 1000' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_180,"connectivity_matrix_nodifferences_PLD180days_precomp15days_settledist10km.csv")
all_180$shared<-all_180$'Connection 100'
all_180$shared[all_180$'Connection 100' =="Not" | all_180$'Connection 250' =="Not" | all_180$'Connection 500' =="Not"| all_180$'Connection 1000' =="Not"] <- "No"
all_180$shared[all_180$'Connection 100' =="Settled" & all_180$'Connection 250' =="Settled" & all_180$'Connection 500' =="Settled"& all_180$'Connection 1000' =="Settled"] <- "Yes"
write.csv(all_180,"all_connectivity_matrix_PLD180days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_180[c('Release Site', 'Settled Site')] <- str_split_fixed(all_180$comparison, ' / ', 2)
all_180$Region_Settled<-all_180$`Settled Site`
all_180$Region_Settled[all_180$`Settled Site` == "Oahu" | all_180$`Settled Site` == "Hawaii" | all_180$`Settled Site` == "Kauai" | all_180$`Settled Site` == "Maui" | all_180$`Settled Site` == "Lanai" | all_180$`Settled Site` == "Kahoolawe" | all_180$`Settled Site` == "Molokai" | all_180$`Settled Site` == "??" | all_180$`Settled Site` == "Niihau"| all_180$`Settled Site` == "Kaula"]<-"MHI"
all_180$Region_Settled[all_180$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_180$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_180$`Settled Site` == "Nihoa_Island" | all_180$`Settled Site` == "Necker_Island" | all_180$`Settled Site` == "French_Frigate_Shoals" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_180$`Settled Site` == "St._Rogatien_Bank"| all_180$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_180$`Settled Site` == "Gardner_Pinnacles" | all_180$`Settled Site` == "Laysan_South_Pinnacle" | all_180$`Settled Site` == "Maro_Reef" | all_180$`Settled Site` == "Raita_Bank" | all_180$`Settled Site` == "Laysan_West_pinnacle" | all_180$`Settled Site` == "Laysan_Island" | all_180$`Settled Site` == "Pioneer_Bank" | all_180$`Settled Site` == "Lisianski_Island" | all_180$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_180$`Settled Site` == "Midway_Islands" | all_180$`Settled Site` == "Kure_Atoll"]<-"NWHI"


all_180[all_180 == "Not"] <- 0
all_180[is.na(all_180)]<-0
all_180$"# Particles Settled 100"<- as.numeric(all_180$"# Particles Settled 100")
all_180$"# Particles Settled 250"<- as.numeric(all_180$"# Particles Settled 250")
all_180$"# Particles Settled 500"<- as.numeric(all_180$"# Particles Settled 500")
all_180$"# Particles Settled 1000"<- as.numeric(all_180$"# Particles Settled 1000")

heatmap180<-aggregate(cbind(all_180$'# Particles Settled 100',all_180$'# Particles Settled 250',all_180$'# Particles Settled 500',all_180$'# Particles Settled 1000') ~ all_180$`Release Site`+all_180$Region_Settled, FUN=sum) 
colnames(heatmap180)<-c("Release_Site","Region_Settled","100","250","500","1000")
heatmap180$PLD<-"180"


degree<-aggregate(cbind(all_180$'# Particles Settled 100',all_180$'# Particles Settled 250',all_180$'# Particles Settled 500',all_180$'# Particles Settled 1000'), list(all_180$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","100","250","500","1000")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_180_region<-all_180[c("Release Site", "Region_Settled","Connection 100","Connection 250","Connection 500","Connection 1000")]
all_180_region<-all_180_region[!duplicated(all_180_region), ]
melt180<-melt(all_180_region, id.vars=c("Release Site", "Region_Settled"))
melt180<-melt180[melt180$value == "Settled",]
melt180<-melt180[c("Release Site", "Region_Settled","variable")]
melt180<-melt180[!duplicated(melt180), ]
melt180<-melt180[order(melt180[,'Region_Settled']), ]
sum180<-aggregate(melt180$`Release Site` ~ variable + Region_Settled, data = melt180, paste, collapse = ",")
sum180<-sum180[!duplicated(sum180), ]
sum180$Release_Site<-as.character(sum180$'melt180$`Release Site`')
sum180<-dcast(sum180,sum180$variable~sum180$Region_Settled,value.var = "Release_Site")
sum180$Parameter<-c("100","250","500","1000")
sum180$PLD<-"180"
sum180$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum180$"# Larvae Transported to NWHI"<-degreet$NWHI
sum180$"# Larvae Transported to MHI"<-degreet$MHI
sum180[is.na(sum180)] <- "None"
sum180<-sum180[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

finalall<-rbind(sum30,sum60)
finalall<-rbind(finalall,sum90)
finalall<-rbind(finalall,sum180)
write.csv(finalall,"HawaiiConnections_numberparticles_precomp15days_settledist10km.csv")

heatmapall<-rbind(heatmap30,heatmap60)
heatmapall<-rbind(heatmapall,heatmap90)
heatmapall<-rbind(heatmapall,heatmap180)
write.csv(heatmapall,"heatmap_numberparticles_precomp15days_settledist10km.csv")

###################
##################
###################
#depth
#0m
m0_60<-read.table("settled_0m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m0_60$comparison<-paste(m0_60$release_site,"/",m0_60$closest_island) # create a column that contains both the release and settled site
m0_60<-m0_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m0_60<-m0_60[m0_60$Settled=="Settled",] # only keep rows with settled particles

m0_60<-read.table("settled_0m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m0_60$comparison<-paste(m0_60$release_site,"/",m0_60$closest_island)
m0_60<-m0_60[4:6]
m0_60<-m0_60[m0_60$Settled=="Settled",]

m0_90<-read.table("settled_0m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m0_90$comparison<-paste(m0_90$release_site,"/",m0_90$closest_island)
m0_90<-m0_90[4:6]
m0_90<-m0_90[m0_90$Settled=="Settled",]

m0_180<-read.table("settled_0m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m0_180$comparison<-paste(m0_180$release_site,"/",m0_180$closest_island)
m0_180<-m0_180[4:6]
m0_180<-m0_180[m0_180$Settled=="Settled",]
###
m5_60<-read.table("settled_5m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m5_60$comparison<-paste(m5_60$release_site,"/",m5_60$closest_island) # create a column that contains both the release and settled site
m5_60<-m5_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m5_60<-m5_60[m5_60$Settled=="Settled",] # only keep rows with settled particles

m5_60<-read.table("settled_5m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m5_60$comparison<-paste(m5_60$release_site,"/",m5_60$closest_island)
m5_60<-m5_60[4:6]
m5_60<-m5_60[m5_60$Settled=="Settled",]

m5_90<-read.table("settled_5m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m5_90$comparison<-paste(m5_90$release_site,"/",m5_90$closest_island)
m5_90<-m5_90[4:6]
m5_90<-m5_90[m5_90$Settled=="Settled",]

m5_180<-read.table("settled_5m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m5_180$comparison<-paste(m5_180$release_site,"/",m5_180$closest_island)
m5_180<-m5_180[4:6]
m5_180<-m5_180[m5_180$Settled=="Settled",]
###
m10_60<-read.table("settled_10m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m10_60$comparison<-paste(m10_60$release_site,"/",m10_60$closest_island) # create a column that contains both the release and settled site
m10_60<-m10_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m10_60<-m10_60[m10_60$Settled=="Settled",] # only keep rows with settled particles

m10_60<-read.table("settled_10m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m10_60$comparison<-paste(m10_60$release_site,"/",m10_60$closest_island)
m10_60<-m10_60[4:6]
m10_60<-m10_60[m10_60$Settled=="Settled",]

m10_90<-read.table("settled_10m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m10_90$comparison<-paste(m10_90$release_site,"/",m10_90$closest_island)
m10_90<-m10_90[4:6]
m10_90<-m10_90[m10_90$Settled=="Settled",]

m10_180<-read.table("settled_10m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m10_180$comparison<-paste(m10_180$release_site,"/",m10_180$closest_island)
m10_180<-m10_180[4:6]
m10_180<-m10_180[m10_180$Settled=="Settled",]
###
m20_60<-read.table("settled_20m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m20_60$comparison<-paste(m20_60$release_site,"/",m20_60$closest_island) # create a column that contains both the release and settled site
m20_60<-m20_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m20_60<-m20_60[m20_60$Settled=="Settled",] # only keep rows with settled particles

m20_60<-read.table("settled_20m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m20_60$comparison<-paste(m20_60$release_site,"/",m20_60$closest_island)
m20_60<-m20_60[4:6]
m20_60<-m20_60[m20_60$Settled=="Settled",]

m20_90<-read.table("settled_20m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m20_90$comparison<-paste(m20_90$release_site,"/",m20_90$closest_island)
m20_90<-m20_90[4:6]
m20_90<-m20_90[m20_90$Settled=="Settled",]

m20_180<-read.table("settled_20m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m20_180$comparison<-paste(m20_180$release_site,"/",m20_180$closest_island)
m20_180<-m20_180[4:6]
m20_180<-m20_180[m20_180$Settled=="Settled",]
###
m30_60<-read.table("settled_60m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m30_60$comparison<-paste(m30_60$release_site,"/",m30_60$closest_island) # create a column that contains both the release and settled site
m30_60<-m30_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m30_60<-m30_60[m30_60$Settled=="Settled",] # only keep rows with settled particles

m30_60<-read.table("settled_60m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m30_60$comparison<-paste(m30_60$release_site,"/",m30_60$closest_island)
m30_60<-m30_60[4:6]
m30_60<-m30_60[m30_60$Settled=="Settled",]

m30_90<-read.table("settled_60m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m30_90$comparison<-paste(m30_90$release_site,"/",m30_90$closest_island)
m30_90<-m30_90[4:6]
m30_90<-m30_90[m30_90$Settled=="Settled",]

m30_180<-read.table("settled_60m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m30_180$comparison<-paste(m30_180$release_site,"/",m30_180$closest_island)
m30_180<-m30_180[4:6]
m30_180<-m30_180[m30_180$Settled=="Settled",]
###
m50_60<-read.table("settled_50m_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
m50_60$comparison<-paste(m50_60$release_site,"/",m50_60$closest_island) # create a column that contains both the release and settled site
m50_60<-m50_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
m50_60<-m50_60[m50_60$Settled=="Settled",] # only keep rows with settled particles

m50_60<-read.table("settled_50m_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
m50_60$comparison<-paste(m50_60$release_site,"/",m50_60$closest_island)
m50_60<-m50_60[4:6]
m50_60<-m50_60[m50_60$Settled=="Settled",]

m50_90<-read.table("settled_50m_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
m50_90$comparison<-paste(m50_90$release_site,"/",m50_90$closest_island)
m50_90<-m50_90[4:6]
m50_90<-m50_90[m50_90$Settled=="Settled",]

m50_180<-read.table("settled_50m_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
m50_180$comparison<-paste(m50_180$release_site,"/",m50_180$closest_island)
m50_180<-m50_180[4:6]
m50_180<-m50_180[m50_180$Settled=="Settled",]
###
avg25_60<-read.table("settled_25avg_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
avg25_60$comparison<-paste(avg25_60$release_site,"/",avg25_60$closest_island) # create a column that contains both the release and settled site
avg25_60<-avg25_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
avg25_60<-avg25_60[avg25_60$Settled=="Settled",] # only keep rows with settled particles

avg25_60<-read.table("settled_25avg_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
avg25_60$comparison<-paste(avg25_60$release_site,"/",avg25_60$closest_island)
avg25_60<-avg25_60[4:6]
avg25_60<-avg25_60[avg25_60$Settled=="Settled",]

avg25_90<-read.table("settled_25avg_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
avg25_90$comparison<-paste(avg25_90$release_site,"/",avg25_90$closest_island)
avg25_90<-avg25_90[4:6]
avg25_90<-avg25_90[avg25_90$Settled=="Settled",]

avg25_180<-read.table("settled_25avg_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
avg25_180$comparison<-paste(avg25_180$release_site,"/",avg25_180$closest_island)
avg25_180<-avg25_180[4:6]
avg25_180<-avg25_180[avg25_180$Settled=="Settled",]
###
avg50_60<-read.table("settled_50avg_n1_PLD30_settledist10.csv",sep="\t", header = TRUE)
avg50_60$comparison<-paste(avg50_60$release_site,"/",avg50_60$closest_island) # create a column that contains both the release and settled site
avg50_60<-avg50_60[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
avg50_60<-avg50_60[avg50_60$Settled=="Settled",] # only keep rows with settled particles

avg50_60<-read.table("settled_50avg_n1_PLD60_settledist10.csv",sep="\t", header = TRUE)
avg50_60$comparison<-paste(avg50_60$release_site,"/",avg50_60$closest_island)
avg50_60<-avg50_60[4:6]
avg50_60<-avg50_60[avg50_60$Settled=="Settled",]

avg50_90<-read.table("settled_50avg_n1_PLD90_settledist10.csv",sep="\t", header = TRUE)
avg50_90$comparison<-paste(avg50_90$release_site,"/",avg50_90$closest_island)
avg50_90<-avg50_90[4:6]
avg50_90<-avg50_90[avg50_90$Settled=="Settled",]

avg50_180<-read.table("settled_50avg_n1_PLD180_settledist10.csv",sep="\t", header = TRUE)
avg50_180$comparison<-paste(avg50_180$release_site,"/",avg50_180$closest_island)
avg50_180<-avg50_180[4:6]
avg50_180<-avg50_180[avg50_180$Settled=="Settled",]

##############
#PLD 30
all0m5m_30<-merge(m0_30,m5_30,all = TRUE,by="comparison") #merge
colnames(all0m5m_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m")
all0m10m_30<-merge(all0m5m_30,m10_30,all = TRUE,by="comparison") #merge
colnames(all0m10m_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m")
all0m20m_30<-merge(all0m10m_30,m20_30,all = TRUE,by="comparison") #merge
colnames(all0m20m_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m")
all0m30m_30<-merge(all0m20m_30,m30_30,all = TRUE,by="comparison") #merge
colnames(all0m30m_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m")
all0m50m_30<-merge(all0m30m_30,m50_30,all = TRUE,by="comparison") #merge
colnames(all0m50m_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m")
all0m25avg_30<-merge(all0m50m_30,avg25_30,all = TRUE,by="comparison") #merge
colnames(all0m25avg_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25 avg","# Particles Settled 25 avg")
all_30<-merge(all0m25avg_30,avg50_30,all = TRUE,by="comparison") #merge
colnames(all_30)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25m avg","# Particles Settled 25m avg","Connection 50m avg","# Particles Settled 50m avg")

all_30[is.na(all_30)] <- "Not"

all_different_30<-all_30[(all_30$'Connection 0m' =="Not" | all_30$'Connection 5m' =="Not" |  all_30$'Connection 10m' =="Not"|  all_30$'Connection 20m' =="Not"|  all_30$'Connection 30m' =="Not"|  all_30$'Connection 50m' =="Not"|  all_30$'Connection 25m avg' =="Not"|  all_30$'Connection 50m avg' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_30,"depth_connectivity_matrix_differences_PLD30days_precomp15days_settledist10km.csv")
all_30$shared<-all_30$'Connection 0m'
all_30$shared[all_30$'Connection 0m' =="Not" | all_30$'Connection 5m' =="Not" |  all_30$'Connection 10m' =="Not"|  all_30$'Connection 20m' =="Not"|  all_30$'Connection 30m' =="Not"|  all_30$'Connection 50m' =="Not"|  all_30$'Connection 25m avg' =="Not"|  all_30$'Connection 50m avg' =="Not"] <- "No"
all_30$shared[all_30$'Connection 0m' =="Not" | all_30$'Connection 5m' =="Not" |  all_30$'Connection 10m' =="Not"|  all_30$'Connection 20m' =="Not"|  all_30$'Connection 30m' =="Not"|  all_30$'Connection 50m' =="Not"|  all_30$'Connection 25m avg' =="Not"|  all_30$'Connection 50m avg' =="Not"] <- "Yes"
write.csv(all_30,"depth_all_connectivity_matrix_PLD30days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_30[c('Release Site', 'Settled Site')] <- str_split_fixed(all_30$comparison, ' / ', 2)
all_30$Region_Settled<-all_30$`Settled Site`
all_30$Region_Settled[all_30$`Settled Site` == "Oahu" | all_30$`Settled Site` == "Hawaii" | all_30$`Settled Site` == "Kauai" | all_30$`Settled Site` == "Maui" | all_30$`Settled Site` == "Lanai" | all_30$`Settled Site` == "Kahoolawe" | all_30$`Settled Site` == "Molokai" | all_30$`Settled Site` == "??" | all_30$`Settled Site` == "Niihau"| all_30$`Settled Site` == "Kaula"]<-"MHI"
all_30$Region_Settled[all_30$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_30$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_30$`Settled Site` == "Nihoa_Island" | all_30$`Settled Site` == "Necker_Island" | all_30$`Settled Site` == "French_Frigate_Shoals" | all_30$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_30$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_30$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_30$`Settled Site` == "St._Rogatien_Bank"| all_30$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_30$`Settled Site` == "Gardner_Pinnacles" | all_30$`Settled Site` == "Laysan_South_Pinnacle" | all_30$`Settled Site` == "Maro_Reef" | all_30$`Settled Site` == "Raita_Bank" | all_30$`Settled Site` == "Laysan_West_pinnacle" | all_30$`Settled Site` == "Laysan_Island" | all_30$`Settled Site` == "Pioneer_Bank" | all_30$`Settled Site` == "Lisianski_Island" | all_30$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_30$`Settled Site` == "Midway_Islands" | all_30$`Settled Site` == "Kure_Atoll"]<-"NWHI"

all_30[all_30 == "Not"] <- 0
all_30[is.na(all_30)]<-0
all_30$"# Particles Settled 0m"<- as.numeric(all_30$"# Particles Settled 0m")
all_30$"# Particles Settled 5m"<- as.numeric(all_30$"# Particles Settled 5m")
all_30$"# Particles Settled 10m"<- as.numeric(all_30$"# Particles Settled 10m")
all_30$"# Particles Settled 20m"<- as.numeric(all_30$"# Particles Settled 20m")
all_30$"# Particles Settled 30m"<- as.numeric(all_30$"# Particles Settled 30m")
all_30$"# Particles Settled 50m"<- as.numeric(all_30$"# Particles Settled 50m")
all_30$"# Particles Settled 25m avg"<- as.numeric(all_30$"# Particles Settled 25m avg")
all_30$"# Particles Settled 50m avg"<- as.numeric(all_30$"# Particles Settled 50m avg")

heatmap30<-aggregate(cbind(all_30$'# Particles Settled 0m',all_30$'# Particles Settled 5m',all_30$'# Particles Settled 10m',all_30$'# Particles Settled 20m',all_30$'# Particles Settled 30m',all_30$'# Particles Settled 50m',all_30$'# Particles Settled 25m avg',all_30$'# Particles Settled 50m avg') ~ all_30$`Release Site`+all_30$Region_Settled, FUN=sum) 
colnames(heatmap30)<-c("Release_Site","Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
heatmap30$PLD<-"30"

degree<-aggregate(cbind(all_30$'# Particles Settled 0m',all_30$'# Particles Settled 5m',all_30$'# Particles Settled 10m',all_30$'# Particles Settled 20m',all_30$'# Particles Settled 30m',all_30$'# Particles Settled 50m',all_30$'# Particles Settled 25m avg',all_30$'# Particles Settled 50m avg'), list(all_30$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_30_region<-all_30[c("Release Site", "Region_Settled","Connection 0m","Connection 5m","Connection 10m","Connection 20m","Connection 30m","Connection 50m","Connection 25m avg","Connection 50m avg")]
all_30_region<-all_30_region[!duplicated(all_30_region), ]
melt30<-melt(all_30_region, id.vars=c("Release Site", "Region_Settled"))
melt30<-melt30[melt30$value == "Settled",]
melt30<-melt30[c("Release Site", "Region_Settled","variable")]
melt30<-melt30[!duplicated(melt30), ]
melt30<-melt30[order(melt30[,'Region_Settled']), ]
sum30<-aggregate(melt30$`Release Site` ~ variable + Region_Settled, data = melt30, paste, collapse = ",")
sum30<-sum30[!duplicated(sum30), ]
sum30$Release_Site<-as.character(sum30$'melt30$`Release Site`')
sum30<-dcast(sum30,sum30$variable~sum30$Region_Settled,value.var = "Release_Site")
sum30$"MHI"<-"None"
sum30$Parameter<-c("0m","5m","10m","20m","30m","50m","25m avg","50m avg")
sum30$PLD<-"30"
sum30$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum30$"# Larvae Transported to NWHI"<-degreet$NWHI
sum30$"# Larvae Transported to MHI"<-0
sum30[is.na(sum30)] <- "None"
sum30<-sum30[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]


##############
#PLD 60
all0m5m_60<-merge(m0_60,m5_60,all = TRUE,by="comparison") #merge
colnames(all0m5m_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m")
all0m10m_60<-merge(all0m5m_60,m10_60,all = TRUE,by="comparison") #merge
colnames(all0m10m_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m")
all0m20m_60<-merge(all0m10m_60,m20_60,all = TRUE,by="comparison") #merge
colnames(all0m20m_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m")
all0m30m_60<-merge(all0m20m_60,m30_60,all = TRUE,by="comparison") #merge
colnames(all0m30m_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m")
all0m50m_60<-merge(all0m30m_60,m50_60,all = TRUE,by="comparison") #merge
colnames(all0m50m_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m")
all0m25avg_60<-merge(all0m50m_60,avg25_60,all = TRUE,by="comparison") #merge
colnames(all0m25avg_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25 avg","# Particles Settled 25 avg")
all_60<-merge(all0m25avg_60,avg50_60,all = TRUE,by="comparison") #merge
colnames(all_60)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25m avg","# Particles Settled 25m avg","Connection 50m avg","# Particles Settled 50m avg")

all_60[is.na(all_60)] <- "Not"

all_different_60<-all_60[(all_60$'Connection 0m' =="Not" | all_60$'Connection 5m' =="Not" |  all_60$'Connection 10m' =="Not"|  all_60$'Connection 20m' =="Not"|  all_60$'Connection 30m' =="Not"|  all_60$'Connection 50m' =="Not"|  all_60$'Connection 25m avg' =="Not"|  all_60$'Connection 50m avg' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_60,"depth_connectivity_matrix_differences_PLD60days_precomp15days_settledist10km.csv")
all_60$shared<-all_60$'Connection 0m'
all_60$shared[all_60$'Connection 0m' =="Not" | all_60$'Connection 5m' =="Not" |  all_60$'Connection 10m' =="Not"|  all_60$'Connection 20m' =="Not"|  all_60$'Connection 30m' =="Not"|  all_60$'Connection 50m' =="Not"|  all_60$'Connection 25m avg' =="Not"|  all_60$'Connection 50m avg' =="Not"] <- "No"
all_60$shared[all_60$'Connection 0m' =="Not" | all_60$'Connection 5m' =="Not" |  all_60$'Connection 10m' =="Not"|  all_60$'Connection 20m' =="Not"|  all_60$'Connection 30m' =="Not"|  all_60$'Connection 50m' =="Not"|  all_60$'Connection 25m avg' =="Not"|  all_60$'Connection 50m avg' =="Not"] <- "Yes"
write.csv(all_60,"depth_all_connectivity_matrix_PLD60days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_60[c('Release Site', 'Settled Site')] <- str_split_fixed(all_60$comparison, ' / ', 2)
all_60$Region_Settled<-all_60$`Settled Site`
all_60$Region_Settled[all_60$`Settled Site` == "Oahu" | all_60$`Settled Site` == "Hawaii" | all_60$`Settled Site` == "Kauai" | all_60$`Settled Site` == "Maui" | all_60$`Settled Site` == "Lanai" | all_60$`Settled Site` == "Kahoolawe" | all_60$`Settled Site` == "Molokai" | all_60$`Settled Site` == "??" | all_60$`Settled Site` == "Niihau"| all_60$`Settled Site` == "Kaula"]<-"MHI"
all_60$Region_Settled[all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_60$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_60$`Settled Site` == "Nihoa_Island" | all_60$`Settled Site` == "Necker_Island" | all_60$`Settled Site` == "French_Frigate_Shoals" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_60$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_60$`Settled Site` == "St._Rogatien_Bank"| all_60$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_60$`Settled Site` == "Gardner_Pinnacles" | all_60$`Settled Site` == "Laysan_South_Pinnacle" | all_60$`Settled Site` == "Maro_Reef" | all_60$`Settled Site` == "Raita_Bank" | all_60$`Settled Site` == "Laysan_West_pinnacle" | all_60$`Settled Site` == "Laysan_Island" | all_60$`Settled Site` == "Pioneer_Bank" | all_60$`Settled Site` == "Lisianski_Island" | all_60$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_60$`Settled Site` == "Midway_Islands" | all_60$`Settled Site` == "Kure_Atoll"]<-"NWHI"

all_60[all_60 == "Not"] <- 0
all_60[is.na(all_60)]<-0
all_60$"# Particles Settled 0m"<- as.numeric(all_60$"# Particles Settled 0m")
all_60$"# Particles Settled 5m"<- as.numeric(all_60$"# Particles Settled 5m")
all_60$"# Particles Settled 10m"<- as.numeric(all_60$"# Particles Settled 10m")
all_60$"# Particles Settled 20m"<- as.numeric(all_60$"# Particles Settled 20m")
all_60$"# Particles Settled 30m"<- as.numeric(all_60$"# Particles Settled 30m")
all_60$"# Particles Settled 50m"<- as.numeric(all_60$"# Particles Settled 50m")
all_60$"# Particles Settled 25m avg"<- as.numeric(all_60$"# Particles Settled 25m avg")
all_60$"# Particles Settled 50m avg"<- as.numeric(all_60$"# Particles Settled 50m avg")

heatmap60<-aggregate(cbind(all_60$'# Particles Settled 0m',all_60$'# Particles Settled 5m',all_60$'# Particles Settled 10m',all_60$'# Particles Settled 20m',all_60$'# Particles Settled 30m',all_60$'# Particles Settled 50m',all_60$'# Particles Settled 25m avg',all_60$'# Particles Settled 50m avg') ~ all_60$`Release Site`+all_60$Region_Settled, FUN=sum) 
colnames(heatmap60)<-c("Release_Site","Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
heatmap60$PLD<-"60"

degree<-aggregate(cbind(all_60$'# Particles Settled 0m',all_60$'# Particles Settled 5m',all_60$'# Particles Settled 10m',all_60$'# Particles Settled 20m',all_60$'# Particles Settled 30m',all_60$'# Particles Settled 50m',all_60$'# Particles Settled 25m avg',all_60$'# Particles Settled 50m avg'), list(all_60$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_60_region<-all_60[c("Release Site", "Region_Settled","Connection 0m","Connection 5m","Connection 10m","Connection 20m","Connection 30m","Connection 50m","Connection 25m avg","Connection 50m avg")]
all_60_region<-all_60_region[!duplicated(all_60_region), ]
melt60<-melt(all_60_region, id.vars=c("Release Site", "Region_Settled"))
melt60<-melt60[melt60$value == "Settled",]
melt60<-melt60[c("Release Site", "Region_Settled","variable")]
melt60<-melt60[!duplicated(melt60), ]
melt60<-melt60[order(melt60[,'Region_Settled']), ]
sum60<-aggregate(melt60$`Release Site` ~ variable + Region_Settled, data = melt60, paste, collapse = ",")
sum60<-sum60[!duplicated(sum60), ]
sum60$Release_Site<-as.character(sum60$'melt60$`Release Site`')
sum60<-dcast(sum60,sum60$variable~sum60$Region_Settled,value.var = "Release_Site")
sum60$Parameter<-c("0m","5m","10m","20m","30m","50m","25m avg","50m avg")
sum60$PLD<-"60"
sum60$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum60$"# Larvae Transported to NWHI"<-degreet$NWHI
sum60$"# Larvae Transported to MHI"<-degreet$MHI
sum60[is.na(sum60)] <- "None"
sum60<-sum60[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

##############
#PLD 90
all0m5m_90<-merge(m0_90,m5_90,all = TRUE,by="comparison") #merge
colnames(all0m5m_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m")
all0m10m_90<-merge(all0m5m_90,m10_90,all = TRUE,by="comparison") #merge
colnames(all0m10m_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m")
all0m20m_90<-merge(all0m10m_90,m20_90,all = TRUE,by="comparison") #merge
colnames(all0m20m_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m")
all0m30m_90<-merge(all0m20m_90,m30_90,all = TRUE,by="comparison") #merge
colnames(all0m30m_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m")
all0m50m_90<-merge(all0m30m_90,m50_90,all = TRUE,by="comparison") #merge
colnames(all0m50m_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m")
all0m25avg_90<-merge(all0m50m_90,avg25_90,all = TRUE,by="comparison") #merge
colnames(all0m25avg_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25 avg","# Particles Settled 25 avg")
all_90<-merge(all0m25avg_90,avg50_90,all = TRUE,by="comparison") #merge
colnames(all_90)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25m avg","# Particles Settled 25m avg","Connection 50m avg","# Particles Settled 50m avg")

all_90[is.na(all_90)] <- "Not"

all_different_90<-all_90[(all_90$'Connection 0m' =="Not" | all_90$'Connection 5m' =="Not" |  all_90$'Connection 10m' =="Not"|  all_90$'Connection 20m' =="Not"|  all_90$'Connection 30m' =="Not"|  all_90$'Connection 50m' =="Not"|  all_90$'Connection 25m avg' =="Not"|  all_90$'Connection 50m avg' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_90,"depth_connectivity_matrix_differences_PLD90days_precomp15days_settledist10km.csv")
all_90$shared<-all_90$'Connection 0m'
all_90$shared[all_90$'Connection 0m' =="Not" | all_90$'Connection 5m' =="Not" |  all_90$'Connection 10m' =="Not"|  all_90$'Connection 20m' =="Not"|  all_90$'Connection 30m' =="Not"|  all_90$'Connection 50m' =="Not"|  all_90$'Connection 25m avg' =="Not"|  all_90$'Connection 50m avg' =="Not"] <- "No"
all_90$shared[all_90$'Connection 0m' =="Not" | all_90$'Connection 5m' =="Not" |  all_90$'Connection 10m' =="Not"|  all_90$'Connection 20m' =="Not"|  all_90$'Connection 30m' =="Not"|  all_90$'Connection 50m' =="Not"|  all_90$'Connection 25m avg' =="Not"|  all_90$'Connection 50m avg' =="Not"] <- "Yes"
write.csv(all_90,"depth_all_connectivity_matrix_PLD90days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_90[c('Release Site', 'Settled Site')] <- str_split_fixed(all_90$comparison, ' / ', 2)
all_90$Region_Settled<-all_90$`Settled Site`
all_90$Region_Settled[all_90$`Settled Site` == "Oahu" | all_90$`Settled Site` == "Hawaii" | all_90$`Settled Site` == "Kauai" | all_90$`Settled Site` == "Maui" | all_90$`Settled Site` == "Lanai" | all_90$`Settled Site` == "Kahoolawe" | all_90$`Settled Site` == "Molokai" | all_90$`Settled Site` == "??" | all_90$`Settled Site` == "Niihau"| all_90$`Settled Site` == "Kaula"]<-"MHI"
all_90$Region_Settled[all_90$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_90$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_90$`Settled Site` == "Nihoa_Island" | all_90$`Settled Site` == "Necker_Island" | all_90$`Settled Site` == "French_Frigate_Shoals" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_90$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_90$`Settled Site` == "St._Rogatien_Bank"| all_90$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_90$`Settled Site` == "Gardner_Pinnacles" | all_90$`Settled Site` == "Laysan_South_Pinnacle" | all_90$`Settled Site` == "Maro_Reef" | all_90$`Settled Site` == "Raita_Bank" | all_90$`Settled Site` == "Laysan_West_pinnacle" | all_90$`Settled Site` == "Laysan_Island" | all_90$`Settled Site` == "Pioneer_Bank" | all_90$`Settled Site` == "Lisianski_Island" | all_90$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_90$`Settled Site` == "Midway_Islands" | all_90$`Settled Site` == "Kure_Atoll"]<-"NWHI"

all_90[all_90 == "Not"] <- 0
all_90[is.na(all_90)]<-0
all_90$"# Particles Settled 0m"<- as.numeric(all_90$"# Particles Settled 0m")
all_90$"# Particles Settled 5m"<- as.numeric(all_90$"# Particles Settled 5m")
all_90$"# Particles Settled 10m"<- as.numeric(all_90$"# Particles Settled 10m")
all_90$"# Particles Settled 20m"<- as.numeric(all_90$"# Particles Settled 20m")
all_90$"# Particles Settled 30m"<- as.numeric(all_90$"# Particles Settled 30m")
all_90$"# Particles Settled 50m"<- as.numeric(all_90$"# Particles Settled 50m")
all_90$"# Particles Settled 25m avg"<- as.numeric(all_90$"# Particles Settled 25m avg")
all_90$"# Particles Settled 50m avg"<- as.numeric(all_90$"# Particles Settled 50m avg")

heatmap90<-aggregate(cbind(all_90$'# Particles Settled 0m',all_90$'# Particles Settled 5m',all_90$'# Particles Settled 10m',all_90$'# Particles Settled 20m',all_90$'# Particles Settled 30m',all_90$'# Particles Settled 50m',all_90$'# Particles Settled 25m avg',all_90$'# Particles Settled 50m avg') ~ all_90$`Release Site`+all_90$Region_Settled, FUN=sum) 
colnames(heatmap90)<-c("Release_Site","Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
heatmap90$PLD<-"90"

degree<-aggregate(cbind(all_90$'# Particles Settled 0m',all_90$'# Particles Settled 5m',all_90$'# Particles Settled 10m',all_90$'# Particles Settled 20m',all_90$'# Particles Settled 30m',all_90$'# Particles Settled 50m',all_90$'# Particles Settled 25m avg',all_90$'# Particles Settled 50m avg'), list(all_90$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_90_region<-all_90[c("Release Site", "Region_Settled","Connection 0m","Connection 5m","Connection 10m","Connection 20m","Connection 30m","Connection 50m","Connection 25m avg","Connection 50m avg")]
all_90_region<-all_90_region[!duplicated(all_90_region), ]
melt90<-melt(all_90_region, id.vars=c("Release Site", "Region_Settled"))
melt90<-melt90[melt90$value == "Settled",]
melt90<-melt90[c("Release Site", "Region_Settled","variable")]
melt90<-melt90[!duplicated(melt90), ]
melt90<-melt90[order(melt90[,'Region_Settled']), ]
sum90<-aggregate(melt90$`Release Site` ~ variable + Region_Settled, data = melt90, paste, collapse = ",")
sum90<-sum90[!duplicated(sum90), ]
sum90$Release_Site<-as.character(sum90$'melt90$`Release Site`')
sum90<-dcast(sum90,sum90$variable~sum90$Region_Settled,value.var = "Release_Site")
sum90$Parameter<-c("0m","5m","10m","20m","30m","50m","25m avg","50m avg")
sum90$PLD<-"90"
sum90$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum90$"# Larvae Transported to NWHI"<-degreet$NWHI
sum90$"# Larvae Transported to MHI"<-degreet$MHI
sum90[is.na(sum90)] <- "None"
sum90<-sum90[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

##############
#PLD 180
all0m5m_180<-merge(m0_180,m5_180,all = TRUE,by="comparison") #merge
colnames(all0m5m_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m")
all0m10m_180<-merge(all0m5m_180,m10_180,all = TRUE,by="comparison") #merge
colnames(all0m10m_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m")
all0m20m_180<-merge(all0m10m_180,m20_180,all = TRUE,by="comparison") #merge
colnames(all0m20m_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m")
all0m30m_180<-merge(all0m20m_180,m30_180,all = TRUE,by="comparison") #merge
colnames(all0m30m_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m")
all0m50m_180<-merge(all0m30m_180,m50_180,all = TRUE,by="comparison") #merge
colnames(all0m50m_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m")
all0m25avg_180<-merge(all0m50m_180,avg25_180,all = TRUE,by="comparison") #merge
colnames(all0m25avg_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25 avg","# Particles Settled 25 avg")
all_180<-merge(all0m25avg_180,avg50_180,all = TRUE,by="comparison") #merge
colnames(all_180)<-c("comparison","Connection 0m","# Particles Settled 0m","Connection 5m","# Particles Settled 5m","Connection 10m","# Particles Settled 10m","Connection 20m","# Particles Settled 20m","Connection 30m","# Particles Settled 30m","Connection 50m","# Particles Settled 50m","Connection 25m avg","# Particles Settled 25m avg","Connection 50m avg","# Particles Settled 50m avg")

all_180[is.na(all_180)] <- "Not"

all_different_180<-all_180[(all_180$'Connection 0m' =="Not" | all_180$'Connection 5m' =="Not" |  all_180$'Connection 10m' =="Not"|  all_180$'Connection 20m' =="Not"|  all_180$'Connection 30m' =="Not"|  all_180$'Connection 50m' =="Not"|  all_180$'Connection 25m avg' =="Not"|  all_180$'Connection 50m avg' =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_180,"depth_connectivity_matrix_differences_PLD180days_precomp15days_settledist10km.csv")
all_180$shared<-all_180$'Connection 0m'
all_180$shared[all_180$'Connection 0m' =="Not" | all_180$'Connection 5m' =="Not" |  all_180$'Connection 10m' =="Not"|  all_180$'Connection 20m' =="Not"|  all_180$'Connection 30m' =="Not"|  all_180$'Connection 50m' =="Not"|  all_180$'Connection 25m avg' =="Not"|  all_180$'Connection 50m avg' =="Not"] <- "No"
all_180$shared[all_180$'Connection 0m' =="Not" | all_180$'Connection 5m' =="Not" |  all_180$'Connection 10m' =="Not"|  all_180$'Connection 20m' =="Not"|  all_180$'Connection 30m' =="Not"|  all_180$'Connection 50m' =="Not"|  all_180$'Connection 25m avg' =="Not"|  all_180$'Connection 50m avg' =="Not"] <- "Yes"
write.csv(all_180,"depth_all_connectivity_matrix_PLD180days_precomp15days_settledist10km.csv")

#make table about transport on broad scale
all_180[c('Release Site', 'Settled Site')] <- str_split_fixed(all_180$comparison, ' / ', 2)
all_180$Region_Settled<-all_180$`Settled Site`
all_180$Region_Settled[all_180$`Settled Site` == "Oahu" | all_180$`Settled Site` == "Hawaii" | all_180$`Settled Site` == "Kauai" | all_180$`Settled Site` == "Maui" | all_180$`Settled Site` == "Lanai" | all_180$`Settled Site` == "Kahoolawe" | all_180$`Settled Site` == "Molokai" | all_180$`Settled Site` == "??" | all_180$`Settled Site` == "Niihau"| all_180$`Settled Site` == "Kaula"]<-"MHI"
all_180$Region_Settled[all_180$`Settled Site` == "NW_Main_Hawaiin_Bank_2" | all_180$`Settled Site` == "NW_Main_Hawaiin_Bank_1" | all_180$`Settled Site` == "Nihoa_Island" | all_180$`Settled Site` == "Necker_Island" | all_180$`Settled Site` == "French_Frigate_Shoals" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_3" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_2" | all_180$`Settled Site` == "St._Rogatien_SE_Bank_1" | all_180$`Settled Site` == "St._Rogatien_Bank"| all_180$`Settled Site` == "Bank_west_of_St._Rogatien_Bank" | all_180$`Settled Site` == "Gardner_Pinnacles" | all_180$`Settled Site` == "Laysan_South_Pinnacle" | all_180$`Settled Site` == "Maro_Reef" | all_180$`Settled Site` == "Raita_Bank" | all_180$`Settled Site` == "Laysan_West_pinnacle" | all_180$`Settled Site` == "Laysan_Island" | all_180$`Settled Site` == "Pioneer_Bank" | all_180$`Settled Site` == "Lisianski_Island" | all_180$`Settled Site` == "Pearl_and_Hermes_Atoll" | all_180$`Settled Site` == "Midway_Islands" | all_180$`Settled Site` == "Kure_Atoll"]<-"NWHI"

all_180[all_180 == "Not"] <- 0
all_180[is.na(all_180)]<-0
all_180$"# Particles Settled 0m"<- as.numeric(all_180$"# Particles Settled 0m")
all_180$"# Particles Settled 5m"<- as.numeric(all_180$"# Particles Settled 5m")
all_180$"# Particles Settled 10m"<- as.numeric(all_180$"# Particles Settled 10m")
all_180$"# Particles Settled 20m"<- as.numeric(all_180$"# Particles Settled 20m")
all_180$"# Particles Settled 30m"<- as.numeric(all_180$"# Particles Settled 30m")
all_180$"# Particles Settled 50m"<- as.numeric(all_180$"# Particles Settled 50m")
all_180$"# Particles Settled 25m avg"<- as.numeric(all_180$"# Particles Settled 25m avg")
all_180$"# Particles Settled 50m avg"<- as.numeric(all_180$"# Particles Settled 50m avg")

heatmap180<-aggregate(cbind(all_180$'# Particles Settled 0m',all_180$'# Particles Settled 5m',all_180$'# Particles Settled 10m',all_180$'# Particles Settled 20m',all_180$'# Particles Settled 30m',all_180$'# Particles Settled 50m',all_180$'# Particles Settled 25m avg',all_180$'# Particles Settled 50m avg') ~ all_180$`Release Site`+all_180$Region_Settled, FUN=sum) 
colnames(heatmap180)<-c("Release_Site","Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
heatmap180$PLD<-"180"

degree<-aggregate(cbind(all_180$'# Particles Settled 0m',all_180$'# Particles Settled 5m',all_180$'# Particles Settled 10m',all_180$'# Particles Settled 20m',all_180$'# Particles Settled 30m',all_180$'# Particles Settled 50m',all_180$'# Particles Settled 25m avg',all_180$'# Particles Settled 50m avg'), list(all_180$Region_Settled), FUN=sum) 
colnames(degree)<-c("Region_Settled","0m","5m","10m","20m","30m","50m","25m avg","50m avg")
degreet <- degree[,-1]
rownames(degreet) <- degree[,1]
degreet<-as.data.frame(t(degreet))
all_180_region<-all_180[c("Release Site", "Region_Settled","Connection 0m","Connection 5m","Connection 10m","Connection 20m","Connection 30m","Connection 50m","Connection 25m avg","Connection 50m avg")]
all_180_region<-all_180_region[!duplicated(all_180_region), ]
melt180<-melt(all_180_region, id.vars=c("Release Site", "Region_Settled"))
melt180<-melt180[melt180$value == "Settled",]
melt180<-melt180[c("Release Site", "Region_Settled","variable")]
melt180<-melt180[!duplicated(melt180), ]
melt180<-melt180[order(melt180[,'Region_Settled']), ]
sum180<-aggregate(melt180$`Release Site` ~ variable + Region_Settled, data = melt180, paste, collapse = ",")
sum180<-sum180[!duplicated(sum180), ]
sum180$Release_Site<-as.character(sum180$'melt180$`Release Site`')
sum180<-dcast(sum180,sum180$variable~sum180$Region_Settled,value.var = "Release_Site")
sum180$Parameter<-c("0m","5m","10m","20m","30m","50m","25m avg","50m avg")
sum180$PLD<-"180"
sum180$"# Larvae Transported to Johnston"<-degreet$Johnston_Atoll
sum180$"# Larvae Transported to NWHI"<-degreet$NWHI
sum180$"# Larvae Transported to MHI"<-degreet$MHI
sum180[is.na(sum180)] <- "None"
sum180<-sum180[c("Parameter","PLD","MHI","# Larvae Transported to MHI","NWHI","# Larvae Transported to NWHI","Johnston_Atoll","# Larvae Transported to Johnston")]

#############

finalall<-rbind(sum30,sum60)
finalall<-rbind(finalall,sum90)
finalall<-rbind(finalall,sum180)
write.csv(finalall,"HawaiiConnections_depth_precomp15days_settledist10km.csv")

heatmapall<-rbind(heatmap30,heatmap60)
heatmapall<-rbind(heatmapall,heatmap90)
heatmapall<-rbind(heatmapall,heatmap180)
write.csv(heatmapall,"heatmap_depth_precomp15days_settledist10km.csv")
