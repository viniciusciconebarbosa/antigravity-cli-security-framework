# ==============================================================================
# Antigravity & Copilot Security Toolkit - Windows PowerShell Installer
# ==============================================================================

param (
    [string]$Mode = "",
    [string]$ProjectPath = "."
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$GlobalSkillsDir = Join-Path $env:USERPROFILE ".gemini\config\skills"

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "   🛡️  Antigravity Security Toolkit Installer (Windows)" -ForegroundColor Green
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

function Install-GlobalSkills {
    Write-Host "[1/2] Instalando Skills Globais no Antigravity CLI..." -ForegroundColor Yellow
    if (!(Test-Path $GlobalSkillsDir)) {
        New-Item -ItemType Directory -Force -Path $GlobalSkillsDir | Out-Null
    }
    
    Copy-Item -Path (Join-Path $ScriptDir "skills\*") -Destination $GlobalSkillsDir -Recurse -Force
    Write-Host "  ✔ 9 Skills globais instaladas em: $GlobalSkillsDir" -ForegroundColor Green
}

function Install-ProjectAssets([string]$target) {
    Write-Host "[2/2] Instalando Prompts, Agentes e Instrucoes no Projeto: $target..." -ForegroundColor Yellow
    $promptsDir = Join-Path $target ".github\prompts"
    $agentsDir = Join-Path $target ".github\agents"
    
    New-Item -ItemType Directory -Force -Path $promptsDir | Out-Null
    New-Item -ItemType Directory -Force -Path $agentsDir | Out-Null
    
    Copy-Item -Path (Join-Path $ScriptDir "prompts\*") -Destination $promptsDir -Recurse -Force
    Copy-Item -Path (Join-Path $ScriptDir "agents\*") -Destination $agentsDir -Recurse -Force
    
    $instructionsSrc = Join-Path $ScriptDir "instructions\copilot-instructions.md"
    if (Test-Path $instructionsSrc) {
        Copy-Item -Path $instructionsSrc -Destination (Join-Path $target ".github\copilot-instructions.md") -Force
    }
    
    Write-Host "  ✔ 14 Prompts instalados em: $promptsDir" -ForegroundColor Green
    Write-Host "  ✔ Subagentes instalados em: $agentsDir" -ForegroundColor Green
    Write-Host "  ✔ Instrucoes de seguranca instaladas em: $target\.github\copilot-instructions.md" -ForegroundColor Green
}

if ($Mode -eq "global") {
    Install-GlobalSkills
} elseif ($Mode -eq "project") {
    Install-ProjectAssets -target $ProjectPath
} elseif ($Mode -eq "all") {
    Install-GlobalSkills
    Install-ProjectAssets -target $ProjectPath
} else {
    Write-Host "Escolha o modo de instalacao:"
    Write-Host "1) Completa (Skills Globais no Antigravity + Prompts/Agentes no projeto atual)"
    Write-Host "2) Apenas Skills Globais (%USERPROFILE%\.gemini\config\skills)"
    Write-Host "3) Apenas Prompts e Agentes no Projeto atual (.github\)"
    Write-Host "4) Sair"
    
    $choice = Read-Host "Opcao [1-4] (padrao 1)"
    if ([string]::IsNullOrWhiteSpace($choice)) { $choice = "1" }
    
    switch ($choice) {
        "1" {
            Install-GlobalSkills
            Install-ProjectAssets -target "."
        }
        "2" {
            Install-GlobalSkills
        }
        "3" {
            Install-ProjectAssets -target "."
        }
        "4" {
            Write-Host "Instalacao cancelada." -ForegroundColor Gray
            exit 0
        }
        default {
            Write-Host "Opcao invalida." -ForegroundColor Red
            exit 1
        }
    }
}

Write-Host ""
Write-Host "🎉 Instalacao concluida com sucesso!" -ForegroundColor Green
