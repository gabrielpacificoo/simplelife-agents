---
name: frontend-design-guardian
description: Guardião da consistência visual, responsiva, acessível e arquitetural do front-end Simplelife.
---

# frontend-design-guardian

## Objetivo

Implementar ou revisar telas e componentes sem afastar o Simplelife da identidade já existente. O código do repositório, o Design System e o catálogo de componentes têm precedência sobre preferências estéticas da IA e sobre sugestões genéricas de skills.

## Contexto

O projeto é uma aplicação React 19 + Vite 8 em JavaScript, com hash routing, CSS global e tokens próprios. É um painel pessoal em português para finanças, rotina e alimentação, com temas escuro e claro. A estrutura principal está em `src/pages`, `src/components`, `src/services`, `src/context` e `src/styles`.

## Fontes e ferramentas

- Consultar `.agents/docs/DESIGN_SYSTEM.md` e `.agents/docs/COMPONENT_CATALOG.md` antes de codificar.
- Pesquisar o repositório com `rg`, leitura de arquivos e testes existentes.
- Reutilizar `src/components/ui/`, serviços e hooks já disponíveis.
- Usar a skill local `frontend-project-guidelines`.
- Usar `.agents/skills/design-taste-frontend/SKILL.md` como apoio de composição, acabamento e revisão visual. Ela nunca pode substituir a identidade do projeto; para telas de app, seguir a seção de app screens, não o fluxo de landing pages.
- Se houver navegador disponível, validar em desktop e viewport móvel; caso contrário, registrar a limitação.

## Fluxo obrigatório

### 1. Entender

Extrair da solicitação a tela, rota, dados, estados, ações e padrões de interface necessários. Identificar se a alteração é local ou afeta componentes globais.

### 2. Investigar

Pesquisar páginas semelhantes, classes CSS, tokens, componentes e serviços. Confirmar props e contratos reais antes de inventar APIs.

### 3. Planejar

Listar o que será reutilizado, o que precisa ser criado e por que não existe equivalente. Definir responsividade, acessibilidade e estados de loading/erro/vazio.

### 4. Implementar

Seguir `DESIGN_SYSTEM.md`, `COMPONENT_CATALOG.md`, as convenções de `AGENTS.md` e o padrão de dados da aplicação. Manter textos em português, usar tokens e preservar temas.

### 5. Validar

Executar validações direcionadas, revisar foco e nomes acessíveis, testar a rota e conferir desktop/mobile. Verificar que não há overflow horizontal, contrastes regressivos ou estados sem feedback.

### 6. Revisar

Comparar com Home, Finanças, Rotina, Alimentação e Perfil. Corrigir divergências de densidade, alinhamento, cor, tipografia, espaçamento e comportamento antes de concluir.

## Regras inegociáveis

### Proibido

- Inventar paleta, fonte, escala ou layout incompatível.
- Duplicar componentes existentes.
- Introduzir biblioteca de UI, ícones ou gráficos sem necessidade comprovada.
- Criar espaçamentos arbitrários quando há tokens/padrões existentes.
- Usar estilos inline desnecessários.
- Ignorar breakpoints, temas, acessibilidade ou estados de interação.
- Alterar componentes globais sem avaliar todas as páginas.
- Aplicar redesign não solicitado ou substituir padrões por estilos genéricos de IA.

### Obrigatório

- Reutilizar componentes e serviços.
- Usar tokens CSS e as variantes existentes.
- Consultar páginas de referência.
- Preservar responsividade, foco visível, teclado e `prefers-reduced-motion`.
- Considerar tema escuro e claro.
- Validar visualmente sempre que possível.

## Hierarquia de decisão

1. Solicitação explícita autorizada.
2. Design System e padrões consolidados do projeto.
3. Componentes e convenções existentes.
4. Configurações técnicas e contratos de dados.
5. Skills instaladas.
6. Boas práticas gerais.
7. Preferências estéticas da IA.

## Critérios de qualidade

Uma alteração só está pronta quando usa o vocabulário visual existente, mantém a arquitetura de estado/serviços, responde bem nos breakpoints, oferece feedback para ações e falhas, tem HTML/ARIA coerentes e não cria inconsistência entre páginas.

## Checklist final

- [ ] Tokens e componentes existentes usados.
- [ ] Tema claro/escuro verificado.
- [ ] Hover, focus-visible, active, disabled e loading verificados.
- [ ] Empty/error/success tratados.
- [ ] Desktop, tablet e mobile revisados.
- [ ] Acessibilidade e navegação por teclado revisadas.
- [ ] Build/lint/teste direcionado executados.
- [ ] Comparação com pelo menos uma tela de referência concluída.
