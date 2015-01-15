Neville's algorithm for calculating coefficients of interpolating polynomial
==============

## WARNING
In order to work it requires you to have `texlive-latex-base` and `dvipng` installed. (`sudo apt-get install <packagename>`)


### Installation
Run
`$ bundle install`

To launch the server run `$ rackup` in main directory of the application (neville-coeffs).

Launch your web browser and head to `0.0.0.0:9292` (or check terminal if the port isn't different).

### Usage
#### Input
Number of points (positive integer)  
Sequence of Xs (integers separated by space)  
Sequence of Ys (integers separated by space)  
Click Submit  

#### Output
Interpolating polynomial in LaTeX

### Adnotations considering RSpec
For all tests to pass (especially Selenium one) Sinatra server must be running on your machine.

