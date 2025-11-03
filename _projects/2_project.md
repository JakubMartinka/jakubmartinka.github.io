---
layout: page
title: A Descriptor Is All You Need: Accurate Machine Learning of Nonadiabatic Coupling Vectors
description: <div><strong>&#35; machine learning &#35; nonadiabatic couplings &#35; descriptor &#35; surface hopping</strong></div>
img: assets/img/diayn2.png
importance: 1
category: research
related_publications: true
---

Nonadiabatic couplings (NACs) are the essential properties in photochemical simulations, particularly in . They dictate how molecules jump between electronic states during light-driven processes—key for understanding everything from vision to solar energy conversion. Traditionally, simulating these transitions requires Tully’s fewest-switches surface hopping (FSSH), a powerful but computationally intensive method. Running FSSH trajectories demands hundreds of thousands of expensive quantum chemical calculations, severely limiting the size of molecules and the number of trajectories we can study.
Machine learning (ML) promises to change this—but predicting NACs is far from straightforward. Unlike energies or forces, NACs are vectorial, double-valued, and can spike near conical intersections (CIs), where two electronic states cross. Additionally, the arbitrary phase of quantum wave functions can flip NAC vectors, introducing inconsistencies that derail ML training.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/chart.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/desc_rmse.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/pol.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

For more info, check out the preprint: {% cite Martinka2025 %}.

{% raw %}

{% endraw %}
