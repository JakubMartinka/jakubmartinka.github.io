---
layout: page
title: A descriptor is all you need&#58; accurate machine learning of nonadiabatic coupling vectors
description: <div><strong>&#35; machine learning &#35; nonadiabatic couplings &#35; descriptor &#35; surface hopping</strong></div>
img: assets/img/diayn2.png
importance: 1
category: research
related_publications: true
---

Machine Learning (ML) has achieved remarkable success in accelerating computer simulations, particularly for molecular dynamics of systems in their electronic ground state. Once excited states are involed in the processes of interest, however, it becomes necessary to fit all relevant adiabatic potential energy surfaces (PESs). While this already representing a significant challenge, it is also necessary to fit non-adiabatic couplings defined as

$$
\mathbf{h}_{ij} = \langle\Psi_i|\nabla_{\mathbf{R}}|\Psi_j\rangle,
$$

which govern transitions between states, for example in trajectory surface hopping schemes. Although robust protocols have been developed to accurately fit PESs, predicting NACs remains far from straightforward. NACs are vectorial properties, that depend on the molecular orientation. Additionaly, they diverge when two PESs approach each other, and the training set must be phase-corrected, since NACs are defined for pairs of electronic states and have an arbitraty sign.

In this work, we make the fitting of NACs possible by introducing NAC-specific descriptor. A descriptor is an input to the ML model that represents molecular structure or corresponding properties. The overall workflow is shown in the following figure.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/chart.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

The training set was generated using a previously developed acrive learning scheme. The resulting data set was phase-corrected using a newly developed iterative procedure. We then performed a benchmark of descriptors, which demonstrated that a physically motivated gradient difference is an excellent choice, leading to the most accurate fits. Combined with multi-state ANI (MS-ANI) models for PESs, this approach enabled simulations of the first excited-state decay of fulvene (see figure below).

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/populations_fulvene.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

For detailed information, check out the paper: {% cite Martinka2025 %}. All simulations were carried out in <a href="http://mlatom.com/">MLatom</a>.

{% raw %}

{% endraw %}
