# H4 Python – Secure SDLC repository template

Denne template beskriver Git-processen for Python-projekter på H4. Den indeholder endnu ikke CI/CD, FastAPI eller PostgreSQL.

## Branches

- `develop`: godkendt integrationskode til Dev
- `staging`: releasekandidat til Staging
- `main`: produktionsgodkendt kode
- `feature/<issue>-<beskrivelse>`: ny funktion
- `fix/<issue>-<beskrivelse>`: fejlrettelse
- `security/<issue>-<beskrivelse>`: sikkerhedsrettelse
- `hotfix/<issue>-<beskrivelse>`: akut rettelse med udgangspunkt i `main`

Issue-ID må udelades i små labs. Brug lowercase ASCII og bindestreger.

## Normalt flow

1. Opret branch fra `develop`.
2. Implementér ændring og udfør lokale sikkerhedskontroller.
3. Opret PR til `develop`; review og status checks er påkrævet.
4. Opret promotion-PR fra `develop` til `staging`; gennemfør Build og Test.
5. Godkend en release fra `staging` til `main`; release-tag eksempelvis `v0.1.0`.
6. CI/CD skal på sigt promovere samme byggede image-digest mellem Staging og Production.

## Hotfix

1. Opret `hotfix/<issue>-<beskrivelse>` fra `main`.
2. Review og test rettelsen; merge til `main`, opret nyt release-tag.
3. Bring hotfix tilbage til `develop` (og `staging`, hvis staging ikke nulstilles fra den nye produktionsversion).
4. Dokumentér eventuelle mergekonflikter. Undgå utilsigtet rollback ved miljø-promovering.

## Sikkerhedspolitik

Se [SECURITY.md](SECURITY.md) og [CONTRIBUTING.md](CONTRIBUTING.md).

## Opsætning på Git-platformen

Branch protection og required checks kan ikke håndhæves alene med filer i templaten. Se [GIT-SETUP.md](GIT-SETUP.md).
