Summary
-------

This Shiny Web application determines the automobile models with the
most efficient gas milege based on the user's input. The underlying data
is from the **mtcars** dataset. Users can change the input values, and
the application interactively performs the query and provides the
results.

This web application is the end of course project of Data Products
session, a part of Data Science program offered by Coursera.com.

Application URL: <https://mdrobish.shinyapps.io/carsMPG/>.
----------------------------------------------------------

How to Use the Application
--------------------------

The application opens with the results using all data. This is the
default. You can narrow your selection based on the following input
criteria:

    1. Select Transmission Type:  Manual, Automatic or Both
    2. Select Engine Type:  V-engine, Straight or Both
    3. Minimum Number of Cylinders
    4. Minimum Forward Gears

### Output

The application returns two forms of output:

    1.  Summary - Displays the best MPG and automobile models based on the interactive input
    2.  List - Lists all automobiles meet the input criteria
