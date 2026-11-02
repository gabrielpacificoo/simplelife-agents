# Design System do Simplelife

## Fonte e escopo

Este documento descreve o padrão implementado, não um redesign. As evidências principais são `src/index.css:8-77`, `src/styles/layout.css:1-390`, `src/styles/components.css:1-120`, `src/styles/pages.css:1-1920`, `src/components/layout/AppLayout.jsx:1-120` e as páginas em `src/pages/`.

## Identidade visual

Simplelife é um painel pessoal calmo, escuro por padrão, com linguagem de “menos ruído, mais vida”. A composição usa superfícies discretas, bordas finas, labels pequenos em caixa alta, acentos pastel dessaturados e detalhes orbitais no início. O conteúdo é denso, mas organizado em cards, seções e tabs.

Não há fonte externa carregada no código: a pilha é `Inter`, com fallback de sistema (`src/index.css:9-14`). Ícones são SVG inline próprios, com stroke 1.65, em `src/components/ui/Icon.jsx:1-51`.

## Tokens de cor

### Tema escuro (padrão)

| Token              | Valor     | Uso                                         |
| ------------------ | --------- | ------------------------------------------- |
| `--bg`             | `#08090b` | Fundo principal                             |
| `--surface`        | `#111317` | Cards e superfícies                         |
| `--surface-raised` | `#181b20` | Controles elevados e hover                  |
| `--surface-hover`  | `#1b1e23` | Hover de controles                          |
| `--sidebar`        | `#0d0f12` | Navegação lateral                           |
| `--text`           | `#f0f1f0` | Texto principal                             |
| `--muted`          | `#94999f` | Texto secundário                            |
| `--faint`          | `#737981` | Captions e metadados                        |
| `--border`         | `#24282d` | Bordas principais                           |
| `--subtle-border`  | `#202328` | Divisórias sutis                            |
| `--green`          | `#b0cda4` | Ação principal, sucesso e foco              |
| `--blue`           | `#8cbbd0` | Rotina, informação                          |
| `--orange`         | `#d7ac80` | Finanças de saída, pendências e alimentação |
| `--purple`         | `#ae9cca` | Tom auxiliar                                |
| `--pink`           | `#c695ad` | Tom auxiliar                                |
| `--yellow`         | `#d1c58c` | Tom auxiliar                                |
| `--gray`           | `#a3a9b0` | Neutro                                      |

RGB tokens correspondentes (`--*-rgb`) devem ser usados em `rgba()` para fundos suaves.

### Tema claro

Ativado por `:root[data-theme='light']` (`src/index.css:51-77`). O fundo é `#f7f7f5`, cards são `#fff`, sidebar `#fdfdfb`, texto `#202523`, bordas `#e0e4dc` e o verde passa a `#58754c`. Sempre testar ambos os temas; não fixar cores escuras em componentes compartilhados.

## Tipografia

- Base: 14px, line-height 1.5.
- `h1`: 32px, peso 550, letter-spacing -1.2px, line-height 1.25; em mobile 28px.
- `h2`: 16px, peso 550, letter-spacing -0.25px.
- `h3`: 14px, peso 550.
- Body secundário: normalmente 10–13px em cards e toolbars.
- Labels de contexto (`.eyebrow`): 8–9px, uppercase, letter-spacing aproximado de 1.3–1.8px.
- Números usam pesos moderados e, quando financeiros, `font-variant-numeric: tabular-nums`.

Evidência: `src/index.css:127-149`, `src/styles/layout.css:180-210`, `src/styles/components.css:1-16` e `src/styles/pages.css:1-90`.

## Espaçamento e dimensões

Não existe escala formal de tokens numéricos; o padrão predominante é:

- Card desktop: padding 24px, radius 12px.
- Card mobile: padding 19px, radius 10px.
- Botão: min-height 39px, padding 10px 15px, radius 7px.
- Inputs: min-height 42px, padding 11px 12px, radius 8px; em telas menores, min-height 48px e fonte 16px para evitar zoom do iOS.
- Gaps recorrentes: 10–22px entre elementos e 17–24px entre colunas/cards.
- Separadores: 1px em `--border` ou `--subtle-border`.
- Modais: radius 15px, largura padrão até 540px e variante wide até 680px.
- Sombra geral é discreta (`--shadow`); modal/toast usam sombras mais fortes apenas para elevação.

Evidência: `src/index.css:155-171,260-263`, `src/styles/components.css:1-68,291-343`.

## Layout e navegação

`AppLayout` cria sidebar fixa desktop de 228px, workspace com `margin-left: 228px`, topbar de 76px e conteúdo com padding horizontal de 42px (`src/components/layout/AppLayout.jsx:15-120`, `src/styles/layout.css:1-190`). A marca usa wordmark “simplelife.” e marca oval verde. A navegação tem item ativo verde, fundo translúcido e ponto indicador.

Em até 1200px, sidebar reduz para 205px e padding para 28px. Em até 950px, vira rail de 80px com apenas ícones. Em até 640px, vira bottom navigation de 68px + safe area, workspace ganha padding inferior e a topbar reduz para 62px (`src/styles/layout.css:297-390`).

Páginas internas normalmente seguem: `PageHeading` → `Tabs` opcional → toolbar/filtros → grids de cards → listas/tabelas → footer. Home é exceção: saudação, foco do dia, timeline e cards de resumo. Finanças, Rotina e Alimentação usam tabs e seletores semanais/mensais como padrão (`src/pages/HomePage.jsx:85-220`, `src/pages/FinancePage.jsx:21-110`, `src/pages/RoutinePage.jsx:12-90`, `src/pages/NutritionPage.jsx:34-150`).

## Componentes e interação

- Botão primário é verde com texto `--button-text`; secundário usa `--surface-raised`; ghost é transparente.
- Hover altera superfície/cor; active desloca 1px. Disabled reduz opacidade para 0.5.
- Foco global é `2px solid var(--green)` com offset 4px.
- Cards usam fundo `--surface`, borda `--border`, radius 12px.
- Badges e icon tiles usam uma cor semântica com fundo `rgba(var(--tone-rgb), .08)`.
- Tabs têm borda inferior e item ativo verde com underline de 2px.
- Progress bars têm 5px, tone semântico e `aria-valuenow/min/max`.
- Modal usa `<dialog>.showModal()`, portal, bloqueio de scroll, fechamento por Escape/backdrop e retorno de foco (`src/components/ui/Modal.jsx:1-54`).
- Toast é fixo no rodapé, surface-raised, borda verde translúcida e, no mobile, fica acima da bottom nav.
- Loading usa spinner, skeleton shimmer e `prefers-reduced-motion`; empty state centraliza icon tile, título, descrição e ação.

## Grids e telas de referência

- Home: hero/foco com gradientes orbitais discretos, cards diários em duas colunas, timeline e side cards; mobile empilha e reduz a decoração (`src/styles/pages.css:1-500`).
- Finanças: quatro stats, cards de fatura, colunas de gastos/orçamento, listas filtráveis e tabelas; mobile empilha colunas e filtros quebram linha (`src/styles/pages.css:520-780,1374-1520`).
- Alimentação: resumo, cards de refeição, seletor de semana de sete dias, plano/importação e gráfico de peso (`src/styles/pages.css:822-1180`).
- Perfil: cards de formulário, permissões e seleção de tema; no mobile ações ficam fixas acima da navegação (`src/styles/pages.css:1190-1380,1521-1605`).
- Autenticação: layout em duas colunas com painel introdutório orbital e formulário; abaixo de 800px vira uma coluna (`src/styles/auth.css:1-270`).

## Responsividade

Breakpoints efetivamente usados: 1650/1600 para telas largas, 1200 para densidade intermediária, 950 para rail, 900 para inputs mobile, 800 para grids/auth, 640 para bottom nav e composição mobile, 600 para loading e 370 para telas muito estreitas. Preserve esses pontos antes de criar novos.

## Exemplo canônico

```jsx
<PageHeading
  eyebrow="CONTEXTO"
  title="Título da página"
  description="Uma descrição curta em português."
  action={<Button icon="plus">Nova ação</Button>}
/>
<Card>
  <SectionTitle title="Seção" subtitle="Contexto adicional" />
  <Field label="Nome" hint="Opcional">
    <input placeholder="Digite aqui" />
  </Field>
</Card>
```

Importe de `src/components/ui/Primitives.jsx` e use classes/tokens existentes; não replique CSS de botão, card ou campo.

## Limitações e divergências observadas

- Não há tokens de espaçamento, radius ou tipografia formalmente centralizados; os valores acima são padrões predominantes inferidos do CSS.
- `src/styles/pages.css` contém detalhes específicos de cada domínio, portanto nem toda classe é um componente universal.
- A skill instalada recomenda uma estética “no-slop” que pode proibir gradientes, labels ou icon tiles; isso conflita com partes reais do Simplelife. O projeto existente prevalece.
- A inspeção visual via navegador não foi concluída nesta sessão porque a tentativa de navegação foi recusada; a validação disponível foi estática/build/testes.
