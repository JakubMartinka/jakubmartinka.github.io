---
layout: page
title: A Descriptor Is All You Need: Accurate Machine Learning of Nonadiabatic Coupling Vectors
description: with background image
img: assets/img/diayn2.png
importance: 1
category: research
related_publications: true
---

Machine learning (ML) has become a powerful tool in quantum chemistry, especially in molecular dynamics to predict potential energy surfaces.
Fitting scalar values (such as energies) with ML models does not need to account for vectorial properties - the predicted energy is rotationally invariant.
Models predicting vector or tensor properties, e.g. dipole moments or polarizability, need to satisfy rotational covariance.
It means that various rotations of molecule's coordinates, reguires correspondingly rotated vectors. 
Here we target the efficiency of such a goal, developing simple, but accurate and fast approach to machine learn vectorial properties.

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
