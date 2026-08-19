#!/usr/bin/env python3
"""
Antigravity & Copilot Security Toolkit - Universal Cross-Platform Installer
Works on Windows, Linux, and macOS without external dependencies.
"""

import sys
import shutil
from pathlib import Path

def get_base_dir():
    return Path(__file__).resolve().parent

def get_global_skills_dir():
    home = Path.home()
    return home / ".gemini" / "config" / "skills"

def install_global_skills():
    base_dir = get_base_dir()
    global_dir = get_global_skills_dir()
    src_skills = base_dir / "skills"
    
    print("\n[1/2] Instalando Skills Globais em:", global_dir)
    global_dir.mkdir(parents=True, exist_ok=True)
    
    count = 0
    for item in src_skills.iterdir():
        dest = global_dir / item.name
        if item.is_dir():
            if dest.exists():
                shutil.rmtree(dest)
            shutil.copytree(item, dest)
            count += 1
        elif item.is_file():
            shutil.copy2(item, dest)
            
    print(f"  ✔ {count} Skills globais instaladas com sucesso!")

def install_project_assets(project_path="."):
    base_dir = get_base_dir()
    target = Path(project_path).resolve()
    
    prompts_dest = target / ".github" / "prompts"
    agents_dest = target / ".github" / "agents"
    instructions_dest = target / ".github" / "copilot-instructions.md"
    
    print(f"\n[2/2] Instalando Prompts, Agentes e Instruções em: {target}...")
    prompts_dest.mkdir(parents=True, exist_ok=True)
    agents_dest.mkdir(parents=True, exist_ok=True)
    
    # Prompts
    src_prompts = base_dir / "prompts"
    for item in src_prompts.iterdir():
        shutil.copy2(item, prompts_dest / item.name)
    print(f"  ✔ 14 Prompts instalados em: {prompts_dest}")
    
    # Agents
    src_agents = base_dir / "agents"
    for item in src_agents.iterdir():
        shutil.copy2(item, agents_dest / item.name)
    print(f"  ✔ Subagentes instalados em: {agents_dest}")
    
    # Instructions
    src_instructions = base_dir / "instructions" / "copilot-instructions.md"
    if src_instructions.exists():
        shutil.copy2(src_instructions, instructions_dest)
        print(f"  ✔ Instruções de segurança instaladas em: {instructions_dest}")

def main():
    print("=" * 55)
    print("   🛡️  Antigravity Security Toolkit Universal Installer")
    print("=" * 55)
    
    if len(sys.argv) > 1:
        arg = sys.argv[1].lower()
        if arg in ("--global", "-g"):
            install_global_skills()
            return
        elif arg in ("--project", "-p"):
            path = sys.argv[2] if len(sys.argv) > 2 else "."
            install_project_assets(path)
            return
        elif arg in ("--all", "-a"):
            path = sys.argv[2] if len(sys.argv) > 2 else "."
            install_global_skills()
            install_project_assets(path)
            return
            
    print("\nEscolha o modo de instalação:")
    print("1) Completa (Skills Globais + Prompts/Agentes no projeto atual)")
    print("2) Apenas Skills Globais (~/.gemini/config/skills)")
    print("3) Apenas Prompts e Agentes no Projeto atual (.github/)")
    print("4) Sair")
    
    choice = input("Opção [1-4] (padrão 1): ").strip() or "1"
    
    if choice == "1":
        install_global_skills()
        install_project_assets(".")
    elif choice == "2":
        install_global_skills()
    elif choice == "3":
        install_project_assets(".")
    elif choice == "4":
        print("Instalação cancelada.")
        return
    else:
        print("Opção inválida.")
        sys.exit(1)
        
    print("\n🎉 Instalação concluída com sucesso!")

if __name__ == "__main__":
    main()
