<#

.SYNOPSIS
Find the total score according to your strategy guide.

.DESCRIPTION
Find the total score according to your strategy guide.

.NOTES
Advent Of Code 2022 - Day 2 Rock Paper Scissors

#>

# First Column - opponent
# Second Column - what I should play in response.

# Winner of tournament - player with highest score



<#---------- VARIABLES ----------#>
$Total_Score = 0
$Rounds       = Get-Content "$PSScriptRoot\input.txt"
$Rounds       = Get-Content "C:\Users\kingandrew.REDMOND\Documents\GitHub\AdventOfCode_2022\Day2\input.txt"
$PartTwo      = $true

<# Scoring Legend

    Rock      =  1 point
    Paper     =  2 points
    Scissors  =  3 points
    Win       =  6 points
    Draw      =  3 points
    Loss      =  0 points
#>


#region PART 1
    <#
        A - ROCK
        B - PAPER
        C - SCISSORS

        X - ROCK
        Y - PAPER
        Z - SCISSCORS


    #>
#endregion

#region PART 2 Legend
    <#
        A - ROCK
        B - PAPER
        C - SCISSORS

        X - Lose
        Y - DRAW
        Z - WIN

    #>
#endregion


#$Rounds        = $Rounds | Select-Object -first 20
$MyScore        = 0
$OpponentScore  = 0

ForEach ($Round in $Rounds) {

    $OpponentChoice = $Round[0]
    $MyChoice       = $Round[2]

    Switch ($OpponentChoice) {

        # Rock
        "A" {
            $OpponentScore += 1

            Switch ($MyChoice) {

                #Rock
                "X" {
                    
                    IF ($PartTwo -eq $true) {

                    }

                    ELSE {

                    }

                    $MyScore += 1

                    <# Tie #>
                    #Write-Host "Opponent chose Rock. You chose Rock. Result: TIE"
                    $MyScore += 3
                    $OpponentScore += 3
                }

                #Paper
                "Y" {
                    $MyScore += 2

                    <# I win #>
                    #Write-Host "Opponent chose Rock. You chose Paper. Result: YOU WIN!"
                    $MyScore += 6
                }

                #Scissors
                "Z" {
                    $MyScore += 3

                    <# Opponent wins #>
                    #Write-Host "Opponent chose Rock. You chose Scissors. Result: OPPONENT WINS!"
                    $OpponentScore += 6
                }

            }
        }

        # Paper
        "B" {
            $OpponentScore += 2

            Switch ($MyChoice) {

                #Rock
                "X" {
                    $MyScore += 1

                    <# Opponent wins #>
                    #Write-Host "Opponent chose Paper. You chose Rock. Result: OPPONENT WINS!"
                    $OpponentScore += 6
                }

                #Paper
                "Y" {
                    $MyScore += 2

                    <# Tie #>
                    #Write-Host "Opponent chose Paper. You chose Paper. Result: TIE!"
                    $MyScore += 3
                    $OpponentScore += 3
                }

                #Scissors
                "Z" {
                    $MyScore += 3

                    <# I win #>
                    #Write-Host "Opponent chose Paper. You chose Scissors. Result: YOU WIN!"
                    $MyScore += 6
                }

            }
        }

        #Scissors
        "C" {
            $OpponentScore += 3

            Switch ($MyChoice) {

                #Rock
                "X" {
                    $MyScore += 1

                    <# I win #>
                    #Write-Host "Opponent chose Scissors. You chose Rock. Result: YOU WIN!"
                    $MyScore += 6
                }

                #Paper
                "Y" {
                    $MyScore += 2

                    <# Opponent wins #>
                    #Write-Host "Opponent chose Scissors. You chose Paper. Result: OPPONENT WINS!"
                    $OpponentScore += 6
                }

                #Scissors
                "Z" {
                    $MyScore += 3

                    <# Tie #>
                    #Write-Host "Opponent chose Scissors. You chose Scissors. Result: TIE!"
                    $MyScore += 3
                    $OpponentScore += 3
                }
            }
        }
    }
}


#Write-Host "Opponent Score: $OpponentScore"
Write-Host "Your total score for part 1 is: $MyScore"
