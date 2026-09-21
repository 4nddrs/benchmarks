# Memory worlds

A five-minute visual lesson: **long-horizon is not memory**. Real GIFs and clips, then the action vector `env.step` actually consumes.

This is **not** a code mapping. The call-tree menu lives next door in `menuCodeMapping/` (code_flow, port 8766). That site answers *what our Python did*. This one answers *what the world is*, and whether a policy needs history.

## Open

```bash
bash serve.sh          # http://127.0.0.1:8767/
# or open index.html from disk
```

## What the page teaches

1. **Long ≠ memory.** CALVIN / LIBERO / RoboCasa can run for hundreds of steps with every object still on camera. MIKASA RememberColor hides the cue (the yellow square).
2. **Three regimes** (MemMimic / Gated Memory Policy): Markovian, in-trial, cross-trial.
3. **Worlds, not papers:** RememberColor, ShellGameTouch, TakeItBack, Intercept (MIKASA-Robo); Match Color, Iterative Pushing, Place Back (MemMimic); CALVIN as the long-but-visible contrast; EgoGym as the 17-D exception.
4. **Action layouts** from published env specs only — no live probe, no invented step values. MIKASA/LIBERO: 7-D `pd_ee_delta_pose`. EgoGym: flattened 4×4 + gripper.

**Gated Memory Policy** and **LaWAM** are policies, not simulators. GMP is evaluated on MemMimic + MIKASA-Robo. LaWAM is evaluated on LIBERO + RoboTwin.

Footage is stored under `assets/` from the projects’ public pages (MIKASA-Robo docs, GMP site, CALVIN repo).

Interactive bits: regime filters, EgoGym card with a live 7-D / 17-D arm switch, play/pause on clips, dark/light theme. Clone buttons copy the public GitHub URL — those folders are not on this laptop.

## Relationship to code_flow

| | Memory worlds | code_flow menu |
|---|---|---|
| Unit | one task / memory regime | one command run |
| Question | does this world need history, and what action it needs | which functions ran, with which values |
| Port | 8767 | 8766 |
