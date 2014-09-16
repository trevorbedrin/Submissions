##Movie Data Check-in Submission

I used a log-linear regression model with several features:

Budget
Budget^2
Budget^3
Runtime
Release Month
Rating (as dummy features)
Genre (as dummy features)

To attempt to predict Total Domestic Box Office gross.  

In this first figure, the <a color='blue'>results of the model</a> (predicted log(Gross)) are plotted against the <a color='red'>actual</a> log(Gross) for the testing set.
![](./img/log.png)

The second figure shows the <a color='blue'>results of the model</a>, after converting the log value back into a decimal value, plotted against the <a color='red'>actual</a> Domestic Gross values for the testing set.
![](./img/lin.png)

