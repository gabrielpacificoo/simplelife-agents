# simplelife-agents

Repositório para versionar os agentes do Codex.

## Atualizar agentes locais

1. Coloque os arquivos dos agentes dentro de `/home/runner/work/simplelife-agents/simplelife-agents/agents/`.
2. Execute:

```bash
./sync-agents.sh
```

O script remove os agentes antigos de `~/.agents/simplelife/` e copia os arquivos atualizados deste repositório para esse diretório local.