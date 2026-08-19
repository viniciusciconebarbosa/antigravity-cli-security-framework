#!/bin/sh
# ==============================================================================
# Antigravity & Copilot Security Toolkit - Universal Linux/POSIX Installer
# Compatible with Ubuntu, Debian, Arch, Fedora, Alpine, openSUSE, RHEL, Void, etc.
# ==============================================================================

set -e

# ANSI Colors (POSIX compliant printf)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GLOBAL_SKILLS_DIR="$HOME/.gemini/config/skills"

printf "${BLUE}=======================================================${NC}\n"
printf "${GREEN}   🛡️  Antigravity Security Toolkit Installer (Linux)${NC}\n"
printf "${BLUE}=======================================================${NC}\n\n"

install_global_skills() {
    printf "${YELLOW}[1/2] Instalando Skills Globais no Antigravity CLI...${NC}\n"
    mkdir -p "$GLOBAL_SKILLS_DIR"
    cp -r "$SCRIPT_DIR/skills/"* "$GLOBAL_SKILLS_DIR/"
    
    # Dar permissão de execução aos scripts utilitários se existirem
    find "$GLOBAL_SKILLS_DIR" -name "*.mjs" -exec chmod +x {} + 2>/dev/null || true
    
    printf "${GREEN}  ✔ 9 Skills globais instaladas em: %s${NC}\n" "$GLOBAL_SKILLS_DIR"
}

install_project_assets() {
    target_dir="${1:-.}"
    printf "${YELLOW}[2/2] Instalando Prompts, Agentes e Instruções no Projeto: %s...${NC}\n" "$target_dir"
    
    mkdir -p "$target_dir/.github/prompts"
    mkdir -p "$target_dir/.github/agents"
    
    cp -r "$SCRIPT_DIR/prompts/"* "$target_dir/.github/prompts/"
    cp -r "$SCRIPT_DIR/agents/"* "$target_dir/.github/agents/"
    if [ -f "$SCRIPT_DIR/instructions/copilot-instructions.md" ]; then
        cp "$SCRIPT_DIR/instructions/copilot-instructions.md" "$target_dir/.github/copilot-instructions.md"
    fi
    
    printf "${GREEN}  ✔ 14 Prompts instalados em: %s/.github/prompts${NC}\n" "$target_dir"
    printf "${GREEN}  ✔ Subagentes instalados em: %s/.github/agents${NC}\n" "$target_dir"
    printf "${GREEN}  ✔ Instruções de segurança instaladas em: %s/.github/copilot-instructions.md${NC}\n" "$target_dir"
}

case "$1" in
    --global-only|-g)
        install_global_skills
        ;;
    --project-only|-p)
        install_project_assets "${2:-.}"
        ;;
    --all|-a)
        install_global_skills
        install_project_assets "${2:-.}"
        ;;
    *)
        printf "Escolha o modo de instalação:\n"
        printf "1) Completa (Skills Globais no Antigravity + Prompts/Agentes no projeto atual)\n"
        printf "2) Apenas Skills Globais (~/.gemini/config/skills)\n"
        printf "3) Apenas Prompts e Agentes no Projeto atual (.github/)\n"
        printf "4) Sair\n"
        printf "Opção [1-4] (padrão 1): "
        read choice
        choice="${choice:-1}"
        
        case "$choice" in
            1)
                install_global_skills
                install_project_assets "."
                ;;
            2)
                install_global_skills
                ;;
            3)
                install_project_assets "."
                ;;
            4)
                printf "Instalação cancelada.\n"
                exit 0
                ;;
            *)
                printf "${RED}Opção inválida.${NC}\n"
                exit 1
                ;;
        esac
        ;;
esac

printf "\n${GREEN}🎉 Instalação concluída com sucesso!${NC}\n"
