This repository contains programs for all sampled 15 experiments in our
comparative evaluation. 
Below, we provide the titles for all papers included in
the evaluation.
We use the abbreviated
names as for file names for consistency across tools. 

1. *ARTiST: Automated Text Simplification for Task Guidance in Augmented
   Reality* (artist). DOI: https://dl.acm.org/doi/pdf/10.1145/3613904.3642772.

2. *ARTiST: Automated Text Simplification for Task Guidance in Augmented Reality* (artist2)
DOI: https://dl.acm.org/doi/pdf/10.1145/3613904.3642772.

3. *Don’t Just Tell Me, Ask Me: AI Systems that Intelligently Frame
Explanations as Questions Improve Human Logical Discernment
Accuracy over Causal AI explanations* (dont_ask_just_tell). DOI:
https://dl.acm.org/doi/pdf/10.1145/3544548.3580672.

4. *MouseRing: Always-available Touchpad Interaction with IMU
Rings* (mousering). DOI: https://dl.acm.org/doi/pdf/10.1145/3613904.3642225


5. *MouseRing: Always-available Touchpad Interaction with IMU
Rings* (mousering2). DOI: https://dl.acm.org/doi/pdf/10.1145/3613904.3642225

6. *OK Google, Let’s Learn: Using Voice User Interfaces for Informal
Self-Regulated Learning of Health Topics among Younger and
Older Adults* (ok_google). DOI:
https://dl.acm.org/doi/pdf/10.1145/3544548.3581507

7. *Understanding Perception of Human Augmentation: A
Mixed-Method Study* (perception). DOI:
https://dl.acm.org/doi/pdf/10.1145/3544548.3581485.

8. *Rambler: Supporting Writing With Speech via LLM-Assisted Gist
Manipulation* (rambler). DOI:
https://dl.acm.org/doi/pdf/10.1145/3613904.3642217. 

9. *When Recommender Systems Snoop into Social Media, Users
Trust them Less for Health Advice* (recommender). DOI:
https://dl.acm.org/doi/pdf/10.1145/3544548.3581123.

10. *Seated-WIP: Enabling Walking-in-Place Locomotion for
Stationary Chairs in Confined Spaces* (seated_wip). DOI:
https://dl.acm.org/doi/pdf/10.1145/3613904.3642395.

11. *Shaping Compliance: Inducing Haptic Illusion of Compliance in
Diferent Shapes with Electrotactile Grains* (shaping_compliance). DOI:
https://dl.acm.org/doi/pdf/10.1145/3613904.3641907.

12. *Shaping Compliance: Inducing Haptic Illusion of Compliance in
Diferent Shapes with Electrotactile Grains* (shaping_compliance2). DOI:
https://dl.acm.org/doi/pdf/10.1145/3613904.3641907.

13. *Silver-Tongued and Sundry:
Exploring Intersectional Pronouns with ChatGPT* (silver). DOI:
https://dl.acm.org/doi/pdf/10.1145/3613904.3642303.

14. *Skinergy: Machine-Embroidered Silicone-Textile Composites as
On-Skin Self-Powered Input Sensors* (skinergy). DOI:
https://dl.acm.org/doi/pdf/10.1145/3586183.3606729.

15. *Sweating the Details: Emotion Recognition and the Influence of
Physical Exertion in Virtual Reality Exergaming* (sweating_details). DOI: https://dl.acm.org/doi/pdf/10.1145/3613904.3642611.
## Reproducing the outputs

- PLanet: `PYTHON=<python with planet-lang importable> ./collect_program_output.sh`
  writes `Planet/outputs/<program>.py.out` and prints each program's wall time.
  The committed outputs come from planet-lang commit 810b45c
  (https://github.com/ucla-cdl/planet-lang) with Python 3.12 and z3 4.13.3.
- edibble: `Rscript edibble/<program>.R > edibble/<program>.R.out` (edibble 1.1.1, R 4.4.2).
- Touchstone: `NO_COLOR=1 node <touchstone-language>/dist/src/run_generator.js 12 touchstone/<program>.tsl`
  with the generator from https://github.com/ZPAC-UZH/touchstone-language. `undefined`
  means the generator does not support the program.

## Updates, 2026-10-11

A cross-check of all 15 programs against the source papers found two whose
trial structure contradicted explicit statements in the papers:

- **skinergy**: Yu et al. (UIST 2023, Sec. 7.1.2) collected "a randomized order of
  ten trials of eleven gestures", 110 recordings per participant. The programs now
  encode ten repetitions of all eleven gestures (PLanet: a ten-block repetition
  around the within-subjects design; edibble: ten blocks of eleven trials per
  participant; Touchstone: `Random(..., 10)`). Touchstone's generator yields 100
  trials per participant with unequal gesture counts, so Touchstone still does not
  express the design.
- **artist2** (ARTiST Exp 2): Wu et al. (CHI 2024, Sec. 5.4.1) ran "five
  condition-subtask pairs or 15 trials" per participant, three steps per pair.
  The PLanet program now nests the three-trial block inside the crossed design
  (25 plans of 15 trials). edibble already had `replication = nested_in(unit, 3)`.
  Touchstone takes `Serial(Latin(Subtask, 3))` on the inner block; the generator
  cannot cross two Latin squares and still returns `undefined`.

All 15 PLanet programs are identical to `src/eval_examples` in planet-lang at
commit 810b45c, and all 15 PLanet outputs were regenerated with that version.
