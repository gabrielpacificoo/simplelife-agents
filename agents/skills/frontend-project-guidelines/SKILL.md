---
name: frontend-project-guidelines
description: Padrões reais do front-end Simplelife para criar telas e componentes consistentes.
---

# Frontend Project Guidelines

Consulte esta skill antes de qualquer implementação visual no Simplelife.

## Fonte de verdade

- Design visual e tokens: [`../../docs/DESIGN_SYSTEM.md`](../../docs/DESIGN_SYSTEM.md)
- Componentes reutilizáveis: [`../../docs/COMPONENT_CATALOG.md`](../../docs/COMPONENT_CATALOG.md)
- Skills e limites de uso: [`../../docs/RECOMMENDED_SKILLS.md`](../../docs/RECOMMENDED_SKILLS.md)
- Instruções gerais: [`../../../AGENTS.md`](../../../AGENTS.md)

## Procedimento

1. Localize uma tela e um componente de referência.
2. Pesquise o catálogo e o código antes de criar algo.
3. Reutilize tokens `var(--*)`, primitivas de `src/components/ui` e serviços existentes.
4. Preserve temas, hash routes, textos em português e feature toggles.
5. Implemente estados de carregamento, erro, vazio, sucesso e interação.
6. Verifique acessibilidade e os breakpoints `1200`, `950`, `900`, `800`, `640` e `370px` quando relevantes.
7. Valide com build e testes direcionados; use inspeção visual quando disponível.

Não copie um design genérico da IA nem siga a skill `design-taste-frontend` quando ela entrar em conflito com os padrões documentados do projeto.
