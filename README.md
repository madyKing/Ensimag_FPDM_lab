# Fundamentals of probabilistic data mining: </br> Lab work part 2 and part 3

# Contributors

* BOROVEC Ondrej (boroveco)
* LE Van Tuan (le1)
* NABE Mamady (nabem)
* YENDE Nadia (yenden)

## Independent mixture models


This is a preparatory work for topic 4: Hidden Markov models, which is related to gesture recognition.
The Unistroke alphabet, closely related to Graffiti1, is an essentially single-stroke shorthand handwriting
recognition system used in PDAs. The data set is composed of 50 x 6 time-trajectories representing the
drawing of letters A, E, H, L, O and Q in a plane.

Here you will focus on modelling letter A (actually drawn as a "Lambda"), you may ignore the other five letters
if you want. After some pre-processing, we obtain the data set "Amerge.txt", which is composed of every
stroke of every trial for the gestures associated with that letter (the temporal aspect of sequences and the
separations between sequences were lost here).

### Modelling

A priori (before reading the data), do you think a two-state Gaussian model could be appropriate? Why?

***

We think that a two-state Gaussian model should be sufficient because big letter lambda somsistr only of two lines.

### Data analysis: Gaussian model

1. Plot the data set. Estimate a bivariate Gaussian mixture model.

***



2. Label the data using the estimated model.
