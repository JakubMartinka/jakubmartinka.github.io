---
layout: page
title: A simple approach to rotationally invariant machine learning of a vector quantity
description: <div><strong>&#35; machine learning &#35; vector rotation &#35; dipole moment &#35; polarizability</strong></div>
img: assets/img/rpr2.png
importance: 1
category: research
related_publications: true
---

Predicting potential energy surfaces with machine learning is now easier than ever. But once we move from scalar properties (like energy) to vectors or tensors (like dipole moments or polarizabilities), things get trickier. These properties must transform correctly under symmetry transformations - when a molecular geometry is rotated, the corresponding vector should rotate as well. While rotationally equivariant models can be used, we developed a simple and easy-to-use scheme (shown in the figure below), which we call rotate–predict–rotate (RPR).

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/rpr.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

The procedure consists of three steps:

<ol>
	<li>Rotate each molecular geometry into a canonical orientation defined by its tensor of inertia.</li>
	<li>Predict the vector or tensor property in that orientation using any machine learning model trained on data in the canonical orientation.</li>
	<li>Rotate the predicted properties back to the original molecular orientation.</li>
</ol>

To test the method, we studied 1,2-dithioethane, a molecule whose dipole moment and polarizability vary with torsional motion. We trained a kernel ridge regression model using the relative-to-equilibrium descriptor, based on DFT&#47;B3LYP&#47;aug-cc-pVTZ calculations, and sampled the configurational space by running ground-state molecular dynamics. The selected points for the test set are shown in black:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dihedral.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

The machine learning models produced accurate, rotationally covariant predictions of both properties across molecular dynamics trajectory frames. This was also achieved thanks to task-specific descriptor design. Because the approach relies only on elementary linear algebra, training is fast, prediction is inexpensive, and the models remain accurate, as shown in the scatter plots of dipole moment and polarizability components:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dipole.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/pol.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Scatterplots showing the DFT dipole moment (left) and polarizability components (right) of the test set consisting of 1200 points with respect to ML predictions of the models trained on 1000 points. The dipole moment components were learned with the Matérn kernel, while for polarizability, the Gaussian kernel performed better. In both cases, the RExyzCl descriptor was used.
</div>

For more information, check out the paper: {% cite Martinka2024 %}.

{% raw %}

{% endraw %}
