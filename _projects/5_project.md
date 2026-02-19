---
layout: page
title: Flexible Framework for Surface Hopping&#58; From Hybrid Schemes for Machine Learning to Benchmarkable Nonadiabatic Dynamics
description: <div><strong>&#35; machine learning &#35; nonadiabatic molecular dynamics &#35; surface hopping &#35; curvature-driven schemes </strong></div>
img: assets/img/ffssh.png
importance: 1
category: research
related_publications: true
---

Surface hopping is a family of simulation techniques that combines quantum description (i.e., solving time-independent Schrödinger equation) with a classical one (integrating Newton's equations of motion). The evolution of a nucleat wave-packet on excited-state potential energy surfaces (PESs) is approximated by an ensemble of classical trajectories propagating on a single PES, with the possiblity to "hop" between different surfaces. In this way, surface hopping schemes aim to describe photochemical relaxation through conical intersection. In this work, we present a flexible platform for performing such simulations while incorporating machine learning (ML) models, offering several practical advantages.

First, we implemented Tully's Fewest Switches Surface Hopping (FSSH) scheme together with the time-dependent Baeck-An (TDBA) approach. These implementations are now part of the MLatom package, which can be imported as a Python module. This allows users to conveniently combine diffeent quantum-chemical methods or ML models within a Python workflow. This is achieved by defining custom models with Python classes:

```python
class mlmodels():
    def __init__(self, energy_model, nac_model):
        self.e_model = energy_model
        self.nac_model = nac_model
    
    def predict(self,molecule=None, nstates=2, current_state=0, calculate_energy=True, 
                calculate_energy_gradients=True, calculate_nacv=True):
        molecule.electronic_states = [molecule.copy() for ii in range(nstates)]
        
        # MS-ANI energy + gradient
        self.e_model.predict(molecule=molecule, nstates=nstates, current_state=current_state, calculate_energy=calculate_energy, calculate_energy_gradients=calculate_energy_gradients)
        
        # Columbus NACs
        dE = molecule.electronic_states[1].energy - molecule.electronic_states[0].energy
        if dE * ml.constants.Hartree2eV < 0.5:
            self.nac_model.predict(molecule=molecule, nstates=nstates, current_state=current_state, calculate_energy=False, calculate_energy_gradients=False, calculate_nacv=True)
        else:
            molecule.nacv = np.zeros((nstates,nstates,*molecule.get_xyz_coordinates().shape))
```

This class example includes a condition that checks wheter energy difference is smaller than 0.5 eV, which significantly reduces the computational cost. Surface hopping can also be performed using only with quantum-chemical methods, provided they supply PESs, gradients and nonadiabatic couplings. The total energy conservation can be controlled by a stop function. Once the input files are prepared, simulations can be executed using the following code snippet:

```python
import mlatom as ml

# Stop function
def stop_function(mol, stop_state, **kwargs):
    if stop_state is None:
        stop_state = {}
        stop_state['etot_0'] = mol.total_energy
        stop_state['etot_prev'] = mol.total_energy
    if abs(stop_state['etot_0'] - mol.total_energy) * ml.constants.hartree2eV > 0.5:
        print("Terminating the trajectory: Etot drifted from t=0 more than 0.5 eV.")
        return True, stop_state
    else:
        if abs(stop_state['etot_prev'] - mol.total_energy) * ml.constants.hartree2eV > 0.5:
            print("Terminating the trajectory: Etot changed from previous step more than 0.5 eV.")
            return True, stop_state
        else:
            stop_state['etot_prev'] = mol.total_energy
            return False, stop_state

# Load initial condition
init_cond = ml.data.molecule.load('ic.json', format='json')

# Load MNDO
mndo = ml.models.methods(method='ODM2', read_keywords_from_file='mndokw')

# Run trajectory
dyn = ml.namd.surface_hopping_md(
    model=mndo,
    molecule=init_cond,
    time_step=0.5,
    time_step_tdse=0.025, # not needed for LZSH
    maximum_propagation_time=200,
    hopping_algorithm='FSSH', # 'TDBA' or 'LZSH'
    decoherence_model='SDM', # not needed for LZSH
    rescale_velocity_direction='nacv',
    # or 'gradient difference' or 'momentum'
    nstates=4,
    initial_state=3,
    stop_function=stop_function)

# Save trajectory in H5MD format to disk
dyn.molecular_trajectory.dump('traj.h5', format='h5md')
```

MLatom provides a wide range of interfaces to both quantum-chemical methods and ML models. Consequently, even when NACs are unavailable, so-called curvature-driven schemes can be employed. These either estimate hopping probability (as in Landau-Zener surface hopping, LZSH) or approximate time-derivative couplings (as in TDBA) based on the curvature of the PESs.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/populations_fulvene_traj.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

The resulting trajectories can be stored in the binary H5MD format and analyzed using built-in tools. This accelerate development and benchmarking. This following code snippet demonstrates how to load a trajectory and call the `plot_trajs()` function to analyze it by plotting selected geometrical parameters along with other electronic properties:
```python
import mlatom as ml

traj = ml.data.molecular_trajectory()
traj.load('traj.h5', format='h5md')

ml.namd.plot_trajs(
    trajectories=[traj],
    geom_params=[[0, 1], [0, 1, 4], [3, 1, 0, 5]],
    show_tdc=False,
    only_energy_params=False,
    filename=None
    )
```

The resulting plot is shown below. Individual subplots can be selected to closely inspect regions of interest.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/analysis_nacs_traj_0.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

For detailed information, check out the paper: {% cite Martinka2025a %} or GitHub repository associated with this work: <a href="https://github.com/JakubMartinka/FSSH-in-MLatom">FSSH-in-MLatom</a>. All simulations were carried out in <a href="http://mlatom.com/">MLatom</a>.

{% raw %}

{% endraw %}
