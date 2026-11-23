# Udviklings- og mergepolitik

## Før arbejdet begynder

- Clone kun repositories fra en kilde, du har vurderet, og udfør ikke ukendte scripts automatisk.
- Brug VS Code Workspace Trust for ukendte projekter.
- Installér dependencies i et Python virtual environment, gennem organisationens godkendte package index når det er etableret.
- Kør `pip-audit` mod projektets fastlåste afhængigheder inden en ny version indgår i projektet.

## Branch-navne

`feature/<issue>-<kort-navn>`, `fix/<issue>-<kort-navn>`, `security/<issue>-<kort-navn>`, `hotfix/<issue>-<kort-navn>`.

Eksempel: `security/63-update-psycopg`.

## Pull requests

- Alle ændringer til `develop`, `staging` og `main` via PR (undtagelser skal dokumenteres).
- Ingen direkte push eller force-push til de tre beskyttede branches.
- Mindst én godkender ud over forfatteren (underviser kan være reviewer i lab).
- Alle obligatoriske status checks skal bestå. Indfør dem først som `required`, når workflowet findes.
- Ændringer skal beskrive risiko, test og påvirkede dependencies.
- Undgå secrets, patientdata og .env-filer i Git.

## Promotion

- Feature/fix/security -> `develop`.
- `develop` -> `staging`: kun når integrationstests og build er bestået.
- `staging` -> `main`: godkendt release, ingen utestede ekstra ændringer.
- Bevar relevante commit-SHA'er ved promotion. Squash kan bruges til feature-PR'er, men ikke til miljø-promoveringer.
- Et senere CI/CD-setup skal bygge én gang og promovere samme artifact-digest.

## Når en sårbarhed opdages efter release

Registrér advisory, berørte versioner, ejer, prioritet, midlertidige afværgeforanstaltninger og rettelse. Stop ny release ved uacceptabel risiko, ret i `security/*` eller `hotfix/*`, gennemfør test og udgiv ny version. Et gammelt godkendt commit er ikke automatisk sikkert i dag.
