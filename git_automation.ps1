# Git Automation Script
# This script automates the process of adding, committing, and pushing changes to GitHub
# Author: Claude
# Version: 1.0

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Update files and folders",
    
    [Parameter(Mandatory=$false)]
    [string]$Branch = "main",
    
    [Parameter(Mandatory=$false)]
    [switch]$ShowStatus = $false
)

# Function to check if git is installed
function Test-GitInstalled {
    try {
        git --version | Out-Null
        return $true
    }
    catch {
        Write-Host "Git is not installed. Please install Git first." -ForegroundColor Red
        return $false
    }
}

# Function to check if current directory is a git repository
function Test-GitRepository {
    if (-not (Test-Path .git)) {
        Write-Host "Current directory is not a Git repository." -ForegroundColor Red
        return $false
    }
    return $true
}

# Function to show git status
function Show-GitStatus {
    Write-Host "`nCurrent Git Status:" -ForegroundColor Cyan
    git status
}

# Main execution block
try {
    # Check if git is installed
    if (-not (Test-GitInstalled)) {
        exit 1
    }

    # Check if current directory is a git repository
    if (-not (Test-GitRepository)) {
        exit 1
    }

    # Show status if requested
    if ($ShowStatus) {
        Show-GitStatus
    }

    # Stage all changes
    Write-Host "`nStaging all changes..." -ForegroundColor Yellow
    git add .
    
    # Commit changes
    Write-Host "Committing changes with message: $CommitMessage" -ForegroundColor Yellow
    git commit -m $CommitMessage
    
    # Push changes to remote repository
    Write-Host "Pushing changes to remote repository on branch: $Branch" -ForegroundColor Yellow
    git push origin $Branch
    
    Write-Host "`nChanges successfully pushed to GitHub!" -ForegroundColor Green
}
catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    exit 1
}
