# Set the target folder where posts are stored
$PostsFolder = "C:\Data\DevSpace\Br3akF1xRepeat-Site\_posts"

# Prompt the user for a blog title
$titleSlug = Read-Host "Enter post title using hyphens (Example: dont-forget-to-use-hyphens)"

# Get today's date
$date = Get-Date -Format "yyyy-MM-dd"

# Build the full filename
$fileName = "$date-$titleSlug.md"
$filePath = Join-Path -Path $PostsFolder -ChildPath $fileName

# Check if file already exists
if (Test-Path $filePath) {
    Write-Host "Error: A post with that name already exists." -ForegroundColor Red
    exit
}

# Create the file content with front matter
@"
---
title: "$( ($titleSlug -replace '-', ' ') -replace '^(\w)', { $_.Value.ToUpper() } )"
date: $date
categories: 
  - Journal
tags: 
  - Tag1
  - Tag2
layout: single
author_profile: true
read_time: true
excerpt: "A short one-sentence summary of the post for previews."
---

Start writing your blog post here!

- Summarize what you learned, built, or explored.
- Link to your Portfolio if related.
- Tag important technologies or topics.

---
"@ | Out-File -Encoding UTF8 -FilePath $filePath

# Confirm creation
Write-Host "✅ New post created: $fileName" -ForegroundColor Green

# === New Part: Open the newly created file in VSCode ===
code $filePath