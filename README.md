Neville's algorithm for calculating coefficients of interpolating polynomial
==============

### Installation
Clone the repository using `$ git clone https://github.com/pwyszynski/neville-coeffs.git` and head to this folder. 

Run
`$ bundle install`

To launch the server run `$ rackup` in main directory of the application (neville-coeffs).

Launch your web browser and head to `0.0.0.0:9292` (or check terminal if the port isn't different).

If you do not want to clone the repository you can just see the [app deployed on Heroku](http://neville-coeffs.herokuapp.com).

### Usage
#### Input
Enter number of points (positive integer)  
Enter sequence of Xs (integers separated by space)  
Enter sequence of Ys (integers separated by space)  
Click Submit  

#### Output
Interpolating polynomial in MathJax

### Adnotations considering RSpec
For all tests to pass (especially Selenium one) Sinatra server must be running on your machine.

