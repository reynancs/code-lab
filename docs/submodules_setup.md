# Submodules Setup Guide

This guide explains how to use the automated script for setting up Git submodules in the code-lab repository.

## Prerequisites

- PowerShell
- Git installed and configured
- Access to the required GitHub repositories

## Quick Start

1. Open PowerShell in the root directory of the code-lab repository
2. Run the setup script:
   ```powershell
   .\setup_submodules.ps1
   ```

## What the Script Does

The script automates the following tasks:

1. Removes existing directories (if any) to prepare for submodule setup
2. Cleans the Git index of any existing submodule entries
3. Adds the following submodules:
   - `webhooks_fastapi` → `API/webhooks_fastapi`
   - `docker-conversao-temperatura` → `devops/docker-conversao-temperatura`
   - `kube-news` → `devops/kube-news`
   - `cookie_cutter_framework` → `frameworks/cookie_cutter`
   - `genai_intensive_course_gemini` → `genai/genai_intensive_course_gemini`
4. Performs Git operations:
   - Adds all changes (`git add .`)
   - Creates a commit with timestamp
   - Pushes changes to the remote repository

## Manual Setup (Alternative)

If you prefer to set up submodules manually, you can use these commands:

```bash
# Remove existing directories and clean Git index
git rm -r --cached API/webhooks_fastapi devops/docker-conversao-temperatura devops/kube-news frameworks/cookie_cutter genai/genai_intensive_course_gemini

# Add submodules
git submodule add https://github.com/reynancs/webhooks_fastapi API/webhooks_fastapi
git submodule add https://github.com/reynancs/docker-conversao-temperatura devops/docker-conversao-temperatura
git submodule add https://github.com/reynancs/kube-news devops/kube-news
git submodule add https://github.com/reynancs/cookie_cutter_framework frameworks/cookie_cutter
git submodule add https://github.com/reynancs/genai_intensive_course_gemini genai/genai_intensive_course_gemini

# Git operations
git add .
git commit -m "feat: Add submodules and update repository structure"
git push
```

## Working with Submodules

After setting up submodules, here are some useful commands:

1. Clone repository with submodules:
   ```bash
   git clone --recursive [repository-url]
   ```

2. Initialize submodules in an existing clone:
   ```bash
   git submodule update --init --recursive
   ```

3. Update all submodules to their latest versions:
   ```bash
   git submodule update --remote
   ```

4. Check submodule status:
   ```bash
   git submodule status
   ```

## Troubleshooting

If you encounter any issues:

1. Make sure you have the necessary permissions for all repositories
2. Check if the directories are clean and not in use by any process
3. Verify your Git configuration is correct
4. If a submodule fails to add, try removing it from `.gitmodules` and `.git/config` before retrying

## Support

If you need help or encounter issues, please:
1. Check the error messages in the script output
2. Review the Git status and submodule status
3. Create an issue in the repository if the problem persists
