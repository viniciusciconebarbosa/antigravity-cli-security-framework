---
name: dast-probe
description: "Executa análise dinâmica de segurança em tempo de execução (DAST) usando @aegiskit/cli probe e auditorias de segurança com DevTools e npm audit."
---

# Dynamic Application Security Testing (DAST) Probe & Security Audit

## Purpose
Executar varredura dinâmica de vulnerabilidades em tempo de execução (DAST), auditoria de dependências e inspeção com DevTools em aplicações web em execução (por exemplo, \`http://localhost:3000\`).

## Comandos Padrão de Execução
- **DAST em Tempo de Execução:**
  \`\`\`bash
  npx --yes @aegiskit/cli probe http://localhost:3000
  \`\`\`
- **Auditoria de Dependências (SAST/SCA):**
  \`\`\`bash
  npm audit
  \`\`\`
- **Checagem Combinada:**
  \`\`\`bash
  npm audit && npx --yes @aegiskit/cli probe http://localhost:3000
  \`\`\`

## Integração com Chrome DevTools MCP
Ao realizar testes dinâmicos:
1. **Navegação e Rotas:** Inspecionar páginas ao vivo (\`/login\`, \`/dashboard\`, \`/compartilhado/...\`).
2. **Console e Network:** Verificar violações de CSP, logs client-side de dados sensíveis e integridade de cookies (\`HttpOnly\`, \`SameSite\`, \`Secure\`).
3. **Auditorias Automatizadas:** Executar \`lighthouse_audit\` e avaliação de headers HTTP.
