# smart-immunizations-measles

A measles immunization SMART Guideline, authored with folio-assistant from the
L1 sources attached to
[issue #1](https://github.com/ritikarawlani/smart-immunizations-measles/issues/1).

| level | what | where |
|---|---|---|
| L1 | the sources as attached | `sources/` |
| L1 | the sources ingested, and the measles recommendations extracted from them | `library/` |
| L2 | the Digital Adaptation Kit (personas, processes, decision tables, data elements, indicators, requirements, test scenarios) | `input/` (DAK components) |
| L3 | the FHIR Implementation Guide derived from the DAK | `sushi-config.yaml`, `input/fsh/`, `input/cql/` |

## Sources (issue #1)

- who.int/data/immunization
- WHO immunization summary tables 1–4 (summary of WHO position paper recommendations)
- Monitoring metrics related to the Global COVID-19 Vaccination Strategy (July 2022 update)
- Leave no one behind: guidance for planning and implementing catch-up vaccination (ISBN 9789240016514)
- WHO digital documentation of COVID-19 certificates: vaccination status (2021.1)
- WHO/UNICEF Joint Reporting Form (2016)
- Immunization facility analysis guide
- PAHO electronic immunization registry (ISBN 9789275119532)

## Working here

```sh
bun run cat <script>    # mounts the platform layers from index.lock.json on first use
```

Agents: start at [`AGENTS.md`](AGENTS.md).
