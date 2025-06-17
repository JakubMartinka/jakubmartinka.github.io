---
layout: page
title: "Photodissociation of vinyl bromide: a nonadiabatic molecular dynamics and machine learning study"
description: another without an image
img: assets/img/pop_casscf.png
importance: 3
category: fun
---

In this project, we investigated photodissociation of vinyl bromide and the ability of machine learning (ML) to accelerate nonadiabatic molecular dynamics (NAMD) simulations. Firstly we benchmarked electronic structure methods 

\begin{table}
\centering
\caption*{Vertical excitation energies in eV of the chosen methods ADC(2) and CASSCF(8,6), experimental values and benchmark calculations of the EOM-CCSD method}
    \begin{tabular}{l@{\hspace{1cm}}c@{\hspace{1cm}}c@{\hspace{1cm}}c@{\hspace{1cm}}c}
    \toprule
        State  & Exp.$^a$ & ADC(2) & CASSCF(8,6) & EOM-CCSD \\
    \midrule                                                        
        $T_1$ &  ---  & 4,37 & 4,20 & 4,36 \\    
        $T_2$ &  ---  & 5,76 & 5,87 & ---  \\      
        $T_3$ &  ---  & 6,26 & 6,28 & ---  \\      
        $S_1$ &  5,70 & 6,25 & 6,31 & 6,39 \\
        $S_2$ &  6,50 & 6,69 & 7,15 & 7,24 \\
        $S_3$ &  ---  & 7,00 & 7,83 & 7,30 \\
        $T_4$ &  ---  & 6,99 & 7,80 & ---  \\
        $S_4$ &  ---  & 7,05 & 7,89 & 7,44 \\
        $T_5$ &  ---  & 7,56 & 8,04 & ---  \\
    \bottomrule
    \end{tabular}\vspace{.3cm}
    
    {\footnotesize $^a$ J. Schander, and B. R. Russell, \textit{J. Am. Chem. Soc.}, \textbf{98}, 6900--6904 (1976).}
\end{table}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images.
Say you wanted to write a little bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, _bled_ for your project, and then... you reveal its glory in the next row of images.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
