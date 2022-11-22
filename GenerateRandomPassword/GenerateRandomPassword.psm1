<#
    Copyright (C) 2022  Robin Stolpe
    <https://stolpe.io>
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#>

function New-RSRandomPassword {
    <#
        .SYNOPSIS
        Generate and returns a random password that includes numbers, letters and special characters.

        .DESCRIPTION
        This module generates and returns a random password that contains lower and upper letters, numbers and special characters.
        It can either generate one with the default options that are 12 characters long and contains 3 special characters,
        or you can decide how long the password should be and how many special characters it should contain.
       
        .PARAMETER Length
        Specify how many characters you want your password to be.
        Default is 12, shortest length is 6 and max length is 30.

        .PARAMETER SpecialCharacters
        Specify how many special characters your password will has in it.
        Default is 3, shortest length is 1 and max length is 15.

        .EXAMPLE
        New-RSRandomPassword
        # Returns a random password that are 12 characters long and contains 1 special character.

        .EXAMPLE
        New-RSRandomPassword -Length 20 -SpecialCharacters 4
        # Returns a random password that are 20 characters long and contains 4 special character.

        .NOTES
        Author:     Robin Stolpe
        Mail:       robin@stolpe.io
        Website:	https://stolpe.io
        GitHub:		https://github.com/rstolpe
        Twitter:	https://twitter.com/rstolpes
        PSGallery:	https://www.powershellgallery.com/profiles/rstolpe
        NuGet: 		https://www.nuget.org/profiles/rstolpe
    #>

    [CmdletBinding()]
    param(
        [ValidateRange(6, 30)]
        [Parameter(Mandatory = $false)]
        [int]$Length = 12,
        [ValidateRange(1, 15)]
        [Parameter(Mandatory = $false)]
        [int]$SpecialCharacters = 3
    )

    $Character = 'abcdefghiklmnoprstuvwxyzABCDEFGHKLMNOPRSTUVWXYZ1234567890'
    $RandomCharacter = 1..$($Length - $SpecialCharacters) | ForEach-Object {
        Get-Random -Maximum $Character.length
    } 

    
    $SpecialCharacter = '!@#$%^&.,_*()=+*?-'
    $RandomSpecialC = 1..$SpecialCharacters | ForEach-Object {
        Get-Random -Maximum $SpecialCharacter.length
    }

    $private:ofs = "" 
    $inputString = [String]$Character[$RandomCharacter]
    $inputString += [String]$SpecialCharacter[$RandomSpecialC]

    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}