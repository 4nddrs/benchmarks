# Robot Benchmark Atlas

`index.html` is a tabbed explainer for four robot-learning benchmarks: **RoboCasa**, **MIKASA-Robo**, **LIBERO** and **EgoGym**. The landing tab compares them side by side. Each benchmark tab is meant to be understood in about 30 seconds: what kind of benchmark it is, what the data looks like (observation → policy → action), what the tasks are, and how it's scored. Robotics terms have hover or tap definitions for newcomers.

Demo videos live in `media/`. They were re-encoded from each project's public site or repo (robocasa.ai, the MIKASA-Robo README GIFs, libero-project.github.io, the EgoGym README, cap-policy.github.io). Deep links: `#robocasa`, `#mikasa`, `#libero`, `#egogym`.

```bash
bash serve.sh          # http://127.0.0.1:8767/
```

The earlier "Memory worlds" page now lives at `memory-worlds.html` (it still uses `assets/`).

---

# Memory worlds (`memory-worlds.html`)

A five-minute visual lesson: **long-horizon is not memory**. Real GIFs and clips, then the action vector `env.step` actually consumes.

This is **not** a code mapping. The call-tree menu lives next door in `menuCodeMapping/` (code_flow, port 8766). That site answers *what our Python did*. This one answers *what the world is*, and whether a policy needs history.

## Open

```bash
bash serve.sh          # http://127.0.0.1:8767/
# or open index.html from disk
```

## What the page teaches

1. **Long ≠ memory.** CALVIN / LIBERO / RoboCasa can run for hundreds of steps with every object still on camera. MIKASA RememberColor hides the cue (the yellow cube).
2. **Three regimes** (MemMimic / Gated Memory Policy): Markovian, in-trial, cross-trial.
3. **Worlds, not papers:** RememberColor, ShellGameTouch, TakeItBack, Intercept (MIKASA-Robo); Match Color, Iterative Pushing, Place Back (MemMimic); CALVIN as the long-but-visible contrast; EgoGym as the 17-D exception.
4. **Action layouts** from published env specs only — no live probe, no invented step values. MIKASA/LIBERO: 7-D `pd_ee_delta_pose`. EgoGym: flattened 4×4 + gripper.

**Gated Memory Policy** and **LaWAM** are policies, not simulators. GMP is evaluated on MemMimic + MIKASA-Robo. LaWAM is evaluated on LIBERO + RoboTwin.

Footage is stored under `assets/` from the projects’ public pages (MIKASA-Robo docs, GMP site, CALVIN repo).

Interactive bits: regime filters (EgoGym is the 17-D action contrast and stays on All), EgoGym card with a live 7-D / 17-D arm switch, dark/light theme. Clone buttons copy the public GitHub URL — those folders are not on this laptop.

## Relationship to code_flow

| | Memory worlds | code_flow menu |
|---|---|---|
| Unit | one task / memory regime | one command run |
| Question | does this world need history, and what action it needs | which functions ran, with which values |
| Port | 8767 | 8766 |
