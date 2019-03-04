

library(ggplot2)
library(gridExtra)
library(foreach)

df = data.frame(Individual = rep(LETTERS[1:4], 3), Sample = rep(1:4, 3))

df$value = as.numeric(df$Individual)
col = c('#15e006ff', '#06e0c4ff', '#0b32dbff', '#db0bacff') 
df$y = as.numeric(df$Individual) + rnorm(nrow(df), 0, .6)

ymax = max(df$y)
figList = foreach(i = 1:nrow(df)) %do% {
	ggplot(df[i,,drop=FALSE],aes(Sample, y)) + geom_bar(stat="identity", fill=col[df$Individual[i]]) + ylim(0, ymax) + xlab(df$Individual[i]) + theme_bw(12) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.title=element_blank(), panel.border=element_blank(),
        axis.text=element_blank(), axis.line=element_blank(), 
        axis.ticks=element_blank()) + ylab('') 
}

fig = do.call("grid.arrange", c(figList, ncol=4))

file = '/Users/gabrielhoffman/workspace/my_website/static/img/dream_icon2.pdf'
ggsave(fig, file=file)






