
# FizzBuzz app

An iOS consists in writing all numbers from 1 to 100, and just
replacing:  
all multiples of 3 by "fizz",  
all multiples of 5 by "buzz",  
and all multiples of 15 by "fizzbuzz".  

The output would look like this:  
"1, 2, fizz, 4, buzz, fizz, 7, 8, fizz, buzz, 11, fizz, 13, 14, fizzbuzz, 16, ...".


## Author

- [@TurkiWalid](https://github.com/TurkiWalid)



## Tech architecture

This app is using MVVM C as architecture which is MVVM plus a coordinator that facilitates navigation from A to B and decouple ViewControllers.



## Files tree

- Main App folder containing the main Protocols and Enumeration
- For each scene it must have it's own components heriting from main protocols to keep app logic



## Code coverage

Unit testing are covering 53,7% of the whole app covering the main feature logic



## TODO..

- Adding more representatif errors
- Adding UI Testing
- Supporting Dark Theme
    
## Badges
This application is free to use and fork

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
