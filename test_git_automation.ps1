# Test Script for Git Automation
# This script validates the functionality of git_automation.ps1
# Author: Claude
# Version: 1.0

# Function to run a test case and report result
function Test-Case {
    param(
        [string]$TestName,
        [scriptblock]$Test
    )
    
    Write-Host "`nRunning test: $TestName" -ForegroundColor Cyan
    try {
        & $Test
        Write-Host "✓ Test passed: $TestName" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "✗ Test failed: $TestName" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
        return $false
    }
}

# Initialize test results
$TestsPassed = 0
$TotalTests = 0

# Test 1: Script exists
$TotalTests++
Test-Case -TestName "Script File Exists" {
    if (-not (Test-Path "git_automation.ps1")) {
        throw "git_automation.ps1 not found in current directory"
    }
}

# Test 2: Git is installed
$TotalTests++
Test-Case -TestName "Git Installation" {
    try {
        git --version | Out-Null
    }
    catch {
        throw "Git is not installed"
    }
}

# Test 3: Current directory is a git repository
$TotalTests++
Test-Case -TestName "Git Repository Check" {
    if (-not (Test-Path .git)) {
        throw "Current directory is not a Git repository"
    }
}

# Test 4: Remote repository is configured
$TotalTests++
Test-Case -TestName "Remote Repository Configuration" {
    $remote = git remote -v
    if (-not $remote) {
        throw "No remote repository configured"
    }
}

# Test 5: Script runs with default parameters
$TotalTests++
Test-Case -TestName "Default Script Execution" {
    # Create a test file
    "test content" | Out-File "test.txt"
    
    # Run the automation script
    .\git_automation.ps1
    
    # Clean up
    Remove-Item "test.txt" -Force
}

# Test 6: Script runs with custom commit message
$TotalTests++
Test-Case -TestName "Custom Commit Message" {
    # Create a test file
    "test content" | Out-File "test.txt"
    
    # Run the automation script with custom message
    .\git_automation.ps1 -CommitMessage "Test commit"
    
    # Clean up
    Remove-Item "test.txt" -Force
}

# Display test summary
Write-Host "`n=== Test Summary ===" -ForegroundColor Yellow
Write-Host "Total Tests: $TotalTests" -ForegroundColor Cyan
Write-Host "Tests Passed: $TestsPassed" -ForegroundColor Green
Write-Host "Tests Failed: $($TotalTests - $TestsPassed)" -ForegroundColor Red

if ($TestsPassed -eq $TotalTests) {
    Write-Host "`n✓ All tests passed!" -ForegroundColor Green
    exit 0
}
else {
    Write-Host "`n✗ Some tests failed!" -ForegroundColor Red
    exit 1
}
