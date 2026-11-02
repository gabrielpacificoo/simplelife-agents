# Catálogo de componentes reutilizáveis

Os caminhos abaixo são a fonte para props e comportamento. Procure aqui antes de criar um componente.

## Primitivas de UI

| Componente     | Caminho                                    | Props relevantes                                                               | Reutilização                                 |
| -------------- | ------------------------------------------ | ------------------------------------------------------------------------------ | -------------------------------------------- |
| `Button`       | `src/components/ui/Primitives.jsx:4-10`    | `children`, `icon`, `variant` (`primary`, `secondary`, `ghost`), props nativas | Ações principais e secundárias               |
| `IconButton`   | `src/components/ui/Primitives.jsx:12-17`   | `icon`, `label`, props nativas                                                 | Ações compactas; sempre fornecer label       |
| `Card`         | `src/components/ui/Primitives.jsx:19-24`   | `children`, `className`                                                        | Containers de conteúdo                       |
| `SectionTitle` | `src/components/ui/Primitives.jsx:26-35`   | `title`, `subtitle`, `action`                                                  | Cabeçalhos internos de cards                 |
| `PageHeading`  | `src/components/ui/Primitives.jsx:37-47`   | `eyebrow`, `title`, `description`, `action`                                    | Cabeçalho de página                          |
| `Tabs`         | `src/components/ui/Primitives.jsx:49-63`   | `items` como `[id,label][]`, `value`, `onChange`                               | Subrotas e seções                            |
| `Progress`     | `src/components/ui/Primitives.jsx:65-77`   | `value`, `color`, `label`                                                      | Metas e orçamento; já possui ARIA            |
| `Badge`        | `src/components/ui/Primitives.jsx:79-80`   | `children`, `color`                                                            | Status e contagens                           |
| `EmptyState`   | `src/components/ui/Primitives.jsx:82-97`   | `icon`, `title`, `description`, `action`                                       | Ausência de dados e rotas indisponíveis      |
| `Field`        | `src/components/ui/Primitives.jsx:99-108`  | `label`, `hint`, `children`, `className`                                       | Formulários com label/description associados |
| `Stat`         | `src/components/ui/Primitives.jsx:110-123` | `label`, `value`, `detail`, `icon`, `color`, `children`                        | Indicadores de dashboard                     |

Exemplo:

```jsx
<Stat label="Saldo atual" value={currency(balance)} detail="Até hoje" icon="wallet" />
```

## Layout, navegação e feedback

| Componente                       | Caminho                                      | Responsabilidade                                  |
| -------------------------------- | -------------------------------------------- | ------------------------------------------------- |
| `AppLayout`                      | `src/components/layout/AppLayout.jsx:15-120` | Sidebar, topbar, tema, sessão, skip link e footer |
| `Modal`                          | `src/components/ui/Modal.jsx:5-54`           | Dialog nativo em portal, foco, Escape e backdrop  |
| `LoadingState` / `LoadingRegion` | `src/components/ui/LoadingState.jsx:1-80`    | Spinner, skeleton e overlay de carregamento       |
| `AuthGate`                       | `src/components/AuthGate.jsx:1-80`           | Proteção de rotas e tela de autenticação          |
| `Icon`                           | `src/components/ui/Icon.jsx:43-61`           | Ícones SVG internos por nome                      |

Não implemente um modal com `div` ou um toast paralelo sem avaliar esses componentes.

## Visualizações e listas

| Componente           | Caminho                                        | Uso                                  |
| -------------------- | ---------------------------------------------- | ------------------------------------ |
| `BarChart`           | `src/components/ui/Charts.jsx:3-25`            | Série curta de barras com aria-label |
| `WeightChart`        | `src/components/ui/Charts.jsx:26-75`           | Evolução de peso em SVG              |
| `TransactionList`    | `src/components/TransactionList.jsx:5-80`      | Movimentações financeiras            |
| `ActivityList`       | `src/components/ActivityList.jsx:6-100`        | Tarefas recorrentes                  |
| `MealCard`           | `src/components/MealCard.jsx:8-100`            | Refeição, alimentos e marcação       |
| `WaterCard`          | `src/components/WaterCard.jsx:8-100`           | Hidratação e progresso               |
| `RoutineProgress`    | `src/components/RoutineProgress.jsx:6-100`     | Indicadores de rotina                |
| `CreditCardInvoices` | `src/components/CreditCardInvoices.jsx:11-180` | Cartões, faturas e sincronização     |

## Formulários e fluxos

`src/components/forms/RecordForms.jsx:51-370` contém `CreditCardInvoiceForm`, `CategoryForm`, `ActivityForm`, `WeightForm`, `MealForm` e `ConfirmForm`. O fluxo de importação de plano está em `src/components/DietImport.jsx:10-260`.

Use esses formulários dentro do `Modal` por meio do mecanismo de `forms` em `src/App.jsx:20-45`; não crie um modal específico para cada registro.

## Páginas de referência

- `HomePage`: composição diária, foco e timeline.
- `FinancePage`: filtros, stats, cards, tabela/lista e planejamento.
- `RoutinePage`: tabs, seletor semanal, listas e progresso.
- `NutritionPage`: tabs, refeições, plano, importação e evolução.
- `ProfilePage`: formulário, tema, permissões e confirmação de navegação.
- `AuthPage`: login/cadastro em duas etapas.

## Regra de criação

Antes de criar algo:

1. Buscar o nome/semântica em `src/components` e `src/styles`.
2. Verificar se `Primitives.jsx`, `AppLayout`, `Modal`, `LoadingState` ou uma lista de domínio já resolvem o caso.
3. Preferir composição de primitives a novos componentes globais.
4. Se um novo componente for necessário, manter props explícitas, CSS no arquivo de estilo apropriado e uma utilização real em página.
