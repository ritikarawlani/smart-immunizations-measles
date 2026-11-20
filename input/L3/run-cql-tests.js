// Run the L2 dummy clients (input/testing/decision-table-tests.json) through the compiled ELM of
// input/cql/MEASLESDT0*.cql with cql-execution. ELM_DIR (default ./elm) holds the translator's JSON output;
// see input/L3/README.md.
const cql = require('cql-execution'); const fs = require('fs');
const tests = JSON.parse(fs.readFileSync(require('path').join(__dirname, '../testing/decision-table-tests.json'))).tests;
const outName = { 'MEASLES.DT.01': 'doseDue', 'MEASLES.DT.02': 'screening', 'MEASLES.DT.03': 'countsAs', 'MEASLES.DT.04': 'additionalDoseDue' };
(async () => { let fail = 0, n = 0;
for (const [dt, cases] of Object.entries(tests)) {
  const lib = new cql.Library(JSON.parse(fs.readFileSync(`${process.env.ELM_DIR || 'elm'}/${dt.replace(/\./g, '')}.json`)));
  for (const t of cases) {
    const ex = new cql.Executor(lib, null, t.given);
    const r = await (ex.execWithoutPatient ? ex.execWithoutPatient() : ex.exec(new cql.PatientSource([])));
    const res = r.unfilteredResults || r.patientResults || r;
    const got = res[outName[dt]]; n++;
    const ok = got === t.expect; if (!ok) fail++;
    console.log(`${ok ? 'ok  ' : 'FAIL'} ${dt} ${t.name}: ${got}${ok ? '' : ' (expected ' + t.expect + ')'}`);
  } }
console.log(`${n - fail}/${n} pass`); process.exit(fail ? 1 : 0); })();
