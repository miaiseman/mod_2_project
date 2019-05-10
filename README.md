
# Module 2 Final Project Submission
This is an assignment and is a fictional case study by Pat Fuller and Mia Iseman. All references, though they may exist, are not aware of this project or involved in any way.  
* <a href="https://github.com/MIAISEMAN/mod_2_project">Repository URL </a>
* <a href="https://docs.google.com/presentation/d/1iFk_YmiKlzh46s8aogALnfsZf9R_KxXqXBvpXvXAoNE/edit?usp=sharing">Presentation URL </a>

# Goal: 
## Deliver insights to help Lou Taylor decide on which musicians to manage or book for residences in Vegas. 

# Process
1. Understand the business needs.
2. Understand the data overall.
3. For each hypothesis:  
    A. Understand the data.  
    B. Prepare the data.*  
    C. Test the hypothesis.*   
    D. Evaluate our results.  
4. Deploy our project.

*Shown in the Jupyter notebook within our repository. 

# Business Understanding 

Lou Taylor, one of the most successful managers for musicians, boasts an all-star roster of clients, including Steven Tyler, Gwen Stefani, Florida Georgia Line and J Lo's Vegas residency. 

She has hired us to deliver insights about several factors that might help her decide on which artists to manage or book for residences in Vegas. As a jumping off point, we will answer the following questions:  
<b>
1. Are self-released albums scored lower than the wider population?  
2. Are "best new music" albums more prevalent in a certain genre?
3. Of the ten most prolific labels, does one label have more "best new music" albums than the others?
4. Does one reviewer score albums lower than all others? 
5. Of the top ten highest-rated artists from the 2000s, does their recent album get scored better than average? </b>

## Understand the Data Overall 
For this project we used the <a href="https://www.kaggle.com/nolanbconaway/pitchfork-data"> Kaggle Pitchfork dataset</a>, which is over 18,000 reviews of musical albums from <a href="https://pitchfork.com/reviews/albums/Pitchfork"> Pitchfork</a> published between 1999 and 2017. 

One limitation of our dataset is that all these music reviews come from the same company, Pitchfork. As such, our tests are not technically random. (What if other websites for music reviews operate much differently? What if we had data from before 1999 or after 2017, which is not the case here? Most importantly, what if Pitchfork only reviews a certain subset of the overall album population?) Since it is the dataset that we have, it will serve as "random enough." 

Similarly, another limitation of our findings is that in order to test the data and in order for our results to be relevant at all, we will interpret the entire Pitchfork review dataset as our "wider population." 

# 1. Are self-released albums scored lower than the wider population?

## Understand the data

### Data Details
Each review is for an album which is released by a record label, except in the case of the self-released albums. They are released by the artists themselves. 
We want to know if self-released albums get lower scores in their reviews than the wider population. 

### Hypotheses
<b> $H_0=$ Self-released albums are scored the same as or higher than the wider population.

$H_a=$ Self-released albums are scored lower than the wider population. </b>

### Statistical Significance
Even if we find that self-released albums are typically scored lower, we only want to know if this is a $statistically significant$ amount lower. Therefore, we'll decide on an $alpha$ value that will indicate the number of false positives we are comfortable having. As the chance of false positives goes up, the chance of false negatives goes down and vie versa. So we want to think about which one we are more comfortable getting. In this case, a false positive (type 1 error) would be that we say self-released albums are scored lower but they are not scored lower. A false negative (type 2 error), would be that we say self-released albums are scored the same or higher, but they are scored lower. In our estimation, Taylor could potentially ignore all of these self-released artists needlessly with a false positive, so false positives should be minimized. A false negative, however, is not as bad because she may still include self-released albums in her pool of potential musicians to represent. We put this false-positive-acceptance-rate into a number called $alpha$:

$$alpha =.025$$

What does this mean? Assume we do this same hypothesis test 40 different times, and each time the results tell us to accept that the self-released albums score lower. $alpha=.025$ indicates we are comfortable being wrong only one of those forty times.

<image> ![image.png](attachment:image.png) </image>

This graph displays the probability of finding a review score in a given a range for self-released (blue) and all labels (green). 

## Evaluate the Test Results

We were unable to find evidence against the hypothesis that self-released mean scores are equal to the overall album population with the current sample size.

# 2. Are "best new music" albums more prevelant in a certain genre?

## Understand the data

### Data Details
Each album that gets reviewed has the opportunity to be dubbed "Best New Music" (BNM). Most do not receieve this title. Each album also belongs to one particular genre. 

We want to know if the best new music title is given out more often in one or more specific genres. 

### Hypotheses
<b> $H_0=$ BNM albums equally prevalent across genres.

$H_a=$ BNM albums are more prevalent in one of the genres.
</b>
### Statistical Significance  
False positive: We say BNM albums are more prevalent in one or more genres, but they aren't.  
False negative: We say BNM albums are not more prevalent in one or more genres, but they are.    
We prefer to have false positives in this case, because a false negative means Taylor may potentially miss out on an important trend- one genre being "better" than the others. So, we choose   
$$alpha=.1$$   
We're comfortable with being wrong about them being more prevalent in a certain genre one out of 10 times.
Assume we do this same hypothesis test 10 different times, and each time the results tell us to accept that BNM albums are more prevalent in a certain genre. We are okay with being wrong one in ten times, which is fairly often, because if there is even a small chance that we could pick up on a trend, then we want Taylor to pay attention to that trend. If it turns out to be a dead end, that is okay compared to missing a trend. 

However, because we aren't just comparing to the overall population but rather to the spread of BNM titles <i> per genre </i> our alpha will actually need to become smaller to account for all the false positives possible in all the different alphas that one genre depends on. We use the Boneferroni Correction.  

![genre_means](genre_means.png)

## Evaluate the Test Results

This test failed to find evidence against the fact that BNM albums are equally prevalent across genres except in the case of the experimental genre. Experimental music tends to have a significant amount more Best New Music albums.  

# 3. Of the ten most prolific labels, does one label have more "best new music" albums than the others?

## Understand the data

### Hypotheses
<b> $H_0=$ BNM albums are equally prevalent across the ten most prolific labels.

$H_a=$ BNM albums are more prevalent in one or more of the most prolific labels.
</b>
### Statistical Significance  
False positive: We say BNM albums are more prevalent among one or more labels, but they aren't.  
False negative: We say BNM albums are not more prevalent in one or more labels, but they are.  
Simliar to question 2, we prefer to have false positives in this case, because a false negative means Taylor may potentially miss out on one label being "better" than the others. So, we choose   
$$alpha=.1$$ 
Again, we want to err on the side of recognizing a trend instead of missing one. We will use the Boneferroni Correction again in this instance since we are comparing multiple labels.  

## Evaluate the Test Results

These prolific labels tend to have more BNM albums than average:  
Sub Pop  
Thrill Jockey  
Warp  
Domino  
Matador  

# 4. Does one reviewer score albums lower than all others? 

## Understand the data

### Data Details
Pitchfork has a lot of authors that write reviews. It is unclear how these authors are chosen or who they are.  
We want to know if there is one reviewer that gives consistently low scores. If we compared all the authors to each other, we would need to use the Bonferonni correction and thus have a very low alpha threshold. Instead of likely accetping the null hypothesis, we will find the reviewer that has an above-average amount of reviews written but the lowest average review score. That reviewer is Alison Fields.

### Hypotheses
<b> $H_0=$ Alison Fields' scores are not much different than all the other scores. 

$H_a=$ Alison Fields' scores are lower than all the other scores.
</b>
### Statistical Significance  
False positive: We say Fields scores lower but she doesn't.
False negative: We say Fields scores are the same but they are lower. 
We prefer to have false positives in this case, because a false negative means Taylor may be influenced by Fields unecessarily, whereas a false positive means she will be extra cautious of anything from Alison Fields. 
$$alpha=.2$$   
We're comfortable with being wrong about Fields scoring lower one in five times. We're this comfortable because she is only one reviewer of many, and there are several other factors that Taylor evaluates by. It's not as if we're firing Fields, but it would be nice to know to ignore her if she is a "troll." 

![output_63_0](output_63_0.png)

## Evaluate the Results

This test failed to find evidence that Alison Fields rates all albums equally, and therefore we accept the alternative hypothesis that she scores reviews lower. However, keep in mind our $alpha$ was only .2. There is a 20% chance our results are due to chance.

# 5. Of the top twenty highest-rated artists from the 2000s, does their recent album get scored better than average?  

## Understand the data

### Data Details
Let's call artists "prolific" if they have at least one album review from 1999-2009 ("the 2000s") and at least one album review from 2014-2017 ("modern times"). Who are the 20 prolific artists that had the highest average album scores from the 2000s?  
John Coltrane  
The Avalanches  
Sly and the Family Stone  
The Velvet Underground  
Pavement  
Loretta Lynn  
Jawbox  
Albert Ayler  
The Feelies  
Gas  
Blur  
Otis Redding  
Elvis Presley  
This Heat  
Panda Bear  
Rhys Chatham  
Red Red Meat  
Nachtmystium  
Betty Davis  
Ennio Morricone

### Hypotheses
<b> $H_0=$ The artists in this subset do not have scores that are higher than the modern average.

$H_a=$ One or more artist(s) in this subset have higher scores than the modern average.
</b>
### Statistical Significance  
False positive: We say the artists have higher scores than the modern average, but they don't.
False negative: We say the artists do not have higher scores than modern average, but they do. 
We want to minimize false positives because Taylor may spend more time on these promising artists for potential Vegas residencies. We don't want to waste time on artists that wer're not very confident are going to be successful, which would be the case with a false positive. 
$$alpha=.01$$   
We will use the Boneferonni Correction here as well. 

## Evaluate
We cannot continue testing because we do not have enough data to sample. In many cases, these artists are not as prolific as we thought, leaving us with only 1 recent album. This doesn't give us enough degrees of freedom to test this sample set. 

# Deployment 

This project is available for perusal at: 
* <a href="https://github.com/MIAISEMAN/mod_2_project">Repository URL </a>
* <a href="https://docs.google.com/presentation/d/1iFk_YmiKlzh46s8aogALnfsZf9R_KxXqXBvpXvXAoNE/edit?usp=sharing">Presentation URL </a>

Best of luck using our findings!
