<#

.SYNOPSIS
Find the elf carrying the most calories

.DESCRIPTION
Given a list of carlories each elf is carrying, find the elf carrying the most calories. How many calories is that elf carrying?

.NOTES
Advent Of Code 2022 - Day 1 Calorie Counting

#>

<#---------- VARIABLES ----------#>
$Calories             = Get-Content "$PSScriptRoot\input.txt"
$TotalCalories_Elf    = 0
$AllElfsCalorieCount  = @()
$ElfNumber            = 1


<#---------- Isolating each Elf's total calories ----------#>
ForEach ($item in $Calories) {

    # Calories found on line. Adding to calorie count for current elf
    IF ( "" -ne $item ) {
        $TotalCalories_Elf = $TotalCalories_Elf + $item
    }

    # No more calories found (blank line). Summarize the total count of calories for current elf and add to $AllElfsCalorieCount
    ELSE {

        $ElfCalorieCount = [PSCustomObject]@{
            Elf           = $ElfNumber
            TotalCalories = $TotalCalories_Elf
        }

        $AllElfsCalorieCount = $AllElfsCalorieCount + $ElfCalorieCount

        # Resetting next elf's total calorie count
        $TotalCalories_Elf = 0

        # Increase elf count to the next elf
        $ElfNumber++
    }

}

$Answer_Calories  = ($AllElfsCalorieCount | Measure-Object -Property TotalCalories -Maximum).Maximum
$Answer_Elf       = ($AllElfsCalorieCount | Where-Object {$_.TotalCalories -eq $Answer_Calories}).Elf

Write-Host "The elf carrying the most calories is elf number $Answer_Elf carrying $Answer_Calories calories"