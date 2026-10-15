# Integration and stabilization plan

Requested sequence: consolidate worktree code, resolve integration/build errors,
validate the integrated build, then begin broader correctness and architecture work.
No public API redesign or unrelated optimization is part of the integration stage.

## Stage 1: Inventory and integrate

- [x] Record current main: `4426c77`.
- [x] Compare every registered worktree branch against main.
- [x] Identify unmerged committed work: image branch commits `0275f4f`, `3667ad3`.
- [x] Snapshot all dirty worktrees after the user requested all current changes.
- [x] Integrate uncommitted image, blit, GPU and player-library changes; reconcile superseded dashboard edits.
- [x] Apply the committed image branch delta to the current main working tree.
- [x] Prepare the complete merge tree in a writable integration repository,
  retaining main `4426c77` and image branch `3667ad3` as its two parents.
- [x] Validate that source tree and record its merge commit with the requested
  coauthor trailer; export `.cache/integration/merged-worktrees.bundle`.
- [ ] Advance the primary checkout's main branch/index to the merge commit.
  Session policy mounts the primary `.git` read-only; creating
  `.git/ORIG_HEAD.lock` fails. No primary-checkout branch history was changed.

The other worktree branch tips are already ancestors of main. Uncommitted changes
from blit, dashboard, GPU, images and player UI were snapshotted under
`.cache/integration/worktrees` (including base files and patches). Their source
worktrees remain unchanged. Dashboard draft changes already incorporated and
extended on main were resolved in favor of the newer implementation; a 38-line
smoke scene does not replace the functional dashboard.

## Stage 2: Build and integration gate

Use `/home/addo/.zvm/master/zig`, without explicit job limits. Use a writable
project cache and compile examples against this local checkout (`--fork=..`).

- [x] Default library build (Debug).
- [x] Compile consumer/link check (Debug; never execute the consumer).
- [x] Library build and compile consumer (ReleaseSafe).
- [x] Existing native unit tests (Debug and ReleaseSafe).
- [x] Image benchmark programs compile (ReleaseFast).
- [x] All native examples/apps compile (ReleaseFast, local zdl checkout).
- [x] Existing app/media unit tests pass against the local checkout.
- [x] Relevant headless example runs succeed.
- [x] Formatting and whitespace checks pass on integration changes.
- [x] Record exact results and remaining environmental limitations here.

Fix errors caused or exposed by this integration, with focused regression tests
where a behavioral correction is necessary. Do not broaden the scope into the
architecture redesign during this stage.

## Stage 3: Correctness review (after integration gate)

1. The reproduced Platform.open duplicate-destroy path is fixed and has a
   dedicated libc-linked regression covering invalid drivers/allocation failure.
   Extend this to other initialization, partial construction and teardown paths.
2. Replace reference-only compile checks with representative API calls.
3. Expand malformed-image, decoder-limit and differential pixel tests. Audit
   the incoming options individually (frame selection, threading, postprocessing
   limits and metadata); a compiling options struct is not proof each knob works.
4. Verify event payload leases, timestamp domains and resource lifetime rules.
5. Add repeatable backend smoke/replay checks; label physical hardware paths
   separately from unit tests and compile checks.

## Stage 4: Architecture and performance (after correctness baseline)

1. Define consistent public entry points and typed backend handles.
2. Add explicit compile-time backend/driver inclusion while retaining runtime
   selection among enabled implementations; measure resulting binaries.
3. Address event-queue removal costs and avoid redundant pixel buffers.
4. Reconcile documentation with the verified implementation and runtime status.
5. Benchmark representative end-to-end workloads before changing native versus
   system-library choices or claiming performance superiority.

## Verification record

Final Debug and ReleaseSafe library reruns pass 296/296 tests each. Original source
worktrees are unchanged from the captured snapshots. All runtime checks here are
headless; no new live GPU, camera, controller or audio-hardware claim is made.

Known feature boundaries in integrated drafts:

- Full GIF/WebP/APNG animation decoders were referenced but absent. Still-image
  animation wrappers work; animated containers return `UnsupportedAnimation`.
- GPU allocation bookkeeping is integrated, but missing relocation helpers
  explicitly return `UnsupportedFeature`; fresh-block allocation remains the
  fallback. This is not implemented defragmentation.
- AVIF fixtures and broad format signatures do not provide AVIF/JXL/SVG decoders.
- The follow-up all-target validation fixes the Platform.open duplicate-destroy
  error path and adds a dedicated platform regression. Other correctness review
  items remain pending.

Artifacts and logs are in `.cache/integration/`; they are development outputs,
not part of the package. The original worktree snapshots remain available there.


### Commands and outcomes

All commands use `/home/addo/.zvm/master/zig` with
`ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global"` from the repository root
(or its absolute equivalent from `examples/`). No explicit job limits are used.

- `zig build --summary all`: pass, 4/4 steps.
- `zig build check --summary all`: pass, 4/4 steps; the consumer was not run.
- `zig build --release=safe --summary all`: pass, 4/4 steps.
- `zig build test --summary all`: pass, 296/296 tests.
- `zig build test --release=safe --summary all`: pass, 296/296 tests.
- In `examples`, `zig build --fork=.. -Doptimize=ReleaseFast --summary all`:
  pass, 61/61 steps (30 executables).
- In `examples`, `zig build test-apps --fork=.. --summary all`: pass,
  24/24 tests across dashboard, UI, media and the newly included library module
  (final rerun: 21 executed, 3 reused from the passing cache).
- JPEG and PNG benchmark executables compile in ReleaseFast without libc; both
  have no ELF dynamic section. Their run results are smoke measurements, not a
  controlled performance comparison or evidence of superiority to other codecs.
- Texture, affine-texture and readback examples each rendered two headless
  640x480 BMPs; independent Pillow decoding checked dimensions, nonuniform
  pixels and changes between frames using the final rebuilt binaries.
- Dashboard light/dark and player snapshots rendered as 1440x900 PNGs. The
  PNGs were independently decoded with Pillow. The dashboard and player
  screenshots were visually inspected; this is smoke QA,
  not a claim of visual parity or media/hardware validation.
- `zig fmt --check`, `git diff --check` and Python generator syntax checks pass.

The optimized JPEG rerun initially exposed four scalar/vector equivalence
failures in the unsigned-byte clamp context. Rewriting the bounds as explicit
signed min/max and adding an upper-byte-range regression restores the original
JPEG pixel hashes and passes the full Debug/ReleaseSafe suite. No compiler-wide
conclusion is drawn from that isolated optimized-context behavior.

## Complete run-target validation follow-up

`python3 tools/validate.py` compiles the root Debug/ReleaseSafe builds, checks and
unit suites; default/ReleaseFast examples; native application build target; and
Debug/ReleaseSafe app tests. It discovers and invokes every named `run-*` step
from `examples/build.zig` using finite headless arguments. Audio runs use a
process-local ALSA null-device configuration and fail validation if playback is
silently skipped. Custom titlebar `--frames N` is an explicit finite offscreen
mode; native drag/resize and live hardware remain separate manual checks.

The root `test` step now includes one dedicated libc-linked platform regression
in addition to the libc-free core suite. This keeps optional backend bodies
checked without adding libc linkage to the exported module or image consumers.

The commit message is prepared with
`Co-authored-by: GPT-6.1 Sol <noreply@openai.com>`. Primary-checkout Git merge/commit remains blocked
by the session's read-only `.git` mount. The portable integration commit described
below preserves the merged history without modifying that protected metadata. Final command outcomes are recorded under `.cache/validation`.

### Final complete validation results

The final `tools/validate.py` run passed all 39 commands:

- Root Debug build and compile check, plus ReleaseSafe build: pass.
- Root Debug and ReleaseSafe tests: **296/296** in each mode (295 core tests
  plus the libc-linked platform allocation-failure regression).
- Default Debug and ReleaseFast example builds: all 30 executables compile.
- `build-apps` in ReleaseFast: pass.
- `test-apps` in Debug and ReleaseSafe: **24/24** in each mode.
- Every declared `zig build run-*` target: **29/29** pass, using finite
  headless runs. All five audio targets exercise the ALSA null PCM without
  taking their device-unavailable skip path. This does not test speakers.
- Generated BMP/PNG artifacts independently decode with Pillow.
- Source formatting, whitespace and Python syntax checks: pass.

The actual merge commit lives on `integration/all-worktrees` in the writable
integration repository recorded by `.cache/integration/commit-repository.json`.
Its portable bundle is `.cache/integration/merged-worktrees.bundle`. The primary
checkout contains the identical validated source changes, but its main branch
pointer/index cannot be updated under the current read-only Git policy. No
source worktree was reset or discarded.
