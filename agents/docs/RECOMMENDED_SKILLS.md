# Skills recomendadas

## Obrigatória

### `design-taste-frontend`

- **Fonte oficial:** https://github.com/leonxlnx/taste-skill
- **Instalação verificada:** `npx skills add -y https://github.com/leonxlnx/taste-skill --skill design-taste-frontend`
- **Instalada:** sim, em `.agents/skills/design-taste-frontend/`.
- **Quando usar:** revisão de composição, acabamento, responsividade e inspeção visual de páginas e telas de app.
- **Benefício:** fornece inventário, direção, inspeção em navegador, screenshots e ciclo de crítica.
- **Limite:** é apoio visual, não autoridade de identidade. Para este app, ler `references/app-screens.md` e manter os tokens e padrões de `DESIGN_SYSTEM.md`. Gradientes, icon tiles, labels e outros elementos existentes não devem ser removidos apenas porque a skill os desaconselha.

## Recomendada

### `frontend-project-guidelines`

- **Fonte:** skill local criada neste repositório em `.agents/skills/frontend-project-guidelines/SKILL.md`.
- **Instalação:** já disponível no projeto; não requer comando externo.
- **Quando usar:** toda implementação ou revisão visual.
- **Benefício:** aponta para o Design System, catálogo, arquitetura, breakpoints e checklist sem duplicar a documentação extensa.

## Opcionais

Não foram identificadas outras skills oficiais necessárias a partir da stack atual. O projeto usa React/Vite/CSS próprio e não possui biblioteca de UI, Tailwind, Storybook ou framework que justifique uma skill adicional.

## Política de uso

Skills podem sugerir direções, mas a hierarquia é: solicitação autorizada → Design System real → componentes/convenções → configuração técnica → skills → boas práticas gerais. Não instale skills adicionais indiscriminadamente.

## Limitações

A skill externa foi instalada com sucesso. Seu código auxiliar não faz parte do app e foi excluído da varredura do ESLint via `eslint.config.js`; isso evita que scripts da própria skill gerem falhas no lint do produto.
