---
layout: page
title: Toward Machine Learning Enhancement of Accelerated Surface Hopping with Scaled Spin&#8211;Orbit Couplings
description: <div><strong>&#35; machine learning &#35; accelerated surface hopping &#35; intersystem crossing &#35; spin-orbit coupling</strong></div>
img: assets/img/toc.png
importance: 1
category: publication
permalink: /publications/accelerated-surface-hopping/
related_publications: true
---

Surface hopping simulations are well suited for ultrafast processes, such as internal conversion through conical intersections, which typically happen within hundreds of femtoseconds. Intersystem crossing (ISC), the transition between states of different spin multiplicity, is a different story. When the spin–orbit couplings (SOCs) driving it are small, ISC can take hundreds of picoseconds, which is far beyond what we can afford to simulate with high-level electronic structure methods.

If the goal is only to estimate the time constant, there is a trick: the SOCs can be artificially scaled by a constant $$\alpha > 1$$ so that ISC happens within the simulated time window. Running several ensembles of trajectories with different scaling factors and extrapolating back to $$\alpha = 1$$ then gives the actual time constant. The catch is that every scaling factor requires its own ensemble of trajectories, which quickly becomes expensive.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/toc.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

In this work, we look at how reliable such an accelerated scheme is, using silaethylene (CH<sub>2</sub>SiH<sub>2</sub>) as a test case. We trained machine learning (ML) models for the potential energy surfaces, nonadiabatic couplings and SOCs, building on our <a href="{{ '/publications/nac-descriptor/' | relative_url }}">NAC descriptor</a> and <a href="{{ '/publications/rotationally-invariant-ml/' | relative_url }}">rotate-predict-rotate</a> approaches, and used them to explore where ML can make the whole procedure more robust.

For detailed information, check out the preprint: {% cite Martinka2026a %}. The ML part of this work was carried out in <a href="http://mlatom.com/">MLatom</a>.
