###################
# Create tables to pull out differences in larval connections between sensitivity runs, example used for number of particles sensitivity test
###################

# load libraries
library(tidyr)
library(dplyr)
#set folder
setwd("/Users/taylorely/Documents/OceanModeling")

###############################################
# load files created from nearest_neighbor.ipynb

#100 particles released per event for PLD of 30, 60, 90, and 180 days
n100_30<-read.table("settled_per_release_and_settledsite_n100_PLD30_settledist10.csv",sep="\t", header = TRUE)
n100_30$comparison<-paste(n100_30$release_site,"/",n100_30$closest_island) # create a column that contains both the release and settled site
n100_30<-n100_30[4:6] # keep only the column that just created, whether the particles were close enough to be considered settled, and how many particles were settled
n100_30<-n100_30[n100_30$Settled=="Settled",] # only keep rows with settled particles

n100_60<-read.table("settled_per_release_and_settledsite_n100_PLD60_settledist10.csv",sep="\t", header = TRUE)
n100_60$comparison<-paste(n100_60$release_site,"/",n100_60$closest_island)
n100_60<-n100_60[4:6]
n100_60<-n100_60[n100_60$Settled=="Settled",]

n100_90<-read.table("settled_per_release_and_settledsite_n100_PLD90_settledist10.csv",sep="\t", header = TRUE)
n100_90$comparison<-paste(n100_90$release_site,"/",n100_90$closest_island)
n100_90<-n100_90[4:6]
n100_90<-n100_90[n100_90$Settled=="Settled",]

n100_180<-read.table("settled_per_release_and_settledsite_n100_PLD180_settledist10.csv",sep="\t", header = TRUE)
n100_180$comparison<-paste(n100_180$release_site,"/",n100_180$closest_island)
n100_180<-n100_180[4:6]
n100_180<-n100_180[n100_180$Settled=="Settled",]


###################
#100 repeat
n100_repeat_30<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD30_settledist10.csv",sep="\t", header = TRUE)
n100_repeat_30$comparison<-paste(n100_repeat_30$release_site,"/",n100_repeat_30$closest_island)
n100_repeat_30<-n100_repeat_30[4:6]
n100_repeat_30<-n100_repeat_30[n100_repeat_30$Settled=="Settled",]

n100_repeat_60<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD60_settledist10.csv",sep="\t", header = TRUE)
n100_repeat_60$comparison<-paste(n100_repeat_60$release_site,"/",n100_repeat_60$closest_island)
n100_repeat_60<-n100_repeat_60[4:6]
n100_repeat_60<-n100_repeat_60[n100_repeat_60$Settled=="Settled",]

n100_repeat_90<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD90_settledist10.csv",sep="\t", header = TRUE)
n100_repeat_90$comparison<-paste(n100_repeat_90$release_site,"/",n100_repeat_90$closest_island)
n100_repeat_90<-n100_repeat_90[4:6]
n100_repeat_90<-n100_repeat_90[n100_repeat_90$Settled=="Settled",]

n100_repeat_180<-read.table("settled_per_release_and_settledsite_n100_repeat_PLD180_settledist10.csv",sep="\t", header = TRUE)
n100_repeat_180$comparison<-paste(n100_repeat_180$release_site,"/",n100_repeat_180$closest_island)
n100_repeat_180<-n100_repeat_180[4:6]
n100_repeat_180<-n100_repeat_180[n100_repeat_180$Settled=="Settled",]

###################
#250
n250_30<-read.table("settled_per_release_and_settledsite_n250_PLD30_settledist10.csv",sep="\t", header = TRUE)
n250_30$comparison<-paste(n250_30$release_site,"/",n250_30$closest_island)
n250_30<-n250_30[4:6]
n250_30<-n250_30[n250_30$Settled=="Settled",]

n250_60<-read.table("settled_per_release_and_settledsite_n250_PLD60_settledist10.csv",sep="\t", header = TRUE)
n250_60$comparison<-paste(n250_60$release_site,"/",n250_60$closest_island)
n250_60<-n250_60[4:6]
n250_60<-n250_60[n250_60$Settled=="Settled",]

n250_90<-read.table("settled_per_release_and_settledsite_n250_PLD90_settledist10.csv",sep="\t", header = TRUE)
n250_90$comparison<-paste(n250_90$release_site,"/",n250_90$closest_island)
n250_90<-n250_90[4:6]
n250_90<-n250_90[n250_90$Settled=="Settled",]

n250_180<-read.table("settled_per_release_and_settledsite_n250_PLD180_settledist10.csv",sep="\t", header = TRUE)
n250_180$comparison<-paste(n250_180$release_site,"/",n250_180$closest_island)
n250_180<-n250_180[5:7]
n250_180<-n250_180[n250_180$Settled=="Settled",]


###################
#500 
n500_30<-read.table("settled_per_release_and_settledsite_n500_PLD30_settledist10.csv",sep="\t", header = TRUE)
n500_30$comparison<-paste(n500_30$release_site,"/",n500_30$closest_island)
n500_30<-n500_30[5:7]
n500_30<-n500_30[n500_30$Settled=="Settled",]

n500_60<-read.table("settled_per_release_and_settledsite_n500_PLD60_settledist10.csv",sep="\t", header = TRUE)
n500_60$comparison<-paste(n500_60$release_site,"/",n500_60$closest_island)
n500_60<-n500_60[5:7]
n500_60<-n500_60[n500_60$Settled=="Settled",]

n500_90<-read.table("settled_per_release_and_settledsite_n500_PLD90_settledist10.csv",sep="\t", header = TRUE)
n500_90$comparison<-paste(n500_90$release_site,"/",n500_90$closest_island)
n500_90<-n500_90[5:7]
n500_90<-n500_90[n500_90$Settled=="Settled",]

n500_180<-read.table("settled_per_release_and_settledsite_n500_PLD180_settledist10.csv",sep="\t", header = TRUE)
n500_180$comparison<-paste(n500_180$release_site,"/",n500_180$closest_island)
n500_180<-n500_180[5:7]
n500_180<-n500_180[n500_180$Settled=="Settled",]

###################
#750
n750_30<-read.table("settled_per_release_and_settledsite_n750_PLD30_settledist10.csv",sep="\t", header = TRUE)
n750_30$comparison<-paste(n750_30$release_site,"/",n750_30$closest_island)
n750_30<-n750_30[5:7]
n750_30<-n750_30[n750_30$Settled=="Settled",]

n750_60<-read.table("settled_per_release_and_settledsite_n750_PLD60_settledist10.csv",sep="\t", header = TRUE)
n750_60$comparison<-paste(n750_60$release_site,"/",n750_60$closest_island)
n750_60<-n750_60[5:7]
n750_60<-n750_60[n750_60$Settled=="Settled",]

n750_90<-read.table("settled_per_release_and_settledsite_n750_PLD90_settledist10.csv",sep="\t", header = TRUE)
n750_90$comparison<-paste(n750_90$release_site,"/",n750_90$closest_island)
n750_90<-n750_90[5:7]
n750_90<-n750_90[n750_90$Settled=="Settled",]

n750_180<-read.table("settled_per_release_and_settledsite_n750_PLD180_settledist10.csv",sep="\t", header = TRUE)
n750_180$comparison<-paste(n750_180$release_site,"/",n750_180$closest_island)
n750_180<-n750_180[5:7]
n750_180<-n750_180[n750_180$Settled=="Settled",]

###################
#1000
n1000_30<-read.table("settled_per_release_and_settledsite_n1000_PLD30_settledist10.csv",sep="\t", header = TRUE)
n1000_30$comparison<-paste(n1000_30$release_site,"/",n1000_30$closest_island)
n1000_30<-n1000_30[5:7]
n1000_30<-n1000_30[n1000_30$Settled=="Settled",]

n1000_60<-read.table("settled_per_release_and_settledsite_n1000_PLD60_settledist10.csv",sep="\t", header = TRUE)
n1000_60$comparison<-paste(n1000_60$release_site,"/",n1000_60$closest_island)
n1000_60<-n1000_60[5:7]
n1000_60<-n1000_60[n1000_60$Settled=="Settled",]

n1000_90<-read.table("settled_per_release_and_settledsite_n1000_PLD90_settledist10.csv",sep="\t", header = TRUE)
n1000_90$comparison<-paste(n1000_90$release_site,"/",n1000_90$closest_island)
n1000_90<-n1000_90[5:7]
n1000_90<-n1000_90[n1000_90$Settled=="Settled",]

n1000_180<-read.table("settled_per_release_and_settledsite_n1000_PLD180_settledist10.csv",sep="\t", header = TRUE)
n1000_180$comparison<-paste(n1000_180$release_site,"/",n1000_180$closest_island)
n1000_180<-n1000_180[5:7]
n1000_180<-n1000_180[n1000_180$Settled=="Settled",]

##############################################################################

#Make tables by merging all the different # particle runs per PLD and then only keep rows where there are differences

#PLD 30
all_100_30<-merge(n100_30,n100_repeat_30,all = TRUE,by="comparison") #merge
colnames(all_100_30)<-c("comparison","Connection_100_30","Particles_100_30","Connection_100repeat_30","Particles_100repeat_30")
all100250_30<-merge(all_100_30,n250_30,all = TRUE,by="comparison") #merge
colnames(all100250_30)<-c("comparison","Connection_100_30","Particles_100_30","Connection_100repeat_30","Particles_100repeat_30","Connection_250_30","Particles_250_30")
all100500_30<-merge(all100250_30,n500_30,all = TRUE,by="comparison") #merge
colnames(all100500_30)<-c("comparison","Connection_100_30","Particles_100_30","Connection_100repeat_30","Particles_100repeat_30","Connection_250_30","Particles_250_30","Connection_500_30","Particles_500_30")
all100750_30<-merge(all100500_30,n750_30,all = TRUE,by="comparison") #merge
colnames(all100750_30)<-c("comparison","Connection_100_30","Particles_100_30","Connection_100repeat_30","Particles_100repeat_30","Connection_250_30","Particles_250_30","Connection_500_30","Particles_500_30","Connection_750_30","Particles_750_30")
all_30<-merge(all100750_30,n1000_30,all = TRUE,by="comparison") #merge
colnames(all_30)<-c("comparison","Connection_100_30","Particles_100_30","Connection_100repeat_30","Particles_100repeat_30","Connection_250_30","Particles_250_30","Connection_500_30","Particles_500_30","Connection_750_30","Particles_750_30","Connection_1000_30","Particles_1000_30")

all_30[is.na(all_30)] <- "Not"

all_different_30<-all_30[(all_30$Connection_100_30 =="Not" | all_30$Connection_250_30 =="Not" | all_30$Connection_100repeat_30 =="Not" | all_30$Connection_500_30 =="Not" | all_30$Connection_1000_30 =="Not"| all_30$Connection_750_30 =="Not"),] # keep rows with differences so ones where not all settled
#no differences so wrote the similarities to a csv
write.csv(all_30,"connectivity_matrix_nodifferences_PLD30days_precomp15days_settledist10km.csv")

###################
#PLD 60
all_100_60<-merge(n100_60,n100_repeat_60,all = TRUE,by="comparison")
colnames(all_100_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60")
all100250_60<-merge(all_100_60,n250_60,all = TRUE,by="comparison")
colnames(all100250_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60","Connection_250_60","Particles_250_60")
all100500_60<-merge(all100250_60,n500_60,all = TRUE,by="comparison")
colnames(all100500_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60","Connection_250_60","Particles_250_60","Connection_500_60","Particles_500_60")
all100750_60<-merge(all100500_60,n750_60,all = TRUE,by="comparison")
colnames(all100750_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60","Connection_250_60","Particles_250_60","Connection_500_60","Particles_500_60","Connection_750_60","Particles_750_60")
all_60<-merge(all100750_60,n1000_60,all = TRUE,by="comparison")
colnames(all_60)<-c("comparison","Connection_100_60","Particles_100_60","Connection_100repeat_60","Particles_100repeat_60","Connection_250_60","Particles_250_60","Connection_500_60","Particles_500_60","Connection_750_60","Particles_750_60","Connection_1000_60","Particles_1000_60")

all_60[is.na(all_60)] <- "Not"

all_different_60<-all_60[(all_60$Connection_100_60 =="Not" | all_60$Connection_250_60 =="Not" | all_60$Connection_100repeat_60 =="Not" | all_60$Connection_500_60 =="Not" | all_60$Connection_1000_60 =="Not"| all_60$Connection_750_60 =="Not"),]
#no differences
write.csv(all_different_60,"connectivity_matrix_PLD60days_precomp15days_settledist10km.csv")


###################
#PLD 90
all_100_90<-merge(n100_90,n100_repeat_90,all = TRUE,by="comparison")
colnames(all_100_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90")
all100250_90<-merge(all_100_90,n250_90,all = TRUE,by="comparison")
colnames(all100250_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90","Connection_250_90","Particles_250_90")
all100500_90<-merge(all100250_90,n500_90,all = TRUE,by="comparison")
colnames(all100500_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90","Connection_250_90","Particles_250_90","Connection_500_90","Particles_500_90")
all100750_90<-merge(all100500_90,n750_90,all = TRUE,by="comparison")
colnames(all100750_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90","Connection_250_90","Particles_250_90","Connection_500_90","Particles_500_90","Connection_750_90","Particles_750_90")
all_90<-merge(all100750_90,n1000_90,all = TRUE,by="comparison")
colnames(all_90)<-c("comparison","Connection_100_90","Particles_100_90","Connection_100repeat_90","Particles_100repeat_90","Connection_250_90","Particles_250_90","Connection_500_90","Particles_500_90","Connection_750_90","Particles_750_90","Connection_1000_90","Particles_1000_90")

all_90[is.na(all_90)] <- "Not"

all_different_90<-all_90[(all_90$Connection_100_90 =="Not" | all_90$Connection_250_90 =="Not" | all_90$Connection_100repeat_90 =="Not" | all_90$Connection_500_90 =="Not" | all_90$Connection_1000_90 =="Not"| all_90$Connection_750_90 =="Not"),]
#no differences
write.csv(all_different_90,"connectivity_matrix_PLD90days_precomp15days_settledist10km.csv")


###################
#PLD 180
all_100_180<-merge(n100_180,n100_repeat_180,all = TRUE,by="comparison")
colnames(all_100_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180")
all100250_180<-merge(all_100_180,n250_180,all = TRUE,by="comparison")
colnames(all100250_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180","Connection_250_180","Particles_250_180")
all100500_180<-merge(all100250_180,n500_180,all = TRUE,by="comparison")
colnames(all100500_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180","Connection_250_180","Particles_250_180","Connection_500_180","Particles_500_180")
all100750_180<-merge(all100500_180,n750_180,all = TRUE,by="comparison")
colnames(all100750_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180","Connection_250_180","Particles_250_180","Connection_500_180","Particles_500_180","Connection_750_180","Particles_750_180")
all_180<-merge(all100750_180,n1000_180,all = TRUE,by="comparison")
colnames(all_180)<-c("comparison","Connection_100_180","Particles_100_180","Connection_100repeat_180","Particles_100repeat_180","Connection_250_180","Particles_250_180","Connection_500_180","Particles_500_180","Connection_750_180","Particles_750_180","Connection_1000_180","Particles_1000_180")

all_180[is.na(all_180)] <- "Not"

all_different_180<-all_180[(all_180$Connection_100_180 =="Not" | all_180$Connection_250_180 =="Not" | all_180$Connection_100repeat_180 =="Not" | all_180$Connection_500_180 =="Not" | all_180$Connection_1000_180 =="Not"| all_180$Connection_750_180 =="Not"),]
#no differences
write.csv(all_different_180,"connectivity_matrix_PLD180days_precomp15days_settledist10km.csv")

