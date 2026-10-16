# Disposable pinned-zlay adapter

Run `python3 tools/audit_layout_spike.py` from the full repository checkout.
It verifies the examples' dependency pin against `pin.json`, reads the already
cached package archive, extracts only into owned cache scratch and supplies the
source directory to the optional root build steps. No network/development package
install or root library dependency is introduced.

The build steps are available with `-Dlayout-zlay-source=/absolute/source`:
`check-layout-spike` compiles, `test-layout-spike` runs pure geometry plus Pango
opaque-measurement tests. Manual arbitrary source directories are developer
experiments; only the audit verifies provenance. `--layout-spike` opts the full
validator into the audit.

Adapter inputs are retained scene snapshots, checked-ID styles and opaque leaf
measurements. All APIs are owner-thread only. Error callbacks only record backend
failures and never call application code. Results independently own copied boxes,
measurement requests and a retained source scene; they can outlive the Adapter.
Do not read implementation boxes as usable layout when requests are outstanding:
`get`/`placements` reject them until `ready()` is true.

There is no public zdl layout API or production frame integration here. Read the
[decision and limits](../../../docs/experiments/layout-zlay.md) before adoption.
