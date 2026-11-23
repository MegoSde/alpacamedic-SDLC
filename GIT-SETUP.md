# Git-platform – indstillinger, som skal sættes manuelt

Denne vejledning antager GitHub. Tilsvarende funktioner findes ofte på andre Git-platforme, men menuerne varierer.

1. Opret repository fra templaten med `main` som default branch.
2. Opret de permanente branches `develop` og `staging` fra `main`.
3. Skift default branch til `develop`, så nye PR'er normalt rammer integrationsbranchen.
4. Opret branch rules/rulesets for `develop`, `staging` og `main`:
   - Kræv pull request før merge.
   - Kræv mindst én godkendelse (hvis plan/repository understøtter håndhævelse).
   - Blokér force-push og sletning.
   - Begræns bypass-rettigheder.
5. Tilføj status checks som påkrævede, **først efter** tilsvarende CI-workflows er oprettet og fungerer.
6. Tillad ikke ureviewede ændringer i CI-workflow-filer.
7. Ved promotion: PR `develop -> staging`, derefter `staging -> main`.
8. Opret annoteret release-tag på det godkendte produktionscommit, fx `v0.1.0`.

Bemærk: GitHub-beskyttelse og tilgængelige settings varierer med repo-type, ejer og plan. Verificér de effektive regler med et afvist direkte push.

## Første lokale kommandoer (efter clone)

```bash
git switch develop
git pull --ff-only
git switch -c feature/42-patient-search
# foretag ændringer
git add .
git commit -m 'feat: add patient search'
git push -u origin feature/42-patient-search
```

Opret derefter en PR mod `develop` på Git-platformen.
