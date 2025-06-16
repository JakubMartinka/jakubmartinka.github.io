---
layout: page
title: A Descriptor Is All You Need: Accurate Machine Learning of Nonadiabatic Coupling Vectors
description: with background image
img: assets/img/diayn2.png
importance: 2
category: research
related_publications: true
---

For nearly a century, quantum mechanics has provided the foundation for describing molecular systems and simulating photophysical and photochemical processes. A key part of these simulations involves modeling how molecules transition between excited states—often through conical intersections—using methods like Tully’s fewest-switches surface hopping (FSSH).

FSSH is a popular approach, but it’s computationally demanding. Running accurate simulations typically requires hundreds of thousands of quantum chemistry calculations, limiting the size of systems and timescales that can be studied.

Machine learning (ML) offers a promising solution. By training models to predict critical quantities like energies, gradients, and couplings, ML can bypass the need for costly calculations. While ML has already sped up predictions of energies and gradients, accurately modeling nonadiabatic couplings (NACs)—which are essential for determining hopping events in FSSH—remains a challenge. NACs are sensitive, vectorial quantities that behave unpredictably near avoided crossings.

Our work introduces a new ML framework that combines gradient-difference descriptors and phase correction to deliver highly accurate NAC predictions. This enables fast, fully ML-driven FSSH simulations, as we demonstrate on the classic photochemical system fulvene.

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
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>

For more info, check out the preprint: {% cite Martinka2025 %}.

{% raw %}

{% endraw %}
