# Goal: to take an image of a handwritten single digit, and determine what that digit is.

# The data for this competition were taken from the MNIST dataset.
- Each image is 28 pixels in height and 28 pixels in width, for a total of 784 pixels in total.
- Each pixel has a single pixel-value associated with it, indicating the lightness or darkness of that pixel, with higher numbers meaning darker. 
- This pixel-value is an integer between 0 and 255, inclusive.
- The training data set, (train.csv), has 785 columns. The first column, called "label", is the digit that was drawn by the user.
- Each pixel column in the training set has a name like pixelx, where x is an integer between 0 and 783, inclusive. 
- To locate this pixel:  x = i * 28 + j, where i and j are integers between 0 and 27, inclusive. Then pixelx is located on row i and column j of a 28 x 28 matrix, (indexing by zero).

# Submition: For each of the 28000 images in the test set, output a single line with the digit you predict.