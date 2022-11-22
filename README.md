# GenerateRandomPassword
## SYNOPSIS
This module let you generate a random password where you can choose length and how many special characters you want it to include.

## DESCRIPTION
This module generates and returns a random password that contains lower and upper letters, numbers and special characters.  
It can either generate one with the default options that are 12 characters long and contains 3 special characters,  
or you can decide how long the password should be and how many special characters it should contain.  


## Install
Install for current user
````
Install-Module -Name GenerateRandomPassword -Scope CurrentUser -Force
````

Install for all users
````
Install-Module -Name GenerateRandomPassword -Scope AllUsers -Force
````

## Example
````
New-RSRandomPassword
````
Returns a random password that are 12 characters long and contains 1 special character.
````
New-RSRandomPassword -Length 20 -SpecialCharacters 4
````
Returns a random password that are 20 characters long and contains 4 special character.