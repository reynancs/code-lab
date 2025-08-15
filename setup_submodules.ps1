# Script to setup Git submodules and perform git operations
# Author: reynancs
# Description: This script automates the process of adding submodules and performing git operations

# Function to display colorful messages
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

# Display welcome message
Write-ColorOutput Green "Starting submodule setup process..."

# Remove existing directories if they exist
$directories = @(
    "API/webhooks_fastapi",
    "devops/docker-conversao-temperatura",
    "devops/kube-news",
    "frameworks/cookie_cutter",
    "genai/genai_intensive_course_gemini"
)

foreach ($dir in $directories) {
    if (Test-Path $dir) {
        Write-ColorOutput Yellow "Removing existing directory: $dir"
        Remove-Item -Recurse -Force $dir
    }
}

# Remove from Git index
Write-ColorOutput Yellow "Cleaning Git index..."
git rm -r --cached $directories 2>$null

# Array of submodules to add
$submodules = @(
    @{
        repo = "https://github.com/reynancs/webhooks_fastapi"
        path = "API/webhooks_fastapi"
    },
    @{
        repo = "https://github.com/reynancs/docker-conversao-temperatura"
        path = "devops/docker-conversao-temperatura"
    },
    @{
        repo = "https://github.com/reynancs/kube-news"
        path = "devops/kube-news"
    },
    @{
        repo = "https://github.com/reynancs/cookie_cutter_framework"
        path = "frameworks/cookie_cutter"
    },
    @{
        repo = "https://github.com/reynancs/genai_intensive_course_gemini"
        path = "genai/genai_intensive_course_gemini"
    }
)

# Add each submodule
foreach ($submodule in $submodules) {
    Write-ColorOutput Cyan "Adding submodule: $($submodule.path)"
    git submodule add $submodule.repo $submodule.path
}

# Git operations
Write-ColorOutput Green "Performing Git operations..."

# Add all changes
Write-ColorOutput Yellow "Adding changes to Git..."
git add .

# Commit changes
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "feat: Add submodules and update repository structure - $timestamp"
Write-ColorOutput Yellow "Committing changes..."
git commit -m $commitMessage

# Push changes
Write-ColorOutput Yellow "Pushing changes to remote repository..."
git push

Write-ColorOutput Green "Setup completed successfully!"

# Display submodule status
Write-ColorOutput Cyan "Current submodule status:"
git submodule status
