# Robot Benchmark Atlas

`index.html` is a tabbed explainer for sixteen robot-learning benchmarks: **EgoGym**, **LIBERO**, **LIBERO-Plus**, **LW-RoboCasa-Tasks**, **M3-Bench-robot**, **Meta-World**, **MIKASA-Robo**, **MimicDroid**, **NaVQA**, **RLBench**, **RoboCasa**, **RoboCasa GR-1 Tabletop**, **RoboCasa Kitchen**, **RoboCasa365**, **RoboTwin 2.0** and **VLABench**. Six of them are built on RoboCasa: the RoboCasa tab covers the original 2024 release and links to the other five. The landing tab compares them side by side. Each benchmark tab is meant to be understood in about 30 seconds: what kind of benchmark it is, what the data looks like (observation → policy → action), what the tasks are, and how it's scored. Robotics terms have hover or tap definitions for newcomers.

Demo videos live in `media/`. They were re-encoded from each project's public site or repo (robocasa.ai, the MIKASA-Robo README GIFs, libero-project.github.io, the EgoGym README, cap-policy.github.io). The `libero_sim_*.mp4` clips are real simulator frames (agentview + wrist, 256 px, 20 fps) taken from episode 0 of each suite in `lerobot/libero_{spatial,object,goal,10}_image` on Hugging Face. The `robotwin_*.mp4` clips are real demos (head camera, and wrist cameras for the handover) cut from `lerobot/robotwin_unified` on Hugging Face: the first clean episode (index 550·k) and first randomized episode (550·k + 50) of each chosen task. The `rlbench_views.mp4` / `rlbench_tasks.mp4` clips are episode 0 (128 px, 20 fps) of tasks in `hqfang/rlbench-18-tasks`, read straight out of the remote zips with HTTP range requests; `rlbench_task_builder.mp4` and `rlbench_task_grid.jpg` come from the RLBench repo. The `vlabench_*.mp4` clips are real demos from `VLABench/vlabench_primitive_ft_lerobot_video` and `VLABench/vlabench_composite_ft_lerobot_video` (recorded at 10 Hz; composites shown at 2×). The `liberoplus_*.mp4` clips are the OpenVLA-OFT failure rollouts published in the LIBERO-Plus repo (`static/videos/case_study/`), one per perturbation; `liberoplus_grid.mp4` adds an unperturbed LIBERO-Spatial demo as the reference tile. The `metaworld_*.mp4` clips are rendered locally from Meta-World 3.1.1 (MuJoCo, EGL) with its built-in scripted expert policies and LeRobot's `corner2` camera setup (moved camera, image flipped on both axes), the same source as `lerobot/metaworld_mt50`; they play at half speed (40 fps of the 80 Hz control rate) and freeze on success. The `rkitchen_*.mp4` clips are episode 0 (or 1) of the 24 atomic tasks in `nvidia/PhysicalAI-Robotics-GR00T-X-Embodiment-Sim` (`single_panda_gripper.*`, 256 px, 20 fps). The `gr1_*.mp4` clips are episode 0 of each task's head camera in `nvidia/PhysicalAI-Robotics-GR00T-Teleop-Sim`, with the letterbox bars cropped. The `lw_*.mp4` clips are whole episodes cut from `LightwheelAI/Lightwheel-Tasks-G1-WBC` with HTTP range requests, using the episode boundaries in its `meta/episodes` parquet. The `mimicdroid_*.mp4` clips are the simulation rollouts on the MimicDroid project page (`static/videos/sim_evals/`), cropped to the wide view. The `m3bench_*.mp4` clips are cut from the benchmark's own head-camera videos in `ByteDance-Seed/M3-Bench` on Hugging Face (CC BY-NC-SA 4.0): the hero is `kitchen_03` 1:05–1:40 in real time with its audio, up to the first question; `m3bench_scenes.mp4` is 3 s from one video of each of the seven room types. M3-Bench-robot is question answering, not control, so its tab shows the answer loop in place of an action vector; the question examples and the `kitchen_03` timeline come from `data/annotations/robot.json` in the M3-Agent repo. `navqa_coda16.mp4` is CODa's own sped-up clip of sequence 16 (one of NaVQA's seven drives) from amrl.cs.utexas.edu/coda, with CODa's 3D box labels burned in; `navqa_remembr_chips.mp4` is cut from the ReMEmbR project page's Nova Carter demo (`static/video/demo.mp4`, 0:36–0:56). The NaVQA question examples and the sequence 16 timeline come from `remembr/data/navqa/data.csv`; the SOTA table is STaR's re-run (arXiv 2602.09255). `robocasa_ai_textures.mp4` is from robocasa.ai; `robocasa_turn_on_microwave.mp4` and `robocasa_prepare_coffee.mp4` are re-encoded from `assets/`. Grid clips are sped up to fit and each tile freezes on its last frame.

Each benchmark tab also has a **State of the art** table, and the controller conventions (step sizes, rotation format, frame, gripper sign) were checked against each project's default configs. Deep links: `#egogym`, `#libero`, `#liberoplus`, `#lwrobocasa`, `#m3bench`, `#metaworld`, `#mikasa`, `#mimicdroid`, `#navqa`, `#rlbench`, `#robocasa`, `#gr1`, `#rckitchen`, `#robocasa365`, `#robotwin`, `#vlabench`. `#robocasa` used to open the RoboCasa365 content; that now lives at `#robocasa365`.

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
