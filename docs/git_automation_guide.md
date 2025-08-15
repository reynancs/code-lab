# Git Automation Script Guide

This guide explains how to use the PowerShell script for automating Git operations in your project.

## Prerequisites

- Git must be installed on your system
- PowerShell 5.1 or higher
- Git repository initialized and configured with remote GitHub repository

## Script Location

Place the `git_automation.ps1` script in your project's root directory.

## Usage

### Basic Usage

From your PowerShell terminal, navigate to your project directory and run:

```powershell
.\git_automation.ps1
```

This will:
1. Add all changes (git add .)
2. Commit with default message "Update files and folders"
3. Push to the 'main' branch

### Advanced Usage

The script supports several parameters:

1. Custom commit message:
```powershell
.\git_automation.ps1 -CommitMessage "Your custom commit message"
```

2. Different branch:
```powershell
.\git_automation.ps1 -Branch "development"
```

3. Show Git status before operations:
```powershell
.\git_automation.ps1 -ShowStatus
```

4. Combine parameters:
```powershell
.\git_automation.ps1 -CommitMessage "Update ML models" -Branch "feature/ml" -ShowStatus
```

## Error Handling

The script includes error handling for common scenarios:
- Checks if Git is installed
- Verifies if the current directory is a Git repository
- Displays clear error messages if something goes wrong

## Examples

1. Quick update to main branch:
```powershell
.\git_automation.ps1
```

2. Detailed update with custom message:
```powershell
.\git_automation.ps1 -CommitMessage "Add new machine learning models" -ShowStatus
```

3. Push to development branch:
```powershell
.\git_automation.ps1 -Branch "development" -CommitMessage "WIP: Training new models"
```

## Troubleshooting

If you encounter issues:

1. Ensure Git is installed:
```powershell
git --version
```

2. Verify you're in a Git repository:
```powershell
git status
```

3. Check if your remote repository is configured:
```powershell
git remote -v
```

## Support

For issues or questions, please create an issue in the repository.
