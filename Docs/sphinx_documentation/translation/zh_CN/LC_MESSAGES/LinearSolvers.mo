��    �      $              ,  �  -  *  �	  �     _   �  u   [  ^  �  g   0  	  �  W  �  y  �  ?   t  G   �  3   �  n   0  P   �  A   �  V   2  �   �  v   Q  1   �  \   �  p   W  w   �  C   @  C   �  �   �  w   �  e   '  8   �  O   �  K     N   b  E   �  L   �  K   D  M   �  K   �  n   *  o   �  Z   	  2   d  j   �  ]     ]   `  �   �  l  Q  N  �   v   "  �   �"  =   #    R#    l$     y%     �%  +   �%  �  �%     �'  �   �'  �   !(     �(  =   �(     7)     K)  X   \)  �   �)  g   �*  U    +  �  V+  T   �,  �   <-  0  �-  s  �.  �   b0  u  �0  �   _2  �   3  �   4      �4     5  �  /5  b  �6  �   )8  |   9  �   �9  {   �:  
   ;  �  ;  a   �<  �  I=     �?  �  �?  `  �A  i   �B  L   cC  B   �C  �   �C  �   �D  (  mE  d   �F  l   �F  o  hG  �  �H  <   �K  V   �K  �   *L  T   M  �   ZM  ~  N  6   �O  8   �O  �   P  �   �P  �   MQ    �Q  q   S  6   wS  '  �S  �   �T  ;  WU  &   �V  ;   �V  k   �V  �   bW  �  RX  �  �Y  i  �\  �   �_  �   �`  v  �a  {  �b  �   vd  �   he  ]   Bf  x   �f  k  g  s   �h  �   �h  =  �i  o  3k  B   �l  G   �l  <   .m  �   km  K   �m  8   >n  q   wn  �   �n  �   �o  4   ,p  F   ap  t   �p  u   q  L   �q  \   �q  �   =r  o   s  a   �s  9   �s  [   t  W   xt  Y   �t  S   *u  X   ~u  W   �u  Y   /v  X   �v  }   �v  |   `w  Q   �w  4   /x  c   dx  Z   �x  `   #y  �   �y  c  $z  Q  �{  f   �|  �   A}  H   �}  	  ~         �     5�  3   B�  s  v�     �  �   �  �   u�     �  |   �     ��     ��  R   ��  �    �  e   ф  [   7�  }  ��  N   �  x   `�  
  ه  f  �  ~   K�  R  ʊ  �   �  �   ��  �   ��     q�     ��  }  ��  �  �  �   ̑  �   ��  �   �  |   ߓ     \�  �  c�  m   �  �  U�     ޘ  z  �  4  f�  O   ��  ?   �  5   +�  �   a�  �   �  	  ��  Q   ��  W   ��  i  P�  <  ��  &   ��  Q   �  �   p�  N   �  �   k�  X  �  3   n�  3   ��  �   ֦  �   q�  �   &�  �   ��  b   ��  2   �     C�  M   D�    ��  *   ��  ,   Ĭ  [   �  �   M�  ;  %�  �  a�    R�  �   j�  �   �   ( (\eta u_x)_x + (\eta u_y)_y + (\eta u_z)_z ) + ( (\eta u_x)_x + (\eta v_x)_y + (\eta w_x)_z ) +  ( (\kappa - \frac{2}{3} \eta) (u_x+v_y+w_z) )_x

( (\eta v_x)_x + (\eta v_y)_y + (\eta v_z)_z ) + ( (\eta u_y)_x + (\eta v_y)_y + (\eta w_y)_z ) +  ( (\kappa - \frac{2}{3} \eta) (u_x+v_y+w_z) )_y

( (\eta w_x)_x + (\eta w_y)_y + (\eta w_z)_z ) + ( (\eta u_z)_x + (\eta v_z)_y + (\eta w_z)_z ) +  ( (\kappa - \frac{2}{3} \eta) (u_x+v_y+w_z) )_z ( (\frac{4}{3} \eta + \kappa) u_x)_x + (              \eta           u_y)_y + (\eta u_z)_z

              (\eta           v_x)_x + ( (\frac{4}{3} \eta + \kappa) v_y)_y + (\eta v_z)_z

 (\eta w_x)_x                        + (              \eta           w_y)_y + ( (\frac{4}{3} \eta + \kappa) w_z)_z ( (\kappa - \frac{2}{3} \eta) (v_y + w_z) )_x + (\eta v_x)_y  + (\eta w_x)_z

(\eta u_y)_x + ( (\kappa - \frac{2}{3} \eta) (u_x + w_z) )_y  + (\eta w_y)_z

(\eta u_z)_x + (\eta v_z)_y - ( (\kappa - \frac{2}{3} \eta) (u_x + v_y) )_z (Note: only operators of the form :math:`D:\mathbb{R}^n\to\mathbb{R}^n` are currently allowed.) 1) For any type of solver, we first need to set physical domain boundary types via the :cpp:`MLLinOp` member function 2) Cell-centered solvers only: if we want to do a linear solve where the boundary conditions on the coarsest AMR level of the solve come from a coarser level (e.g. the base AMR level of the solve is > 0 and does not cover the entire domain), we must explicitly provide the coarser data.  Boundary conditions from a coarser level are always Dirichlet. 3) Cell-centered solvers only: before the solve one must always call the :cpp:`MLLinOp` member function :cpp:`LPInfo::setAgglomeration(bool)` (by default true) can be used continue to coarsen the multigrid by copying what would have been the bottom solver to a new :cpp:`MultiFab` with a new :cpp:`BoxArray` with fewer, larger grids, to allow for additional coarsening. :cpp:`LPInfo::setConsolidation(bool)` (by default true) can be used continue to transfer a multigrid problem to fewer MPI ranks. There are more setting such as :cpp:`LPInfo::setConsolidationGridSize(int)`, :cpp:`LPInfo::setConsolidationRatio(int)`, and :cpp:`LPInfo::setConsolidationStrategy(int)`, to give control over how this process works. :cpp:`LPInfo::setMaxCoarseningLevel(int)` can be used to control the maximal number of multigrid levels.  We usually should not call this function.  However, we sometimes build the solver to simply apply the operator (e.g., :math:`L(\phi)`) without needing to solve the system. We can do something as follows to avoid the cost of building coarsened operators for the multigrid. :cpp:`LinOpBCType::Dirichlet` for Dirichlet boundary condition. :cpp:`LinOpBCType::Neumann` for homogeneous Neumann boundary condition. :cpp:`LinOpBCType::Periodic` for periodic boundary. :cpp:`LinOpBCType::Robin` for Robin boundary conditions, :math:`a\phi + b\frac{\partial\phi}{\partial n} = f`. :cpp:`LinOpBCType::inhomogNeumann` for inhomogeneous Neumann boundary condition. :cpp:`LinOpBCType::reflect_odd` for reflection with sign changed. :cpp:`MLABecLaplacian` for cell-centered canonical form (equation :eq:`eqn::abeclap`). :cpp:`MLLinOp::setVerbose(int)`, :cpp:`MLMG::setVerbose(int)` and :cpp:`MLMG:setBottomVerbose(int)` control the verbosity of the linear operator, multigrid solver and the bottom solver, respectively. :cpp:`MLMG::BottomSolver::bicgcg`: Start with bicgstab. Switch to cg if bicgstab fails.  The matrix must be symmetric. :cpp:`MLMG::BottomSolver::bicgstab`: The default. :cpp:`MLMG::BottomSolver::cg`: The conjugate gradient method.  The matrix must be symmetric. :cpp:`MLMG::BottomSolver::cgbicg`: Start with cg. Switch to bicgstab if cg fails.  The matrix must be symmetric. :cpp:`MLMG::BottomSolver::hypre`: One of the solvers available through hypre; see the section below on External Solvers :cpp:`MLMG::BottomSolver::petsc`: Currently for cell-centered only. :cpp:`MLMG::BottomSolver::smoother`: Smoother such as Gauss-Seidel. :cpp:`MLMG::setThrowException(bool)` controls whether multigrid failure results in aborting (default) or throwing an exception, whereby control will return to the calling application. The application code must catch the exception: :cpp:`MLNodeLaplacian` for nodal variable coefficient Poisson's equation :math:`\nabla \cdot (\sigma \nabla \phi) = f`. :cpp:`MLPoisson` for cell-centered constant coefficient Poisson's equation :math:`\nabla^2 \phi = f`. :cpp:`hypre.adjust_singular_matrix`:   Default is false. :cpp:`hypre.bamg_coarsen_type`: Default 6.  See `HYPRE_BoomerAMGSetCoarsenType` :cpp:`hypre.bamg_cycle_type`: Default 1.  See `HYPRE_BoomerAMGSetCycleType` :cpp:`hypre.bamg_interp_type`:  Default 0.  See `HYPRE_BoomerAMGSetInterpType` :cpp:`hypre.bamg_logging`: Default 0. See `HYPRE_BoomerAMGSetLogging` :cpp:`hypre.bamg_max_levels`: Default 20.  See `HYPRE_BoomerAMGSetMaxLevels` :cpp:`hypre.bamg_num_sweeps`: Default 2.  See `HYPRE_BoomerAMGSetNumSweeps` :cpp:`hypre.bamg_relax_order`: Default 1.  See `HYPRE_BoomerAMGSetRelaxOrder` :cpp:`hypre.bamg_relax_type`: Default 6.  See `HYPRE_BoomerAMGSetRelaxType` :cpp:`hypre.bamg_strong_threshold`: Default 0.25 for 2D, 0.57 for 3D.  See `HYPRE_BoomerAMGSetStrongThreshold` :cpp:`hypre.bamg_verbose`: verbosity of BoomerAMG preconditioner. Default 0. See `HYPRE_BoomerAMGSetPrintLevel` :cpp:`hypre.hypre_preconditioner`: Default is none;  otherwise the type must be specified. :cpp:`hypre.hypre_solver`:   Default is BoomerAMG. :cpp:`hypre.overwrite_existing_matrix_files`: Default false.   Option to over-write existing matrix files. :cpp:`hypre.recompute_preconditioner`: Default true.  Option to recompute the preconditioner. :cpp:`hypre.write_matrix_files`: Default false.   Option to write out matrix into text files. AMReX can also use `PETSc <https://www.mcs.anl.gov/petsc/>`_ as a bottom solver for cell-centered problems. To build PETSc, follow the next steps: AMReX provides interfaces to the `hypre <https://computing.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods>`_ preconditioners and solvers, including BoomerAMG, GMRES (all variants), PCG, and BICGStab as solvers, and BoomerAMG and Euclid as preconditioners.  These can be called as as bottom solvers for both cell-centered and node-based problems. AMReX supports multi-level solvers for use with embedded boundaries. These include 1) cell-centered solvers with homogeneous Neumann, homogeneous Dirichlet, or inhomogeneous Dirichlet boundary conditions on the EB faces, and 2) nodal solvers with homogeneous Neumann boundary conditions, or inflow velocity conditions on the EB faces. After boundary conditions and coefficients are prescribed, the linear operator is ready for an MLMG object like below. After the linear operator is built, we need to set up boundary conditions.  This will be discussed later in section :ref:`sec:linearsolver:bc`. After the solver returns successfully, if needed, we can call Application codes that solve the Navier-Stokes equations need to evaluate the viscous term;  solving for this term implicitly requires a multi-component solve with cross terms.  Because this is a commonly used motif, we provide a tensor solve for cell-centered velocity components. At the bottom of the multigrid cycles, we use a ``bottom solver`` which may be different than the relaxation used at the other levels. The default bottom solver is the biconjugate gradient stabilized method, but can easily be changed with the :cpp:`MLMG` member method Available choices are Boundary Conditions Boundary Stencils for Cell-Centered Solvers By default the AMReX linear solver code always tries to geometrically coarsen the problem as much as possible.  However, as we have mentioned, we can call :cpp:`setMaxCoarseningLevel(0)` on the :cpp:`LPInfo` object passed to the constructor of a linear operator to disable the coarsening completely.  In that case the bottom solver is solving the residual correction form of the original problem. To build Hypre, follow the next steps: Coefficients Consider a velocity field :math:`U = (u,v,w)` with all components co-located on cell centers.  The viscous term can be written in vector form as Currently there are options to define the face-based coefficients on face centers vs face centroids, and to interpret the solution variable as being defined on cell centers vs cell centroids. Curvilinear Coordinates D(\mathbf{\phi})_i = \sum_{i=1}^N \alpha_{ij} \nabla^2 \phi_j Embedded Boundaries External Solvers For :cpp:`MLNodeLaplacian`, one can set a variable :cpp:`sigma` with the member function For Robin boundary conditions, the ghost cells in ``MultiFab* robinbc_a``, ``MultiFab* robinbc_b``, and ``MultiFab* robinbc_f`` store the numerical values in the condition, :math:`a\phi + b\frac{\partial\phi}{\partial n} = f`. For the case where :math:`\alpha` and/or :math:`\beta` are scalar constants, there is the option to use For the general case where :math:`\alpha` and :math:`\beta` are scalar fields, we use Here :cpp:`const MultiFab* crse` contains the Dirichlet boundary values at the coarse resolution, and :cpp:`int crse_ratio` (e.g., 2) is the refinement ratio between the coarsest solver level and the AMR level below it.  The MultiFab :cpp:`crse` does not need to have ghost cells itself. If the coarse grid bc's for the solve are identically zero, :cpp:`nullptr` can be passed instead of :cpp:`crse`. Here :math:`\eta` is the dynamic viscosity and :math:`\kappa` is the bulk viscosity. Here, setting a constant :cpp:`sigma` alters the internal behavior of the solver making it more efficient for this special case. If it is built with Hypre support, AMReX initializes Hypre by default in `amrex::Initialize`.  If it is built with CUDA, AMReX will also set up Hypre to run on device by default.  The user can choose to disable the Hypre initialization by AMReX with :cpp:`ParmParse` parameter ``amrex.init_hypre=[0|1]``. If the boundary condition is Dirichlet the ghost cells outside the domain boundary of ``levelbcdata`` must hold the value of the solution at the domain boundary; if the boundary condition is Neumann those ghost cells must hold the value of the gradient of the solution normal to the boundary (e.g. it would hold dphi/dx on both the low and high faces in the x-direction). If the boundary conditions contain no inhomogeneous Dirichlet or Neumann boundaries, we can pass :cpp:`nullptr` instead of a MultiFab. If we want to supply an inhomogeneous Dirichlet or inhomogeneous Neumann boundary condition at the domain boundaries, we must supply those values in ``MultiFab* levelbcdata``, which must have at least one ghost cell. Note that the argument :cpp:`amrlev` is relative to the solve, not necessarily the full AMR hierarchy; amrlev = 0 refers to the coarsest level of the solve. Implementing a multi-component *node-based* operator is slightly different. A MC nodal operator must specify that the reflux-free coarse/fine strategy is being used by the solver. It should be emphasized that the data in ``levelbcdata`` for Dirichlet or Neumann boundaries are assumed to be exactly on the face of the physical domain; storing these values in the ghost cell of a cell-centered array is a convenience of implementation. It takes :cpp:`Vectors` of :cpp:`Geometry`, :cpp:`BoxArray` and :cpp:`DistributionMapping`.  The arguments are :cpp:`Vectors` because MLMG can do multi-level composite solves.  If you are using it for single-level, you can do MLMG and Linear Operator Classes Multi-Component Operators Multi-Level Multi-Grid or ``MLMG`` is a class for solving the linear system using the geometric multigrid method.  The constructor of ``MLMG`` takes the reference to :cpp:`MLLinOp`, an abstract base class of various linear operator classes, :cpp:`MLABecLaplacian`, :cpp:`MLPoisson`, :cpp:`MLNodeLaplacian`, etc.  We choose the type of linear operator class according to the type the linear system to solve. Next, we consider the coefficients for equation :eq:`eqn::abeclap`. For :cpp:`MLPoisson`, there are no coefficients to set so nothing needs to be done. For :cpp:`MLABecLaplacian`, we need to call member functions :cpp:`setScalars`, :cpp:`setACoeffs`, and :cpp:`setBCoeffs`. The :cpp:`setScalars` function sets the scalar constants :math:`A` and :math:`B` Note that exceptions that are not caught are passed up the calling chain so that application codes using specialized solvers relying on MLMG can still catch the exception. For example, using AMReX-Hydro's :cpp:`NodalProjector` Note that this step, if needed, must be performed before the step below. The :cpp:`MLLinOp` member function for this step is Note, however, that the solver behavior is the same regardless of which functions you use to set the coefficients. These functions solely copy the constant value(s) to a MultiFab internal to ``MLMG`` and so no appreciable efficiency gains can be expected. Optional parameters can be set (see section :ref:`sec:linearsolver:pars`), and then we can use the ``MLMG`` member function Parameters Reflux-free coarse-fine boundary update. Level 2 ghost nodes (small dark blue) are interpolated from coarse boundary. Level 1 ghost nodes are updated during the relaxation along with all the other interior fine nodes. Coarse nodes (large blue) on the coarse/fine boundary are updated by restricting with interior nodes and the first level of ghost nodes. Coarse nodes underneath level 2 ghost nodes are not updated. The remaining coarse nodes are updates by restriction. See ``amrex-tutorials/ExampleCodes/LinearSolvers/MultiComponent`` for a complete working example. Some of the linear solvers support curvilinear coordinates including 1D spherical and 2d cylindrical :math:`(r,z)`.  In those cases, the divergence operator has extra metric terms.  If one does not want the solver to include the metric terms because they have been handled in other ways, one can turn them off with a setter function. For the cell-centered linear solvers `MLABecLaplacian` and `MLPoisson`, one can call :cpp:`setMetricTerm(bool)` with :cpp:`false` on the :cpp:`LPInfo` object passed to the constructor of linear operators. For the node-based `MLNodeLaplacian`, one can call :cpp:`setRZCorrection (bool)` with :cpp:`false` on the `MLNodeLaplacian` object. Tensor Solve The :cpp:`int amrlev` parameter should be zero for single-level solves.  For multi-level solves, each level needs to be provided with ``alpha`` and ``beta``, or ``sigma``.  For composite solves, :cpp:`amrlev` 0 will mean the lowest level for the solver, which is not necessarily the lowest level in the AMR hierarchy. This is so solves can be done on different sections of the AMR hierarchy, e.g. on AMR levels 3 to 5. The MC nodal operator can inherit from the ``MCNodeLinOp`` class. ``Fapply``, ``Fsmooth``, and ``Fflux`` must update level 1 ghost nodes that are inside the domain. `interpolation` and `restriction` can be implemented as usual. `reflux` is a straightforward restriction from fine to coarse, using level 1 ghost nodes for restriction as described above. The code below is an example of how to set up the solver to compute the viscous term `divtau` explicitly: The constructors of these linear operator classes are in the form like below The default boundary condition on EB faces is homogeneous Neumann. The default is for the face-based coefficients to be defined at face centers; to tell the that the face-based coefficients should be interpreted as living at face centroids, modify the setBCoeffs command to be The default is for the solution variable to be defined at cell centers; to tell the solver to interpret the solution variable as living at cell centroids, you must set The following parameter should be set to True if the problem to be solved has a singular matrix. In this case, the solution is only defined to within a constant.  Setting this parameter to True replaces one row in the matrix sent to hypre from AMReX by a row that sets the value at one cell to 0. The following parameters can be set in the inputs file to control the BoomerAMG solver specifically: The following parameters can be set in the inputs file to control the choice of preconditioner and smoother: The multigrid solver is an iterative solver.  The maximal number of iterations can be changed with :cpp:`MLMG::setMaxIter(int)`.  We can also do a fixed number of iterations with :cpp:`MLMG::setFixedIter(int)`.  By default, V-cycle is used.  We can use :cpp:`MLMG::setMaxFmgIter(int)` to control how many full multigrid cycles can be done before switching to V-cycle. The reflux-free method circumvents the need to implement a special ``reflux`` at the coarse-fine boundary. This is accomplished by using ghost nodes. Each AMR level must have 2 layers of ghost nodes. The second (outermost) layer of nodes is treated as constant by the relaxation, essentially acting as a Dirichlet boundary. The first layer of nodes is evolved using the relaxation, in the same manner as the rest of the solution. When the residual is restricted onto the coarse level (in ``reflux``) this allows the residual at the coarse-fine boundary to be interpolated using the first layer of ghost nodes. :numref:`fig::refluxfreecoarsefine` illustrates the how the coarse-fine update takes place. The supported BC types at the physical domain boundaries are The usage of this EB-specific class is essentially the same as :cpp:`MLABecLaplacian`. The user is referred to the `hypre <https://computing.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods>`_ Hypre Reference Manual for full details on the usage of the parameters described briefly above. There are many parameters that can be set.  Here we discuss some commonly used ones. This section discusses solving linear systems in which the solution variable :math:`\mathbf{\phi}` has multiple components. An example (implemented in the ``MultiComponent`` tutorial) might be: To implement a multi-component *cell-based* operator, inherit from the ``MLCellLinOp`` class. Override the ``getNComp`` function to return the number of components (``N``)that the operator will use. The solution and rhs fabs must also have at least one ghost node. ``Fapply``, ``Fsmooth``, ``Fflux`` must be implemented such that the solution and rhs fabs all have ``N`` components. To set homogeneous Dirichlet boundary conditions, call To set inhomogeneous Dirichlet boundary conditions, call To use PETSc, one must include ``amrex/Src/Extern/PETSc`` in the build system.  For an example of using PETSc, we refer the reader to the tutorial, `ABecLaplacian`_. To use a cell-centered solver with EB, one builds a linear operator :cpp:`MLEBABecLap` with :cpp:`EBFArrayBoxFactory` (instead of a :cpp:`MLABecLaplacian`) To use hypre, one must include ``amrex/Src/Extern/HYPRE`` in the build system. For examples of using hypre, we refer the reader to `ABecLaplacian`_ or `NodeTensorLap`_. We can use the solution array itself to hold these values; the values are copied to internal arrays and will not be over-written when the solution array itself is being updated by the solver. Note, however, that this call does not provide an initial guess for the solve. We evaluate the following terms from the above using the ``MLABecLaplacian`` and ``MLEBABecLaplacian`` operators; We have the option using the :cpp:`MLMG` member method We now discuss how to set up boundary conditions for linear operators. In the following, physical domain boundaries refer to the boundaries of the physical domain, whereas coarse/fine boundaries refer to the boundaries between AMR levels. The following steps must be followed in the exact order. \nabla \cdot (\eta \nabla U) + \nabla \cdot (\eta (\nabla U)^T ) + \nabla \cdot ( (\kappa - \frac{2}{3} \eta) (\nabla \cdot U) ) `MLABecLaplacian` and `MLPoisson` support both spherical and cylindrical coordinates, while `MLNodeLaplacian` supports only cylindrical at this time. Note that to use cylindrical coordinates with `MLNodeLaplacian`, the application code must scale ``sigma`` by the radial coordinate before calling :cpp:`setSigma()`. and in 3-d Cartesian component form as or a constant :cpp:`sigma` during declaration or definition the following cross-terms are evaluated separately using the ``MLTensorOp`` and ``MLEBTensorOp`` operators. to compute residual (i.e., :math:`f - L(\phi)`) given the solution and the right-hand side.  For cell-centered solvers, we can also call the following functions to compute gradient :math:`\nabla \phi` and fluxes :math:`-\beta \nabla \phi`. to let the compiler construct :cpp:`Vectors` for you.  Recall that the classes :cpp:`Vector`, :cpp:`Geometry`, :cpp:`BoxArray`, and :cpp:`DistributionMapping` are defined in chapter :ref:`Chap:Basics`.  There are two new classes that are optional parameters.  :cpp:`LPInfo` is a class for passing parameters.  :cpp:`FabFactory` is used in problems with embedded boundaries (chapter :ref:`Chap:EB`). to set the order of the cell-centered linear operator stencil at physical boundaries with Dirichlet boundary conditions and at coarse-fine boundaries.  In both of these cases, the boundary value is not defined at the center of the ghost cell. The order determines the number of interior cells that are used in the extrapolation of the boundary value from the cell face to the center of the ghost cell, where the extrapolated value is then used in the regular stencil.  For example, :cpp:`maxorder = 2` uses the boundary value and the first interior value to extrapolate to the ghost cell center; :cpp:`maxorder = 3` uses the boundary value and the first two interior values. to solve the problem given an initial guess and a right-hand side. Zero is a perfectly fine initial guess.  The two :cpp:`Reals` in the argument list are the targeted relative and absolute error tolerances. The relative error tolerance is hard-coded to be at least :math:`10^{-16}`. Given the linear system :math:`Ax=b`, the solver will terminate when the max-norm of the residual (:math:`b-Ax`) is less than :cpp:`std::max(a_tol_abs, a_tol_rel*max_norm)` where :cpp:`max_norm` is the max-norm of the rhs, :math:`b`, if the flag :cpp:`always_use_bnorm` is set to True or if the rhs max-norm is greater than or equal to the max-norm error of the initial guess, otherwise :cpp:`max_norm` is equal to the max-norm error of the initial guess.  Set the absolute tolerance to zero if one does not have a good value for it.  The return value of :cpp:`solve` is the max-norm error. where coeff can be a real number (i.e. the value is the same at every cell) or is the MultiFab holding the coefficient of the gradient at each cell with an EB face. where phi_on_eb is the MultiFab holding the Dirichlet values in every cut cell, and coeff again is a real number (i.e. the value is the same at every cell) or a MultiFab holding the coefficient of the gradient at each cell with an EB face. Project-Id-Version: amrex 23.00-dev
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-11-02 14:37+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: gpt-po v1.0.11
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.13.1
 (（ηuₓ)ₓ + (ηuᵧ)ᵧ + (ηu_z)ₓ) + ( (ηuₓ)ₓ + (ηvₓ)ᵧ + (ηwₓ)ₓ ) + ( (κ - 2/3η) (uₓ+vᵧ+w_z) )ₓ

( (ηvₓ)ₓ + (ηvᵧ)ᵧ + (ηv_z)ₓ ) + ( (ηuᵧ)ₓ + (ηvᵧ)ᵧ + (ηwᵧ)ₓ ) + ( (κ - 2/3η) (uₓ+vᵧ+w_z) )ᵧ

( (ηwₓ)ₓ + (ηwᵧ)ᵧ + (ηw_z)ₓ ) + ( (ηu_z)ₓ + (ηv_z)ᵧ + (ηw_z)ₓ ) + ( (κ - 2/3η) (uₓ+vᵧ+w_z) )ₓ （（\frac{4}{3} \eta + \kappa) u_x）_x + （\eta u_y）_y + （\eta u_z）_z

（\eta v_x）_x + （（\frac{4}{3} \eta + \kappa) v_y）_y + （\eta v_z）_z

（\eta w_x）_x + （\eta w_y）_y + （（\frac{4}{3} \eta + \kappa) w_z）_z （（κ - 2/3η）（v_y + w_z））_x + （ηv_x）_y + （ηw_x）_z

（ηu_y）_x + （（κ - 2/3η）（u_x + w_z））_y + （ηw_y）_z

（ηu_z）_x + （ηv_z）_y - （（κ - 2/3η）（u_x + v_y））_z （注意：目前只允许形式为 :math:`D:\mathbb{R}^n\to\mathbb{R}^n` 的运算符。） 1) 对于任何类型的求解器，我们首先需要通过`:cpp:`MLLinOp`成员函数来设置物理域边界类型。 2) 仅限于以单元为中心的求解器：如果我们想要进行线性求解，其中求解的最粗糙的 AMR 等级的边界条件来自于一个更粗糙的等级（例如，求解的基本 AMR 等级大于 0，且未覆盖整个域），我们必须明确提供更粗糙的数据。来自更粗糙等级的边界条件始终为迪里切特边界条件。 3) 仅适用于以单元为中心的求解器：在求解之前，必须始终调用 :cpp:`MLLinOp` 成员函数。 :cpp:`LPInfo::setAgglomeration(bool)`（默认为true）可以用来继续通过将原本作为底层求解器的内容复制到一个具有较少、较大网格的新的:cpp:`MultiFab`和新的:cpp:`BoxArray`中，以允许进一步的粗化操作。 :cpp:`LPInfo::setConsolidation(bool)`（默认为true）可用于将多网格问题继续转移到较少的MPI进程。还有其他设置，例如:cpp:`LPInfo::setConsolidationGridSize(int)`、:cpp:`LPInfo::setConsolidationRatio(int)`和:cpp:`LPInfo::setConsolidationStrategy(int)`，以便对此过程进行控制。 :cpp:`LPInfo::setMaxCoarseningLevel(int)` 可以用来控制多重网格层级的最大数量。通常情况下我们不需要调用这个函数。然而，有时我们构建求解器只是为了应用算子（例如 :math:`L(\phi)`），而不需要解决系统。为了避免构建多重网格的粗化算子的开销，我们可以按照以下方式进行操作。 对于Dirichlet边界条件，请使用`LinOpBCType::Dirichlet`。 对于齐次 Neumann 边界条件，请使用 `LinOpBCType::Neumann`。 对于周期性边界，请使用 `LinOpBCType::Periodic`。 对于Robin边界条件，使用`LinOpBCType::Robin`，表示为数学公式：:math:`a\phi + b\frac{\partial\phi}{\partial n} = f`。 `LinOpBCType::inhomogNeumann` 用于表示非齐次 Neumann 边界条件。 `LinOpBCType::reflect_odd`用于反射并改变符号。 使用cpp中的`MLABecLaplacian`函数来处理以单元为中心的规范形式（方程:eq:`eqn::abeclap`）。 :cpp:`MLLinOp::setVerbose(int)`, :cpp:`MLMG::setVerbose(int)` 和 :cpp:`MLMG:setBottomVerbose(int)` 分别控制线性算子、多重网格求解器和底层求解器的详细程度。 :cpp:`MLMG::BottomSolver::bicgcg`: 首先使用bicgstab算法。如果bicgstab失败，则切换到cg算法。矩阵必须是对称的。 :cpp:`MLMG::BottomSolver::bicgstab`: 默认选项。 :cpp:`MLMG::BottomSolver::cg`: 共轭梯度法。矩阵必须对称。 :cpp:`MLMG::BottomSolver::cgbicg`: 从cg开始。如果cg失败，则切换到bicgstab。矩阵必须是对称的。 :cpp:`MLMG::BottomSolver::hypre`: hypre中可用的求解器之一；请参阅下面关于外部求解器的部分。 :cpp:`MLMG::BottomSolver::petsc`: 目前仅适用于基于单元的网格。 :cpp:`MLMG::BottomSolver::smoother`: 用于平滑的方法，例如高斯-赛德尔方法。 :cpp:`MLMG::setThrowException(bool)`控制着多重网格失败时是终止程序（默认行为）还是抛出异常，从而使控制权返回给调用应用程序。应用程序代码必须捕获该异常： :cpp:`MLNodeLaplacian` 用于节点变量系数的泊松方程 :math:`\nabla \cdot (\sigma \nabla \phi) = f`。 使用`MLPoisson`来解决以单元为中心的常系数泊松方程 :math:`\nabla^2 \phi = f`。 :cpp:`hypre.adjust_singular_matrix`: 默认值为false。 :cpp:`hypre.bamg_coarsen_type`: 默认值为6。请参阅`HYPRE_BoomerAMGSetCoarsenType`。 :cpp:`hypre.bamg_cycle_type`: 默认值为1。请参阅`HYPRE_BoomerAMGSetCycleType`。 :cpp:`hypre.bamg_interp_type`: 默认值为0。请参阅`HYPRE_BoomerAMGSetInterpType`。 :cpp:`hypre.bamg_logging`: 默认值为0。请参阅 `HYPRE_BoomerAMGSetLogging`。 :cpp:`hypre.bamg_max_levels`: 默认值为20。请参阅`HYPRE_BoomerAMGSetMaxLevels`。 :cpp:`hypre.bamg_num_sweeps`: 默认值为2。请参阅`HYPRE_BoomerAMGSetNumSweeps`。 :cpp:`hypre.bamg_relax_order`: 默认值为1。请参阅`HYPRE_BoomerAMGSetRelaxOrder`。 :cpp:`hypre.bamg_relax_type`：默认值为6。请参阅`HYPRE_BoomerAMGSetRelaxType`。 :cpp:`hypre.bamg_strong_threshold`: 默认值为0.25（2D）和0.57（3D）。请参阅`HYPRE_BoomerAMGSetStrongThreshold`。 :cpp:`hypre.bamg_verbose`: BoomerAMG预条件器的详细程度。默认值为0。请参阅`HYPRE_BoomerAMGSetPrintLevel`。 :cpp:`hypre.hypre_preconditioner`: 默认值为none；否则必须指定类型。 :cpp:`hypre.hypre_solver`: 默认值为 BoomerAMG。 :cpp:`hypre.overwrite_existing_matrix_files`: 默认为false。覆盖现有矩阵文件的选项。 :cpp:`hypre.recompute_preconditioner`: 默认为真。重新计算预处理器的选项。 :cpp:`hypre.write_matrix_files`：默认为false。选项用于将矩阵写入文本文件中。 AMReX也可以使用`PETSc <https://www.mcs.anl.gov/petsc/>`_作为面向单元问题的底层求解器。要构建PETSc，请按照以下步骤进行操作： AMReX提供了与`hypre <https://computing.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods>`_预处理器和求解器的接口，包括BoomerAMG、GMRES（所有变种）、PCG和BICGStab作为求解器，以及BoomerAMG和Euclid作为预处理器。这些可以作为细胞中心和基于节点的问题的底层求解器进行调用。 AMReX支持多层求解器，可用于嵌入边界。这些求解器包括：
1) 以单元为中心的求解器，其在嵌入边界面上具有齐次诺依曼、齐次迪里希特或非齐次迪里希特边界条件；
2) 以节点为中心的求解器，其在嵌入边界面上具有齐次诺依曼边界条件或流入速度条件。 在边界条件和系数被确定之后，线性算子就可以用下面的 MLMG 对象进行处理。 在构建线性算子之后，我们需要设置边界条件。这将在后面的 :ref:`sec:linearsolver:bc` 部分进行讨论。 在求解器成功返回后，如果需要的话，我们可以调用。 解决纳维-斯托克斯方程的应用程序代码需要评估粘性项；隐式求解这个项需要进行多组分求解并考虑交叉项。由于这是一个常用的模式，我们提供了一个针对以单元为中心的速度分量的张量求解方法。 在多重网格循环的底部，我们使用一个称为“底层求解器”的方法，该方法可能与其他层级使用的松弛方法不同。默认的底层求解器是双共轭梯度稳定法，但可以通过使用:cpp:`MLMG`成员方法轻松更改。 可用的选择有： 边界条件 用于以单元为中心的求解器的边界模板 默认情况下，AMReX线性求解器代码总是尽可能地几何粗化问题。然而，正如我们所提到的，我们可以在线性算子的构造函数中对传递给其中的LPInfo对象调用:cpp:`setMaxCoarseningLevel(0)`来完全禁用粗化。在这种情况下，底层求解器将解决原始问题的残差修正形式。按照以下步骤构建Hypre： 系数 考虑一个速度场 :math:`U = (u,v,w)`，其中所有分量都位于单元格中心。粘性项可以用矢量形式表示为： 目前有选择在面中心和面质心定义基于面的系数，以及将解变量解释为在单元中心和单元质心定义的选项。 曲线坐标 D(\mathbf{\phi})_i = \sum_{i=1}^N \alpha_{ij} \nabla^2 \phi_j

D(\mathbf{\phi})_i = \sum_{i=1}^N \alpha_{ij} \nabla^2 \phi_j 嵌入式边界 外部求解器 对于 `cpp:MLNodeLaplacian`，可以使用成员函数设置变量 `cpp:sigma`。 对于Robin边界条件，``MultiFab* robinbc_a``、``MultiFab* robinbc_b``和``MultiFab* robinbc_f``中的幽灵单元存储了条件中的数值，即 :math:`a\phi + b\frac{\partial\phi}{\partial n} = f`。 对于 :math:`\alpha` 和/或 :math:`\beta` 是标量常数的情况，有以下选项可供选择。 对于一般情况下，其中 :math:`\alpha` 和 :math:`\beta` 是标量场，我们使用 这里，`crse` 是一个指向 `MultiFab` 的常量指针，它包含了粗网格分辨率下的迪里切特边界值。而 `crse_ratio`（例如，2）则是粗网格求解器层级与其下方的 AMR 层级之间的细化比率。`crse` 这个 `MultiFab` 本身不需要有幽灵单元。如果求解的粗网格边界条件恒等于零，可以传递 `nullptr` 代替 `crse`。 这里的 :math:`\eta` 是动力黏度，而 :math:`\kappa` 是体积黏度。 在这里，设置一个常量 `sigma` 改变了求解器的内部行为，使其在这种特殊情况下更加高效。 如果使用Hypre支持构建，AMReX会在`amrex::Initialize`中默认初始化Hypre。如果使用CUDA构建，AMReX还会默认设置Hypre在设备上运行。用户可以通过`:cpp:`ParmParse`参数``amrex.init_hypre=[0|1]``选择禁用AMReX的Hypre初始化。 如果边界条件是迪里切特边界条件，那么位于“levelbcdata”域边界之外的幽灵单元格必须保持与域边界处解的值相等；如果边界条件是诺依曼边界条件，那么这些幽灵单元格必须保持与边界法线方向上解的梯度值相等（例如，在x方向上的低面和高面都会保持dphi/dx的值）。 如果边界条件不包含非齐次的Dirichlet或Neumann边界条件，我们可以传递`nullptr`而不是一个MultiFab。 如果我们想在域边界提供非齐次的Dirichlet或非齐次的Neumann边界条件，我们必须在``MultiFab* levelbcdata``中提供这些值，该数组必须至少有一个ghost cell。请注意，参数:cpp:`amrlev`是相对于求解而言的，不一定是完整的AMR层次结构；amrlev = 0表示求解的最粗糙层级。 实现一个多组件的基于节点的运算符略有不同。一个多组件节点运算符必须指定求解器正在使用无回流的粗/细策略。 需要强调的是，在Dirichlet或Neumann边界的``levelbcdata``中的数据被假定为恰好位于物理域的面上；将这些值存储在以单元为中心的数组的幽灵单元中只是一种实现的便利。 它接受 `Vectors` 的 `Geometry`、`BoxArray` 和 `DistributionMapping`。这些参数是 `Vectors` 类型的，因为 MLMG 可以进行多层次的复合求解。如果你只是用于单层次的求解，你可以... MLMG和线性算子类 多组分操作员 多层多网格（Multi-Level Multi-Grid）或简称为“MLMG”，是一种使用几何多重网格方法解决线性系统的类。``MLMG``的构造函数接受对``MLLinOp``的引用，它是各种线性算子类（如``MLABecLaplacian``、``MLPoisson``、``MLNodeLaplacian``等）的抽象基类。我们根据要解决的线性系统的类型选择相应的线性算子类。 Next, let's discuss the coefficients for the equation labeled as "eqn::abeclap". In the case of the "MLPoisson" method, there are no coefficients that need to be set, so no further action is required. However, for the "MLABecLaplacian" method, we need to utilize the following member functions: "setScalars", "setACoeffs", and "setBCoeffs". The purpose of the "setScalars" function is to assign values to the scalar constants A and B. 请注意，未捕获的异常会传递给调用链，以便依赖于MLMG的专用求解器的应用程序代码仍然可以捕获异常。例如，使用AMReX-Hydro的cpp::NodalProjector。 请注意，如果需要的话，必须在下面的步骤之前执行此步骤。用于此步骤的 `MLLinOp` 成员函数是： 请注意，无论您使用哪个函数来设置系数，求解器的行为都是相同的。这些函数仅将常数值复制到“MLMG”内部的MultiFab中，因此不应期望获得明显的效率提升。 可以设置可选参数（参见 :ref:`sec:linearsolver:pars` 部分），然后我们可以使用 ``MLMG`` 成员函数。 参数 无反流的粗细边界更新。二级幽灵节点（小深蓝色）通过粗糙边界插值得到。一级幽灵节点在松弛过程中与所有其他内部细节点一起更新。粗细边界上的粗节点（大蓝色）通过与内部节点和第一级幽灵节点的限制更新。二级幽灵节点下方的粗节点不会被更新。剩余的粗节点通过限制进行更新。 请参阅``amrex-tutorials/ExampleCodes/LinearSolvers/MultiComponent``以获取一个完整的工作示例。 一些线性求解器支持曲线坐标，包括一维球坐标和二维柱坐标 :math:`(r,z)`。在这些情况下，散度算子会有额外的度量项。如果不希望求解器包含度量项，因为已经通过其他方式处理了，可以使用一个设置函数将其关闭。对于基于单元格的线性求解器 `MLABecLaplacian` 和 `MLPoisson`，可以在传递给线性算子构造函数的 `LPInfo` 对象上调用 :cpp:`setMetricTerm(bool)`，并将其设置为 :cpp:`false`。对于基于节点的 `MLNodeLaplacian`，可以在 `MLNodeLaplacian` 对象上调用 :cpp:`setRZCorrection(bool)`，并将其设置为 :cpp:`false`。 张量求解 对于单层求解，`:cpp:`int amrlev` 参数应该为零。对于多层求解，每个层级需要提供 `alpha` 和 `beta`，或者 `sigma`。对于复合求解，`:cpp:`amrlev` 0 表示求解器的最低层级，这不一定是 AMR 层次结构中的最低层级。这样可以在 AMR 层次结构的不同部分进行求解，例如在 AMR 层级 3 到 5 上进行求解。 MC节点算子可以继承自``MCNodeLinOp``类。``Fapply``、``Fsmooth``和``Fflux``必须更新位于域内的一级幽灵节点。``interpolation``和``restriction``可以按照通常的方式实现。``reflux``是从精细到粗糙的直接限制，使用上述描述的一级幽灵节点进行限制。 下面的代码是设置求解器以显式计算粘性项 `divtau` 的示例： 这些线性操作符类的构造函数的形式如下所示。 EB面的默认边界条件是齐次诺依曼条件。 默认情况下，基于面的系数被定义在面的中心；如果要告诉它们基于面的系数应该被解释为位于面的质心，修改setBCoeffs命令如下： 默认情况下，解变量被定义在单元格中心；如果要告诉求解器将解变量解释为位于单元格质心，您需要设置 如果要解决的问题具有奇异矩阵，应将以下参数设置为True。在这种情况下，解只能在一个常数范围内定义。将该参数设置为True会将AMReX发送给hypre的矩阵中的一行替换为将一个单元格的值设置为0的行。 在输入文件中可以设置以下参数来控制BoomerAMG求解器的行为： 在输入文件中可以设置以下参数来控制预处理器和平滑器的选择： 多重网格求解器是一种迭代求解器。可以使用 `MLMG::setMaxIter(int)` 来更改最大迭代次数。我们也可以使用 `MLMG::setFixedIter(int)` 进行固定次数的迭代。默认情况下，使用 V-cycle。我们可以使用 `MLMG::setMaxFmgIter(int)` 来控制在切换到 V-cycle 之前可以执行多少个完整的多重网格循环。 无需在粗细边界处实施特殊的“回流(reflux)”操作，即可使用无回流方法。这是通过使用幽灵节点来实现的。每个AMR层必须有2层幽灵节点。第二层（最外层）节点被松弛处理时被视为常数，实际上充当了迪里切特边界。第一层节点使用松弛方法进行演化，与解决方案的其余部分相同。当将残差限制到粗层（在“回流”中）时，这允许使用第一层幽灵节点插值粗细边界处的残差。图:numref:`fig::refluxfreecoarsefine`说明了粗细更新的过程。 物理域边界支持的BC类型有： 这个特定于EB的类的使用方法基本上与 `MLABecLaplacian` 类相同。 请参阅 `hypre <https://computing.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods>`_ 参考手册，以获取有关上述参数用法的详细信息。 有许多可以设置的参数。在这里我们讨论一些常用的参数。 本节讨论解决线性系统的情况，其中解变量 :math:`\mathbf{\phi}` 具有多个分量。一个示例（在“MultiComponent”教程中实现）可能是： 要实现一个多组分的基于单元的运算符，需要从``MLCellLinOp``类继承。重写``getNComp``函数，返回运算符将使用的组分数（``N``）。解和右手边的``fabs``也必须至少有一个幽灵节点。``Fapply``、``Fsmooth``和``Fflux``必须被实现，以使解和右手边的``fabs``都具有``N``个组分。 要设置齐次迪里切特边界条件，请调用 要设置非齐次Dirichlet边界条件，请调用 要使用PETSc，必须在构建系统中包含``amrex/Src/Extern/PETSc``。关于使用PETSc的示例，我们建议读者参考教程`ABecLaplacian`_。 使用基于单元格的求解器与EB（Embedded Boundary）一起，需要使用`EBFArrayBoxFactory`（而不是`MLABecLaplacian`）构建一个线性算子`:cpp:`MLEBABecLap`。 要使用hypre，必须在构建系统中包含``amrex/Src/Extern/HYPRE``。关于使用hypre的示例，请参考`ABecLaplacian`_或`NodeTensorLap`_。 我们可以使用解决方案数组本身来保存这些值；这些值会被复制到内部数组中，在求解器更新解决方案数组本身时不会被覆盖。然而，请注意，这个调用并不提供求解的初始猜测。 我们使用“MLABecLaplacian”和“MLEBABecLaplacian”运算符对上述术语进行评估； 我们可以使用 `MLMG` 成员方法的选项。 现在我们来讨论如何为线性算子设置边界条件。在接下来的内容中，物理域边界指的是物理域的边界，而粗/细边界指的是自适应网格细化层之间的边界。必须按照以下准确的顺序进行以下步骤。 ∇ · (η ∇ U) + ∇ · (η (∇ U)ᵀ) + ∇ · ((κ - 2/3η) (∇ · U)) `MLABecLaplacian`和`MLPoisson`支持球坐标和柱坐标，而`MLNodeLaplacian`目前仅支持柱坐标。请注意，在使用`MLNodeLaplacian`的柱坐标时，应用程序代码在调用`:cpp:`setSigma()``之前必须将`sigma`按径向坐标进行缩放。 并以三维笛卡尔分量形式表示为 在声明或定义时使用常量 `sigma`。 这些交叉项将分别使用“MLTensorOp”和“MLEBTensorOp”运算符进行评估。 计算残差（即 :math:`f - L(\phi)`），给定解和右手边。对于以单元为中心的求解器，我们还可以调用以下函数来计算梯度 :math:`\nabla \phi` 和通量 :math:`-\beta \nabla \phi`。 让编译器为您构建 `Vectors`。请记住，类 `Vector`、`Geometry`、`BoxArray` 和 `DistributionMapping` 在第 `Chap:Basics` 章中有定义。还有两个新的类是可选参数。`LPInfo` 是一个用于传递参数的类。`FabFactory` 在带有嵌入边界的问题中使用（第 `Chap:EB` 章）。 为了在具有迪里希特边界条件和粗细边界的物理边界上设置基于单元中心的线性算子模板的顺序。在这两种情况下，边界值在幽灵单元的中心处未定义。顺序决定了用于从单元面外推边界值到幽灵单元中心的内部单元的数量，然后在常规模板中使用外推值。例如，:cpp:`maxorder = 2` 使用边界值和第一个内部值来外推到幽灵单元中心；:cpp:`maxorder = 3` 使用边界值和前两个内部值。 为了解决这个问题，给定一个初始猜测和一个右手边。零是一个完全合适的初始猜测。参数列表中的两个 `Reals` 是目标相对误差和绝对误差容限。相对误差容限被硬编码为至少 :math:`10^{-16}`。给定线性系统 :math:`Ax=b`，当残差的最大范数 (:math:`b-Ax`) 小于 :cpp:`std::max(a_tol_abs, a_tol_rel*max_norm)` 时，求解器将终止。其中 :cpp:`max_norm` 是右手边 :math:`b` 的最大范数，如果标志 :cpp:`always_use_bnorm` 设置为 True，或者如果右手边的最大范数大于等于初始猜测的最大范数误差，否则 :cpp:`max_norm` 等于初始猜测的最大范数误差。如果没有一个好的绝对容限值，将绝对容限设为零。:cpp:`solve` 的返回值是最大范数误差。 其中coeff可以是一个实数（即在每个单元格中的值相同），或者是一个MultiFab，它保存了每个单元格上梯度的系数，并带有一个EB面。 在这里，phi_on_eb是一个MultiFab，其中包含每个切割单元中的Dirichlet值。而coeff则是一个实数（即每个单元的值相同），或者是一个MultiFab，其中包含每个单元上梯度的系数，并且带有一个EB面。 