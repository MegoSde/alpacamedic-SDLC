# Sikkerhedspolitik (H4-lab)

Dette repository skal behandles som et udviklingsprojekt med syntetiske testdata.

1. **Secrets:** Ingen passwords, tokens, SSH-nøgler, keytabs eller private certifikatnøgler må commits.
2. **Dependencies:** Nye og opdaterede Python-afhængigheder skal vurderes med `pip-audit`, herunder transitive afhængigheder. En ren scanning er ikke garanti mod malware.
3. **Kildekode:** SAST og secret scanning køres lokalt og gentages senere i CI.
4. **Git:** Beskyttede miljøbranches; ændringer via godkendte pull requests.
5. **Staging:** DAST må kun køres mod isolerede miljøer med syntetiske data.
6. **Release:** Kun kontrollerede commits og godkendte artifacts må deployeres.
7. **Efterfølgende fund:** Ny CVE eller kompromittering registreres, risikovurderes og følges op med patch, rollback eller dokumenteret undtagelse.

Ansvar for alvorlige fund: Projektansvarlig/underviser i undervisningsmiljøet.
