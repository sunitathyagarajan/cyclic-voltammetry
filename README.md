# Cyclic Voltammetry Primer

An interactive pre-lab module that introduces cyclic voltammetry (CV) to students before their lab experiment.

**Website:** https://sunitathyagarajan.github.io/cyclic-voltammetry/

## What it covers

0. **Introduction**: what electrochemical reactions are (Daniell cell, ferrocene), how potential, current and charge map onto free energy, rate and amount, and how potentiometry, voltammetry and cyclic voltammetry each give quantitative data, with a side-by-side comparison table.
1. **The experiment**: the three-electrode cell, supporting electrolyte, degassing, what the current measures (a reaction rate), what positive (anodic) and negative (cathodic) current mean, and the IUPAC versus US sign conventions.
2. **Thermodynamics**: ΔG° = −nFE°, the Nernst equation, formal and half-wave potentials, and a step-through view of concentration profiles that shows why a CV has peaks.
3. **Reversibility**: Butler–Volmer kinetics, the Matsuda–Ayabe parameter, and example CVs of ferrocene (reversible), potassium ferricyanide (quasi-reversible) and ascorbic acid (irreversible).
4. **Two electrons**: a worked example of a two-step oxidation and reduction (tetrathiafulvalene), and an explorer showing how two one-electron waves merge into a single two-electron wave.
5. **Concentration**: the Randles–Sevcik equation and a calibration-line explorer.
6. **Scan rate**: peak current versus √v and peak potential versus log v for each compound, plus an adsorbed-versus-diffusing explorer (i<sub>p</sub> ∝ v versus i<sub>p</sub> ∝ √v).
7. **Quiz**: ten plot-based questions with explanations.

Every curve is computed in the browser by a finite-difference simulation of diffusion with Butler–Volmer electron transfer. There is no server and nothing to install.

## Editing the page

`cv-primer.html` is the source file. `index.html` is generated from it, so don't edit `index.html` directly.

After changing `cv-primer.html`, rebuild and commit both files:

```sh
sh build.sh
```

`build.sh` adds the standard HTML document wrapper plus the page description, link-preview tags and site icon. `cv-primer.html` leaves the wrapper out because the claude.ai artifact version is published from that file.

## Publishing

The site is served by GitHub Pages from the `main` branch, root folder (Settings → Pages). The empty `.nojekyll` file tells GitHub Pages to serve the files as they are, without running Jekyll.
