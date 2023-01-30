library("ggplot2")
library("tidyr")
library("viridis")
setwd("/Users/taylorely/Documents/Grad_Work/OceanModeling/heatmaps")
#load data
particles<-read.csv("heatmap_numberparticles_precomp15days_settledist10km.csv", header = TRUE)
#change to percent: settled per release location / total settled at the settlement site
totals<-aggregate(cbind(particles$X100,particles$X250,particles$X500,particles$X1000) ~ particles$Region_Settled+particles$PLD, FUN=sum) 
colnames(totals)<-c("Region_Settled","PLD","100 total","250 total","500 total","1000 total")
parttotal<-merge(particles, totals, by=c("Region_Settled","PLD"))
parttotal$"100"<-parttotal$X100/parttotal$`100 total`*100
parttotal$"250"<-parttotal$X250/parttotal$`250 total`*100
parttotal$"500"<-parttotal$X500/parttotal$`500 total`*100
parttotal$"1000"<-parttotal$X1000/parttotal$`1000 total`*100
particles_final<-parttotal[c("Release_Site","Region_Settled","PLD","100","250","500","1000")]

#change to format for heatmaps
particleslong <- pivot_longer(data = particles_final, 
                          cols = -c(Release_Site, Region_Settled, PLD), 
                          names_to = "parameter", 
                          values_to = "settlement")
particleslong$settlement[particleslong$settlement==0]<-"NA"
particleslong$settlement<-as.numeric(particleslong$settlement)
particleslong$PLD<-as.factor(particleslong$PLD)

# New facet label names for PLD
PLDlab <- c("PLD: 30 days", "PLD: 60 days", "PLD: 90 days","PLD: 180 days")
names(PLDlab) <- c("30", "60","90","180")

# New facet label names for Region_Settled
settlelab <- c("Settled in Main Hawaiian Islands", "Settled in Northwestern Hawaiian Islands", "Settled at Johnston Atoll")
names(settlelab) <- c("MHI","NWHI","Johnston_Atoll")



jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles5.jpeg", width=10, height=6, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = Release_Site ,y = factor(parameter, levels=c("100","250","500","1000")),fill = settlement)) +
  scale_fill_viridis(name = "Regional Settlement", na.value="grey95") +
  geom_tile(color="white",lwd=0.8,linetype=1) +
  theme (panel.grid.major=element_blank(),
         panel.border = element_rect(color = "white",fill=NA),
         panel.background = element_rect(fill="grey95"),
         axis.text.x = element_text(size=9,angle = 90, vjust = 0.5, hjust=1),
         axis.text.y = element_text(size=9), 
         axis.title.x = element_text(size=22),
         axis.title.y = element_text(size=22), 
         legend.title = element_text(size=10), 
         legend.text = element_text(size=9), 
         legend.text.align = 0,
         legend.key.height = unit(0.3,"in"), 
         legend.key.width = unit(0.4, "in"), 
         legend.margin = margin(0,0,0,0)) + 
  ylab(label = "Number of Particles Released") +
  xlab(label = "Source Island") +
  facet_grid(PLD ~ Region_Settled, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()


#########################################################################3
#load data
interval<-read.csv("heatmap_releaseinterval_precomp15days_settledist10km.csv", header = TRUE)
#change to percent: settled per release location / total settled at the settlement site
totals<-aggregate(cbind(interval$daily,interval$every.4.days,interval$every.7.days) ~ interval$Region_Settled+interval$PLD, FUN=sum) 
colnames(totals)<-c("Region_Settled","PLD","daily total","4 day total","7 day total")
inttotal<-merge(interval, totals, by=c("Region_Settled","PLD"))
inttotal$"daily"<-inttotal$daily/inttotal$`daily total`*100
inttotal$"every 4 days"<-inttotal$every.4.days/inttotal$`4 day total`*100
inttotal$"every 7 days"<-inttotal$every.7.days/inttotal$`7 day total`*100
interval_final<-inttotal[c("Release_Site","Region_Settled","PLD","daily","every 4 days","every 7 days")]

#change to format for heatmaps
intervallong <- pivot_longer(data = interval_final, 
                              cols = -c(Release_Site, Region_Settled, PLD), 
                              names_to = "parameter", 
                              values_to = "settlement")
intervallong$settlement[intervallong$settlement==0]<-"NA"
intervallong$settlement<-as.numeric(intervallong$settlement)
intervallong$PLD<-as.factor(intervallong$PLD)


jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_interval5.jpeg", width=10, height=6, units="in",res=600)
partheatmap2 <- ggplot(data = intervallong, mapping = aes(x = Release_Site ,y = parameter,fill = settlement)) +
  scale_fill_viridis(name = "Regional Settlement", na.value="white") +
  theme (panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         panel.border = element_rect(color = "grey",fill=NA),
         panel.background = element_rect(fill="white"),
         axis.text.x = element_text(size=9,angle = 90, vjust = 0.5, hjust=1),
         axis.text.y = element_text(size=9), 
         axis.title.x = element_text(size=22),
         axis.title.y = element_text(size=22), 
         legend.title = element_text(size=10), 
         legend.text = element_text(size=9), 
         legend.text.align = 0,
         legend.key.height = unit(0.16,"in"), 
         legend.key.width = unit(0.13, "in"), 
         legend.margin = margin(0,0,0,0)) + 
  geom_tile(color="white") +
  ylab(label = "Particle Release Interval") +
  xlab(label = "Source Island") +
  facet_grid(PLD ~ Region_Settled, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()



#########################################################################3
#load data
diffusivity<-read.csv("heatmap_diffusivity_precomp15days_settledist10km.csv", header = TRUE)
#change to percent: settled per release location / total settled at the settlement site
totals<-aggregate(cbind(diffusivity$kh0,diffusivity$kh10,diffusivity$kh50,diffusivity$kh50.repeat) ~ diffusivity$Region_Settled+diffusivity$PLD, FUN=sum) 
colnames(totals)<-c("Region_Settled","PLD","kh0 total","kh10 total","kh50 total","kh 50 repeat total")
difftotal<-merge(diffusivity, totals, by=c("Region_Settled","PLD"))
difftotal$"0"<-difftotal$kh0/difftotal$`kh0 total`*100
difftotal$"10"<-difftotal$kh10/difftotal$`kh10 total`*100
difftotal$"50"<-difftotal$kh50/difftotal$`kh50 total`*100
difftotal$"50 repeat"<-difftotal$kh50.repeat/difftotal$`kh 50 repeat total`*100
diffusivity_final<-difftotal[c("Release_Site","Region_Settled","PLD","0","10","50","50 repeat")]

#change to format for heatmaps
diffusivitylong <- pivot_longer(data = diffusivity_final, 
                             cols = -c(Release_Site, Region_Settled, PLD), 
                             names_to = "parameter", 
                             values_to = "settlement")
diffusivitylong$settlement[diffusivitylong$settlement==0]<-"NA"
diffusivitylong$settlement<-as.numeric(diffusivitylong$settlement)
diffusivitylong$PLD<-as.factor(diffusivitylong$PLD)


jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_diffusivity5.jpeg", width=10, height=6, units="in",res=600)
partheatmap2 <- ggplot(data = diffusivitylong, mapping = aes(x = Release_Site ,y = parameter,fill = settlement)) +
  scale_fill_viridis(name = "Regional Settlement", na.value="white") +
  theme (panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         panel.border = element_rect(color = "grey",fill=NA),
         panel.background = element_rect(fill="white"),
         axis.text.x = element_text(size=9,angle = 90, vjust = 0.5, hjust=1),
         axis.text.y = element_text(size=9), 
         axis.title.x = element_text(size=22),
         axis.title.y = element_text(size=22), 
         legend.title = element_text(size=10), 
         legend.text = element_text(size=9), 
         legend.text.align = 0,
         legend.key.height = unit(0.16,"in"), 
         legend.key.width = unit(0.13, "in"), 
         legend.margin = margin(0,0,0,0)) + 
  geom_tile(color="white") +
  ylab(label = "Diffusivity (m2/s)") +
  xlab(label = "Source Island") +
  facet_grid(PLD ~ Region_Settled, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()


#########################################################################3
#load data
depth<-read.csv("heatmap_depth_precomp15days_settledist10km.csv", header = TRUE)
#change to percent: settled per release location / total settled at the settlement site
totals<-aggregate(cbind(depth$X0m,depth$X5m,depth$X10m,depth$X20m,depth$X30m,depth$X50m,depth$X25m.avg,depth$X50m.avg) ~ depth$Region_Settled+depth$PLD, FUN=sum) 
colnames(totals)<-c("Region_Settled","PLD","0m total","5m total","10m total","20m total","30m total","50m total","25m avg total","50 avg total")
depthtotal<-merge(depth, totals, by=c("Region_Settled","PLD"))
depthtotal$"0"<-depthtotal$X0m/depthtotal$`0m total`*100
depthtotal$"5"<-depthtotal$X5m/depthtotal$`5m total`*100
depthtotal$"10"<-depthtotal$X10m/depthtotal$`10m total`*100
depthtotal$"20"<-depthtotal$X20m/depthtotal$`20m total`*100
depthtotal$"30"<-depthtotal$X30m/depthtotal$`30m total`*100
depthtotal$"50"<-depthtotal$X50m/depthtotal$`50m total`*100
depthtotal$"0-25 avg"<-depthtotal$X25m.avg/depthtotal$`25m avg total`*100
depthtotal$"0-50 avg"<-depthtotal$X50m.avg/depthtotal$`50 avg total`*100
depth_final<-depthtotal[c("Release_Site","Region_Settled","PLD","0","5","10","20","30","50","0-25 avg","0-50 avg")]

#change to format for heatmaps
depthlong <- pivot_longer(data = depth_final, 
                                cols = -c(Release_Site, Region_Settled, PLD), 
                                names_to = "parameter", 
                                values_to = "settlement")
depthlong$settlement[depthlong$settlement==0]<-"NA"
depthlong$settlement<-as.numeric(depthlong$settlement)
depthlong$PLD<-as.factor(depthlong$PLD)


jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_depth5.jpeg", width=10, height=6, units="in",res=600)
partheatmap2 <- ggplot(data = depthlong, mapping = aes(x = Release_Site ,y = factor(parameter,levels = c("0","5","10","20","30","50","0-25 avg","0-50 avg")),fill = settlement)) +
  scale_fill_viridis(name = "Regional Settlement", na.value="white") +
  theme (panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         panel.border = element_rect(color = "grey",fill=NA),
         panel.background = element_rect(fill="white"),
         axis.text.x = element_text(size=9,angle = 90, vjust = 0.5, hjust=1),
         axis.text.y = element_text(size=9), 
         axis.title.x = element_text(size=22),
         axis.title.y = element_text(size=22), 
         legend.title = element_text(size=10), 
         legend.text = element_text(size=9), 
         legend.text.align = 0,
         legend.key.height = unit(0.16,"in"), 
         legend.key.width = unit(0.13, "in"), 
         legend.margin = margin(0,0,0,0)) + 
  geom_tile(color="white") +
  ylab(label = "Particle Release Depth (m)") +
  xlab(label = "Source Island") +
  facet_grid(PLD ~ Region_Settled, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()


#######################################################
######################################################
#######################################################
########################################################
# Other versions
#make heatmap
jpeg(here("heatmap_particles.jpeg"), width=8, height=8, units="in",res=600)
partheatmap <- ggplot(data = particleslong, mapping = aes(x = Region_Settled,y = Release_Site,fill = settlement)) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  scale_fill_gradient(na.value="white")+
  theme (axis.text.x = element_text(size=7), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  xlab(label = "Region Settled") +
  facet_grid(PLD ~ parameter , scales = "free", space = "free")
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles2.jpeg", width=8, height=8, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = Region_Settled,y = Release_Site,fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  xlab(label = "Region Settled") +
  ylab(label = "Source Island") +
  facet_grid(factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")) ~ PLD, scales = "free", space = "free",labeller = labeller(PLD=PLDlab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles3.jpeg", width=12, height=7, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = Release_Site ,y = Region_Settled,fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  ylab(label = "Region Settled") +
  xlab(label = "Source Island") +
  facet_grid(factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")) ~ PLD, scales = "free", space = "free",labeller = labeller(PLD=PLDlab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles4.jpeg", width=15, height=6, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = Release_Site ,y = Region_Settled,fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  ylab(label = "Region Settled") +
  xlab(label = "Source Island") +
  facet_grid(PLD ~ factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")), scales = "free", space = "free",labeller = labeller(PLD=PLDlab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles6.jpeg", width=12, height=10, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),y = Release_Site,fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  xlab(label = "Number of Particles Released") +
  ylab(label = "Source Island") +
  facet_grid(PLD ~ Region_Settled, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles7.jpeg", width=12, height=9, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = Release_Site ,y = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  ylab(label = "Number of Particles Released") +
  xlab(label = "Source Island") +
  facet_grid(Region_Settled ~ PLD, scales = "free", space = "free",labeller = labeller(PLD=PLDlab,Region_Settled=settlelab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles8.jpeg", width=12, height=9, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = PLD ,y = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  ylab(label = "Number of Particles Released") +
  xlab(label = "PLD") +
  facet_grid(Release_Site ~ Region_Settled, scales = "free", space = "free",labeller = labeller(Region_Settled=settlelab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles9.jpeg", width=12, height=15, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(y = PLD ,x = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  xlab(label = "Number of Particles Released") +
  ylab(label = "PLD") +
  facet_grid(Release_Site ~ Region_Settled, scales = "free", space = "free",labeller = labeller(Region_Settled=settlelab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles10.jpeg", width=12, height=10, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(y = PLD ,x = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  xlab(label = "Number of Particles Released") +
  ylab(label = "PLD") +
  facet_grid(Region_Settled ~ Release_Site, scales = "free", space = "free",labeller = labeller(Region_Settled=settlelab))
partheatmap2
dev.off()

jpeg("/Users/taylorely/Documents/OceanModeling/heatmap_particles11.jpeg", width=13, height=9, units="in",res=600)
partheatmap2 <- ggplot(data = particleslong, mapping = aes(x = PLD ,y = factor(parameter, levels=c("100 particles","100 particles repeat","250 particles","500 particles","750 particles","1000 particles")),fill = settlement, na.value="white")) +
  scale_fill_viridis(name = "Percent Settled", na.value="white") +
  theme (axis.text.x = element_text(size=7,angle = 90, vjust = 0.5, hjust=1), axis.text.y = element_text(size=6), axis.title.x = element_text(size=18),axis.title.y = element_text(size=18), legend.title = element_text(size=10), legend.text = element_text(size=9), legend.text.align = 0 ) + theme(legend.key.height = unit(0.16,"in"), legend.key.width = unit(0.13, "in"), legend.margin = margin(0,0,0,0)) +
  geom_tile(color="white") +
  ylab(label = "Number of Particles Released") +
  xlab(label = "PLD") +
  facet_grid(Region_Settled ~ Release_Site, scales = "free", space = "free",labeller = labeller(Region_Settled=settlelab))
partheatmap2
dev.off()


