<#

.SYNOPSIS
In how many assignment pairs does one range fully contain the other?

.DESCRIPTION
Given a list of ranges, find how many ranges are fully contained in the paired range.

.INPUTS
List of section assignments for each pair of elves

.NOTES
Advent Of Code 2022 - Day 2 Camp Cleanup

#>

<#---------- VARIABLES ----------#>
#$PairedRanges = Get-Content "$PSScriptRoot\input.txt"
$PairedRanges          = Get-Content "C:\Users\kingandrew\Documents\GitHub\AdventOfCode\2022\Day4\Input.txt"
$RangesFullyContained  = 0


ForEach ( $PairedRange in $PairedRanges) {
    Write-Host "Starting check for new pair..." -ForegroundColor Cyan
    Write-Host ""

    $FirstRange   = (($PairedRange -split ",")[0] -split "-")[0]..(($PairedRange -split ",")[0] -split "-")[1]
    $SecondRange  = (($PairedRange -split ",")[1] -split "-")[0]..(($PairedRange -split ",")[1] -split "-")[1]
    $RangeFound   = $true
    $i                     = 0

    IF ( $FirstRange.count -lt $SecondRange.count ) {
        $SmallerRange = $FirstRange
        $LargerRange  = $SecondRange
    }
    
    ELSE {
        $SmallerRange = $SecondRange
        $LargerRange  = $FirstRange
    }

    do {

        IF ( $($SmallerRange[$i]) -in $LargerRange ) {
            Write-Host "$($SmallerRange[$i]) is in $( $LargerRange | Select-Object -First 1 )-$( $LargerRange | Select-Object -Last 1 )"
            $RangeFound = $true
        }

        ELSE {
            Write-Host "$($SmallerRange[$i]) is NOT largerRange. Exiting check..."
            $RangeFound = $false
        }

        $i++

    } while ( ($i -lt $SmallerRange.count ) -and  ($RangeFound -eq $true ) )

    IF ( $RangeFound -eq $true ) {
        $RangesFullyContained++
    }

}


Write-Host "Found $RangesFullyContained ranges fully contained in a pair."