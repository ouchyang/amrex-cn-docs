��                          �     Z   �  3   	  �   R	  �   O
  �   >  �      �  �   �  K   W  4   �     �     �          !     8  q   M  |  �    <  3   Z  U   �  @   �     %  !   D     f  '     U   �  w   �  =   u  /   �  !   �       k   %  N   �  .   �  P       `  �   w      �   (  �   �  �   �  +   J  Z   v  �   �  E  �     �     �  !        #  �   A     �     �  i      j   m   h   �   �   A!     �!  �  �"  ^   �%  �  *&  �   �'  0   �(  K   �(  �  0)  A   �.     /  �   (/  �   �/  i   w0  �   �0  #   �1     �1  }   �1  C   52  V   y2  ,   �2  %   �2     #3     =3  B   R3  �   �3  �   g4  �  5  V   �6  \   07  6   �7  8   �7  �   �7  	   �8  �   �8  #   c9  8   �9  `   �9  T   !:  V   v:  5   �:  <   ;  A   @;  o   �;  p   �;  �   c<  n   �<  �   Z=  �   >     �>  %   �>     �>  *   �>  �   �>  *   �?  +   �?  ,   !@  ,   N@     {@  '   ~@  !   �@  G   �@  H   A  F   YA  �   �A  �   EB  H   5C  |  ~C     �D     �D  v  E  �   zF  >   /G  #   nG  �   �G  �   H  �   _I  ;  !J  �   ]K  �   CL  9   �L  0   M     MM     eM     �M     �M     �M  |   �M  e  GN    �O  3   �P  G   �P  7   +Q      cQ  "   �Q     �Q  '   �Q  Q   �Q  k   <R  :   �R  0   �R  $   S  ,   9S  u   fS  <   �S  *   T  >   DT  )  �T  �   �U    ?V  �   _W  �   �W  x   �X  6   DY  i   {Y  �   �Y    sZ     �[     �[     �[     �[  �   �[     \     �\  h   �\  e   ]  |   }]  �   �]  �   �^  �  q_  k   �a  �  eb  �   �c  -   �d  N   	e  �  Xe  -   j  	   2j  �   <j  �   �j  c   uk  �   �k  !   �l     �l  �   �l  <   Dm  Y   �m  6   �m     n     .n     Mn  /   ]n  �   �n  �   :o  �  �o  Q   jq  T   �q  3   r  6   Er  �   |r     1s  �   8s  !   �s  <   t  A   Kt  Z  �t  T   �u  3   =v  Y   qv  ?   �v  h   w  D   tw  �   �w  w   Ax  �   �x  t   By     �y      �y     �y  !   �y  �   z  (   �z  0   �z  +   
{  3   6{     j{     q{     �{  E   �{  F   �{  F   9|  �   �|  �   }  R   �}  X  K~     �     �    D^c(F) = \frac{1}{\kappa h} \left( \sum^D_{d = 1}
   (F_{d, \mathrm{hi}} \, \alpha_{d, \mathrm{hi}} - F_{d, \mathrm{lo}}\, \alpha_{d, \mathrm{lo}})
   + F^{EB} \alpha^{EB} \right). (\nabla \cdot {F})^c_i = \dfrac{1}{\mathcal{V}_i} \sum_{f=1}^{N_f} ({F}_f\cdot{n}_f) A_f

 (\rho \phi)_t + \nabla \cdot ( \rho \phi u) = RHS

 **Area fractions** are returned in an :cpp:`Array` of :cpp:`MultiCutFab` pointers. For each direction, area fraction is for the face of that direction. Data are in the range of :math:`[0,1]` with zero representing a covered face and one an un-cut face. **Boundary centroid** is also in a :cpp:`MultiCutFab` with ``AMREX_SPACEDIM`` components.  Each component of the data is in the range of :math:`[-0.5,0.5]`, based on each cell's local coordinates with respect to the regular cell's center. **Face centroid** is in a :cpp:`MultiCutFab` with ``AMREX_SPACEDIM`` components. Each component of the data is in the range of :math:`[-0.5,0.5]`, based on each cell's local coordinates with respect to the embedded boundary. **Face centroids** are returned in an :cpp:`Array` of :cpp:`MultiCutFab` pointers. There are two components for each direction and the ordering is always the same as the original ordering of the coordinates. For example, for :math:`y` face, the component 0 is for :math:`x` coordinate and 1 for :math:`z`. The coordinates are in each face's local frame normalized to the range of :math:`[-0.5,0.5]`. **Volume centroid** (also called cell centroid) is in a :cpp:`MultiCutFab` with ``AMREX_SPACEDIM`` components. Each component of the data is in the range of :math:`[-0.5,0.5]`, based on each cell's local coordinates with respect to the regular cell's center. **Volume fraction** is in a single-component :cpp:`MultiFab`. Data are in the range of :math:`[0,1]` with zero representing covered cells and one for regular cells. : Redistribution illustration. Excess update distributed to neighbor cells. :cpp:`AllRegularIF`:  No embedded boundaries at all. :cpp:`BoxIF`: Box. :cpp:`CylinderIF`: Cylinder. :cpp:`EB2::GeometryShop` :cpp:`EB2::IndexSpace` :cpp:`EBCellFlagFab` :cpp:`EBCellFlagFab` contains information on cell types.  We can use it to determine if a box contains cut cells. :cpp:`EBCellFlagFab` is derived from :cpp:`BaseFab`. Its data are stored in an array of 32-bit integers, and can be used in C++ or passed to Fortran just like an :cpp:`IArrayBox` (section :ref:`sec:basics:fab`). AMReX provides a Fortran module called ``amrex_ebcellflag_module``. This module contains procedures for testing cell types and getting neighbor information. For example :cpp:`EBFArrayBoxFactory` is derived from :cpp:`FabFactory<FArrayBox>`. :cpp:`MultiFab` constructors have an optional argument :cpp:`const FabFactory<FArrayBox>&`.  We can use :cpp:`EBFArrayBoxFactory` to build :cpp:`MultiFab`\ s that carry EB data.  Member function of :cpp:`FabArray` :cpp:`EBSupport:basic`:  basic flags for cell types :cpp:`EBSupport:full`: volume plus area fraction, boundary centroid and face centroid :cpp:`EBSupport:volume`: basic plus volume fraction and centroid :cpp:`EllipsoidIF`: Ellipsoid. :cpp:`PlaneIF`: Half-space plane. :cpp:`SphereIF`: Sphere. :cpp:`Translate`: Translates an object. :cpp:`lathe`: Creates a surface of revolution by rotating a 2D object around an axis. :cpp:`makeComplement`: Complement of an object. E.g. a sphere with fluid on outside becomes a sphere with fluid inside. :cpp:`makeIntersection`: Intersection of two or more objects. :cpp:`makeUnion`: Union of two or more objects. :cpp:`rotate`: Rotates an object. :cpp:`scale`: Scales an object. A :cpp:`MultiCutFab` is very similar to a :cpp:`MultiFab`. Its data can be accessed with subscript operator A conservative, finite volume discretization starts with the divergence theorm A typical two-dimensional uniform cell that is AMReX also provides a number of transformation operations to apply to an object. AMReX supports multi-level 1) cell-centered solvers with homogeneous Neumann, homogeneous Dirichlet, or inhomogeneous Dirichlet boundary conditions on the EB faces, and 2) nodal solvers with homogeneous Neumann boundary conditions, or inflow velocity conditions on the EB faces. Additionally one can use ``eb2.stl_scale``, ``eb2.stl_center`` and ``eb2.stl_reverse_normal`` to scale, translate and reverse the object, respectively. After the EB database is initialized, the next thing we build is :cpp:`EBFArrayBoxFactory`. This object provides access to the EB database in the format of basic AMReX objects such as :cpp:`BaseFab`, :cpp:`FArrayBox`, :cpp:`FabArray`, and :cpp:`MultiFab`. We can construct it with Alternatively, the EB information can be initialized from an STL file specified by a :cpp:`ParmParse` parameter ``eb2.stl_file``.  The initialization is done by calling Argument :cpp:`Vector<int> const& a_ngrow` specifies the number of ghost cells we need for EB data at various :cpp:`EBSupport` levels, and argument :cpp:`EBSupport a_support` specifies the level of support needed. Build an :cpp:`EB2::IndexSpace` with the :cpp:`EB2::GeometryShop` object and a :cpp:`Geometry` object that contains the information about the domain and the mesh. Consider a conservative update in the form: Consider a system of PDEs to advance a conserved quantity :math:`U` with fluxes :math:`F`: Currently there are options to define the face-based coefficients on face centers vs face centroids, and to interpret the solution variable as being defined on cell centers vs cell centroids. Define an implicit function of position which describes the surface of the embedded object. Specifically, the function class must have a public member function that takes a position and returns a negative value if that position is inside the fluid, a positive value in the body, and identically zero at the embedded boundary. EBFArrayBoxFactory Embedded Boundary Data Embedded Boundary Data Structures Finite Volume Discretizations First, we review finite volume discretizations with embedded boundaries as used by AMReX-based applications. Then we illustrate the small cell problem. Flux Redistribution Fluxes in a cut cell. For each cell cut by the EB geometry, compute the convective update :math:`\nabla \cdot{F}^{EB}` follows: For each cell cut by the EB geometry, compute the non-conservative update, :math:`\nabla \cdot {F}^{nc}` , For each cell cut by the EB geometry, redistribute its mass loss, :math:`\delta M_i` , to its neighbors: For each valid cell in the domain, compute the conservative divergence, :math:`(\nabla \cdot F)^c` , of the convective fluxes, :math:`F` For state redistribution we implement the weighted state redistribution algorithm as described in Guiliani et al (2021), which is available on `arxiv  <https://arxiv.org/abs/2112.12360>`_ . This is an extension of the original state redistribution algorithm of Berger and Guiliani (2020). Geometry is discretely represented by volumes (:math:`V = \kappa h^d`) and apertures (:math:`A= \alpha h^{d-1}`), where :math:`h` is the (uniform) mesh spacing at that AMR level, :math:`\kappa` is the volume fraction and :math:`\alpha` are the area fractions. Without multivalued cells the volume fractions, area fractions and cell and face centroids (see :numref:`fig::volume`) are the only geometric information needed to compute second-order fluxes centered at the face centroids, and to infer the connectivity of the cells. Cells are connected if adjacent on the Cartesian mesh, and only via coordinate-aligned faces on the mesh. If an aperture, :math:`\alpha = 0`, between two cells, they are not directly connected to each other. Given an implicit function object, say :cpp:`f`, we can make a :cpp:`GeometryShop` object with Here :cpp:`CutFab` is derived from :cpp:`FArrayBox` and can be passed to Fortran just like :cpp:`FArrayBox`. The difference between :cpp:`MultiCutFab` and :cpp:`MultiFab` is that to save memory :cpp:`MultiCutFab` only has data on boxes that contain cut cells. It is an error to call :cpp:`operator[]` if that box does not have cut cells. Thus the call must be in a :cpp:`if` test block (see section :ref:`sec:EB:flag`). Here :math:`N_f` is the number of faces of cell :math:`i`, :math:`\vec{n}_f` and :math:`A_f` are the unit normal and area of the :math:`f` -th face respectively, and :math:`\mathcal{V}_i` is the volume of cell :math:`i` given by Here are some examples of using these functions. Here is a simple example of initialize the database for an embedded sphere. Here the template parameter is a :cpp:`EB2::GeometryShop`. :cpp:`Geometry` (see section :ref:`sec:basics:geom`) describes the rectangular problem domain and the mesh on the finest AMR level. Coarse level EB data is generated from coarsening the original fine data. The :cpp:`int required_coarsening_level` parameter specifies the number of coarsening levels required. This is usually set to :math:`N-1`, where :math:`N` is the total number of AMR levels. The :cpp:`int max_coarsening_levels` parameter specifies the number of coarsening levels AMReX should try to have. This is usually set to a big number, say 20 if multigrid solvers are used. This essentially tells the build to coarsen as much as it can. If there are no multigrid solvers, the parameter should be set to the same as :cpp:`required_coarsening_level`. It should be noted that coarsening could create multi-valued cells even if the fine level does not have any multi-valued cells. This occurs when the embedded boundary cuts a cell in such a way that there is fluid on multiple sides of the boundary within that cell. Because multi-valued cells are not supported, it will cause a runtime error if the required coarsening level generates multi-valued cells. The optional :cpp:`int ngrow` parameter specifies the number of ghost cells outside the domain on required levels. For levels coarser than the required level, no EB data are generated for ghost cells outside the domain. Illustration of embedded boundary cutting a two-dimensional cell. Implicit Function In AMReX geometric information is stored in a distributed database class that must be initialized at the start of the calculation. The procedure for this goes as follows: In ``amrex/Src/EB/``, there are a number of predefined implicit function classes for basic shapes. One can use these directly or as template for their own classes. In an embedded boundary cell, the "conservative divergence" is discretized (as :math:`D^c(F)`) as follows In the context of time-explicit advance methods for, say hyperbolic conservation laws, a naive discretization in time of :eq:`eqn::hypsys` using :eq:`eqn::ebdiv`, Initializing the Geometric Database Linear Solvers Linear solvers for the canonical form (equation :eq:`eqn::abeclap`) have been discussed in chapter :ref:`Chap:LinearSolvers`. Make a :cpp:`EB2::GeometryShop` object using the implicit function. Note that :math:`\nabla \cdot{F}_i^{EB}` gives an update for :math:`\rho \phi` ; i.e., Now, a conservative update can be written as Small Cell Problem and Redistribution Small Cells And Stability State Redistribution The default boundary condition on EB faces is homogeneous Neumann. The default is for the face-based coefficients to be defined at face centers; to tell the that the face-based coefficients should be interpreted as living at face centroids, modify the setBCoeffs command to be The default is for the solution variable to be defined at cell centers; to tell the solver to interpret the solution variable as living at cell centroids, you must set The newly built :cpp:`EB2::IndexSpace` is pushed on to a stack. Static function :cpp:`EB2::IndexSpace::top()` returns a :cpp:`const &` to the new :cpp:`EB2::IndexSpace` object. We usually only need to build one :cpp:`EB2::IndexSpace` object. However, if your application needs multiple :cpp:`EB2::IndexSpace` objects, you can save the pointers for later use. For simplicity, we assume there is only one `EB2::IndexSpace` object for the rest of this chapter. The usage of this EB-specific class is essentially the same as :cpp:`MLABecLaplacian`. Through member functions of :cpp:`EBFArrayBoxFactory`, we have access to the following data: To set homogeneous Dirichlet boundary conditions, call To set inhomogeneous Dirichlet boundary conditions, call To use a cell-centered solver with EB, one builds a linear operator :cpp:`MLEBABecLap` with :cpp:`EBFArrayBoxFactory` (instead of a :cpp:`MLABecLaplacian`) Tutorials Typically, the redistribution neighborhood for each cell is one that can be reached via a monotonic path in each coordinate direction of unit length (see, e.g., :numref:`fig::redistribution`) U^{n+1} = U^{n} - \delta t D^c(F)

 We build :cpp:`EB2::IndexSpace` with a template function \delta M_i =  \mathcal{K}_i(1- \mathcal{K}_i)[ \nabla \cdot {F}^c_i-  \nabla \cdot {F}^{nc}_i]

 \frac{ \rho^{n+1} \phi^{n+1} - \rho^{n} \phi^{n} }{\Delta t} = - \nabla \cdot{F}^c

 \frac{(\rho \phi_i)^{n+1} - (\rho \phi_i)^{n} }{\Delta t} = - \nabla \cdot{F}^{EB}_i

 \frac{\partial U}{\partial t} + \nabla \cdot F = 0.

 \int_V \nabla \cdot F dV = \int_{\partial V} F \cdot n dA.

 \mathcal{V}_i = (\Delta x \Delta y \Delta z)\cdot \mathcal{K}_i

 \nabla \cdot {F}^{EB}_j :=   \nabla \cdot {F}^{EB}_j + w_{ij}\delta M_i\, \qquad \forall j\in N(i)\setminus i

 \nabla \cdot{F}^{EB}_i = \mathcal{K}_i\nabla \cdot{F}^{c}_i +(1-\mathcal{K}_i) \nabla \cdot \mathcal{F}^{nc}_i

 \nabla\cdot{F}^{nc}_i = \dfrac{\sum\limits_{j\in N(i) } \mathcal{K}_j\nabla \cdot {F}^c_j} {\sum\limits_{j\in N(i) } {\mathcal{K}}_j}

 `EB/CNS`_ is an AMR code for solving compressible Navier-Stokes equations with the embedded boundary approach. `EB/MacProj`_ is a single-level code that computes a divergence-free flow field around a sphere.  A MAC projection is performed on an initial velocity field of (1,0,0). `EB/Poisson`_ is a single-level code that is a proxy for solving the electrostatic Poisson equation for a grounded sphere with a point charge inside. a and the weights, :math:`w_{ij}` , are b calculation. The portion of the cell faces can then be used to return a reference to the :cpp:`EBFArrayBoxFactory` used for building the :cpp:`MultiFab`. Using :cpp:`dynamic_cast`, we can test whether a :cpp:`MultiFab` is built with an :cpp:`EBFArrayBoxFactory`. cell faces. The volume (labelled V) is the cut by the embedded boundary. The grey area faces (labelled with A) through which fluxes flow are the "uncovered" regions of the full or represents the region excluded from the uncovered region of the interior. w_{ij} = \dfrac{1}{\sum\limits_{j\in N(i)\setminus i}  \mathcal{K}_j}

 where :math:`N(i)` is the index set of cell :math:`i` and its neighbors. where :math:`\mathcal{K}_i` is the volume fraction of cell :math:`i` . where coeff can be a real number (i.e. the value is the same at every cell) or is the MultiFab holding the coefficient of the gradient at each cell with an EB face. where phi_on_eb is the MultiFab holding the Dirichlet values in every cut cell, and coeff again is a real number (i.e. the value is the same at every cell) or a MultiFab holding the coefficient of the gradient at each cell with an EB face. where the mass loss in cell :math:`i` , :math:`\delta M_i` , is given by would have a time step constraint :math:`\delta t \sim h \kappa^{1/D}/V_m`, which goes to zero as the size of the smallest volume fraction :math:`\kappa` in the calculation. Since EB volume fractions can be arbitrarily small, this presents an unacceptable constraint. This is the so-called "small cell problem," and AMReX-based applications address it with redistribution methods. |a| |b| Project-Id-Version: amrex 23.00-dev
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
 D^c(F) = \frac{1}{\kappa h} \left( \sum^D_{d = 1}
   (F_{d, \mathrm{hi}} \, \alpha_{d, \mathrm{hi}} - F_{d, \mathrm{lo}}\, \alpha_{d, \mathrm{lo}})
   + F^{EB} \alpha^{EB} \right). （∇ · F）^c_i = 1/𝒱_i ∑_{f=1}^{N_f} (F_f · n_f) A_f （ρφ）_t + ∇ · (ρφu) = RHS **面积分数**以 :cpp:`MultiCutFab` 指针的 :cpp:`Array` 形式返回。对于每个方向，面积分数表示该方向的面。数据范围在 :math:`[0,1]` 之间，其中零表示被覆盖的面，而一表示未切割的面。 **Boundary centroid** 也位于具有 ``AMREX_SPACEDIM`` 维度的 :cpp:`MultiCutFab` 中。数据的每个分量都在 :math:`[-0.5,0.5]` 的范围内，基于每个单元格相对于规则单元格中心的局部坐标。 **面心**位于具有``AMREX_SPACEDIM``个组件的:cpp:`MultiCutFab`中。数据的每个组件都在范围:math:`[-0.5,0.5]`内，基于每个单元格相对于嵌入边界的局部坐标。 **面心点**以一个 `Array` 的 `MultiCutFab` 指针返回。每个方向都有两个分量，其顺序与坐标的原始顺序始终相同。例如，对于 `y` 面，分量 0 对应于 `x` 坐标，分量 1 对应于 `z` 坐标。这些坐标在每个面的局部坐标系中归一化到范围 `[-0.5, 0.5]`。 **体积质心**（也称为单元质心）位于具有``AMREX_SPACEDIM``个分量的:cpp:`MultiCutFab`中。数据的每个分量都在范围:math:`[-0.5,0.5]`内，基于每个单元相对于规则单元中心的局部坐标。 在单组分的 `MultiFab` 中，**体积分数**表示数据的范围在 [0,1] 之间，其中零表示被覆盖的单元格，而一表示常规单元格。 再分配说明。多余的更新分发给相邻单元。 :cpp:`AllRegularIF`: 没有任何嵌入边界。 :cpp:`BoxIF`: 盒子。 :cpp:`CylinderIF`: 圆柱体。 :cpp:`EB2::GeometryShop` :cpp:`EB2::IndexSpace` :cpp:`EBCellFlagFab` `EBCellFlagFab` 包含有关单元格类型的信息。我们可以使用它来确定一个盒子是否包含切割单元。 `EBCellFlagFab`是从`BaseFab`派生而来的。它的数据存储在一个32位整数数组中，并且可以像`IArrayBox`一样在C++中使用或传递给Fortran（参见:ref:`sec:basics:fab`节）。AMReX提供了一个名为`amrex_ebcellflag_module`的Fortran模块。该模块包含用于测试单元格类型和获取邻居信息的过程。例如， `EBFArrayBoxFactory`是从`FabFactory<FArrayBox>`派生而来的。`MultiFab`的构造函数有一个可选参数`const FabFactory<FArrayBox>&`。我们可以使用`EBFArrayBoxFactory`来构建携带EB数据的`MultiFab`。这是`FabArray`的成员函数。 :cpp:`EBSupport:basic`: 单元类型的基本标志 :cpp:`EBSupport:full`: 体积加面积分数，边界质心和面质心 :cpp:`EBSupport:volume`: 基本加体积分数和质心 :cpp:`EllipsoidIF`: 椭球体。 :cpp:`PlaneIF`: 半空间平面。 :cpp:`SphereIF`: 球体。 :cpp:`Translate`: 翻译一个对象。 :cpp:`车床`: 通过围绕轴线旋转二维物体来创建一个旋转曲面。 :cpp:`makeComplement`: 对象的补集。例如，外部有流体的球体变成内部有流体的球体。 :cpp:`makeIntersection`: 两个或多个对象的交集。 :cpp:`makeUnion`: 合并两个或多个对象。 :cpp:`rotate`: 旋转一个对象。 :cpp:`scale`: 对一个对象进行缩放。 一个 `MultiCutFab` 类非常类似于一个 `MultiFab` 类。它的数据可以通过下标操作符进行访问。 一个保守的有限体积离散化从散度定理开始。 一个典型的二维均匀单元，它是 AMReX还提供了许多可以应用于对象的转换操作。 AMReX支持多层次的1) 以单元为中心的求解器，其边界条件可以是均匀诺依曼、均匀迪里希雷或非均匀迪里希雷条件，并且应用于EB面；以及2) 以节点为中心的求解器，其边界条件可以是均匀诺依曼条件或EB面上的入流速度条件。 此外，可以使用``eb2.stl_scale``、``eb2.stl_center``和``eb2.stl_reverse_normal``来分别对对象进行缩放、平移和反转操作。 在EB数据库初始化完成后，我们接下来要构建的是：cpp:`EBFArrayBoxFactory`。这个对象以基本的AMReX对象（如cpp:`BaseFab`、cpp:`FArrayBox`、cpp:`FabArray`和cpp:`MultiFab`）的格式提供对EB数据库的访问。我们可以使用以下方式构建它： 另外，EB信息也可以从由``ParmParse``参数``eb2.stl_file``指定的STL文件进行初始化。通过调用以下方法进行初始化： 参数 `cpp:Vector<int> const& a_ngrow` 指定了在不同的 `cpp:EBSupport` 级别下，我们需要为 EB 数据预留的幽灵单元数量。而参数 `cpp:EBSupport a_support` 则指定了所需的支持级别。 使用 `EB2::GeometryShop` 对象和包含有关域和网格信息的 `Geometry` 对象构建一个 `EB2::IndexSpace`。 请考虑以保守方式进行更新，格式如下： 考虑一个用于推进守恒量 :math:`U` 的偏微分方程系统，其中包含了通量 :math:`F`。 目前有选择在面中心和面质心定义基于面的系数，以及将解变量解释为在单元中心和单元质心定义的选项。 请定义一个隐函数，描述嵌入物体的表面。具体而言，该函数类必须具有一个公共成员函数，该函数接受一个位置作为参数，并在该位置在流体内部时返回负值，在物体内部时返回正值，并在嵌入边界处返回零值。 EBFArrayBoxFactory 嵌入边界数据 嵌入式边界数据结构 有限体积离散化方法 首先，我们回顾一下AMReX应用程序中使用的带嵌入边界的有限体积离散化方法。然后，我们将说明小单元问题。 通量重新分配 切割单元中的通量。 对于由EB几何切割的每个单元格，计算对流更新项 :math:`\nabla \cdot{F}^{EB}` 如下： 对于由EB几何切割的每个单元格，计算非守恒更新项 :math:`\nabla \cdot {F}^{nc}`。 对于由EB几何图形切割的每个单元格，将其质量损失 :math:`\delta M_i` 重新分配给其相邻单元格： 对于定义域中的每个有效单元格，计算传输通量的保守散度 :math:`(\nabla \cdot F)^c`，其中 :math:`F` 是对流通量。 为了进行状态重分配，我们采用了Guiliani等人（2021）在`arxiv <https://arxiv.org/abs/2112.12360>`_ 上描述的加权状态重分配算法。这是Berger和Guiliani（2020）原始状态重分配算法的扩展。 几何形状通过体积（:math:`V = \kappa h^d`）和孔隙（:math:`A= \alpha h^{d-1}`）离散表示，其中 :math:`h` 是该自适应网格细化层级上的（均匀）网格间距，:math:`\kappa` 是体积分数，:math:`\alpha` 是面积分数。在没有多值单元的情况下，体积分数、面积分数以及单元和面心（参见 :numref:`fig::volume`）是计算以面心为中心的二阶通量和推断单元连接性所需的唯一几何信息。如果在笛卡尔网格上相邻，则单元通过坐标对齐的面连接。如果两个单元之间存在孔隙（:math:`\alpha = 0`），则它们之间没有直接连接。 给定一个隐式函数对象，比如 `f`，我们可以使用它来创建一个 `GeometryShop` 对象。 这里，`CutFab` 是从 `FArrayBox` 派生而来的，可以像 `FArrayBox` 一样传递给 Fortran。`MultiCutFab` 和 `MultiFab` 的区别在于为了节省内存，`MultiCutFab` 只在包含切割单元的盒子上存储数据。如果该盒子没有切割单元，则调用 `operator[]` 是错误的。因此，该调用必须位于一个 `if` 测试块中（参见第 :ref:`sec:EB:flag` 节）。 这里 :math:`N_f` 是单元 :math:`i` 的面数，:math:`\vec{n}_f` 和 :math:`A_f` 分别是第 :math:`f` 个面的单位法向量和面积，而 :math:`\mathcal{V}_i` 是单元 :math:`i` 的体积，由以下公式给出： 这里是使用这些函数的一些示例。 这是一个简单的示例，用于初始化嵌入式数据库中的球体。 在这里，模板参数是一个 `EB2::GeometryShop`。`Geometry`（参见第 `sec:basics:geom` 节）描述了矩形问题域和最精细的 AMR 层上的网格。粗糙级别的 EB 数据是通过对原始精细数据进行粗化生成的。`int required_coarsening_level` 参数指定所需的粗化级别数。通常将其设置为 :math:`N-1`，其中 :math:`N` 是总的 AMR 级别数。`int max_coarsening_levels` 参数指定 AMReX 应尽量拥有的粗化级别数。如果使用多重网格求解器，通常将其设置为一个较大的数，比如 20。这基本上告诉构建系统尽可能多地进行粗化。如果没有多重网格求解器，则该参数应设置为与 `required_coarsening_level` 相同。需要注意的是，即使精细级别没有多值单元，粗化也可能创建多值单元。当嵌入边界以某种方式切割单元时，在该单元内边界的多个侧面上存在流体。由于不支持多值单元，如果所需的粗化级别生成多值单元，将会导致运行时错误。可选的 `int ngrow` 参数指定所需级别域外的幽灵单元数。对于比所需级别更粗的级别，不会为域外的幽灵单元生成 EB 数据。 嵌入边界切割二维单元的示意图。 隐函数 在 AMReX 中，几何信息存储在一个分布式数据库类中，必须在计算开始时进行初始化。其初始化过程如下： 在 ``amrex/Src/EB/`` 目录下，有许多预定义的隐式函数类用于基本形状。可以直接使用这些类，或者将它们作为模板来创建自己的类。 在嵌入边界单元中，“保守散度”被离散化为 :math:`D^c(F)`，具体如下所示： 在处理时间显式推进方法时，例如双曲守恒律，使用方程：eq:`eqn::hypsys`的时间离散化方法是朴素的，利用方程：eq:`eqn::ebdiv`进行离散化。 正在初始化几何数据库。 线性求解器 在第 :ref:`Chap:LinearSolvers` 章中已经讨论了用于标准形式方程（方程 :eq:`eqn::abeclap`）的线性求解器。 使用隐式函数创建一个 `EB2::GeometryShop` 对象。 请注意，:math:`\nabla \cdot{F}_i^{EB}` 对于 :math:`\rho \phi` 进行更新；即， 现在，我们可以将保守的更新写成这样。 小区问题和重新分配 小型蜂窝基站和稳定性 国家再分配 EB面的默认边界条件是齐次诺依曼。 默认情况下，基于面的系数被定义在面的中心位置；若要指示基于面的系数应被解释为位于面的质心位置，请修改setBCoeffs命令为： 默认情况下，解变量被定义在单元格中心；要告诉求解器将解变量解释为位于单元格质心，您必须设置 新建的 `EB2::IndexSpace` 被推入堆栈。静态函数 `EB2::IndexSpace::top()` 返回一个对新的 `EB2::IndexSpace` 对象的 `const &` 引用。通常我们只需要构建一个 `EB2::IndexSpace` 对象。然而，如果您的应用程序需要多个 `EB2::IndexSpace` 对象，您可以保存指针以供以后使用。为简单起见，我们假设在本章的其余部分只有一个 `EB2::IndexSpace` 对象。 这个特定于EB的类的使用方法基本上与 `MLABecLaplacian` 类相同。 通过 :cpp:`EBFArrayBoxFactory` 的成员函数，我们可以访问以下数据： 要设置齐次迪里切特边界条件，请调用 要设置不均匀的Dirichlet边界条件，请调用 使用基于单元格的求解器与EB（Embedded Boundary）一起，需要使用`EBFArrayBoxFactory`（而不是`MLABecLaplacian`）构建一个线性算子`:cpp:`MLEBABecLap`。 教程 通常情况下，每个单元格的重新分配邻域是通过每个坐标方向上的单调路径以单位长度到达的（参见，例如，:numref:`fig::redistribution`）。 U^{n+1} = U^{n} - \delta t D^c(F) 我们使用一个模板函数来构建 `EB2::IndexSpace`。 δMᵢ = 𝒦ᵢ(1 - 𝒦ᵢ)[∇ · Fᶜᵢ - ∇ · Fⁿᶜᵢ] 根据您的要求，我将为您翻译这条公式。请注意，我会保留原始的格式，不会解释任何概念，只提供翻译。

\frac{ \rho^{n+1} \phi^{n+1} - \rho^{n} \phi^{n} }{\Delta t} = - \nabla \cdot{F}^c

Translated into Simplified Chinese:

\frac{ \rho^{n+1} \phi^{n+1} - \rho^{n} \phi^{n} }{\Delta t} = - \nabla \cdot{F}^c \frac{(\rho \phi_i)^{n+1} - (\rho \phi_i)^{n} }{\Delta t} = - \nabla \cdot{F}^{EB}_i \frac{\partial U}{\partial t} + \nabla \cdot F = 0. 在体积V上的散度F的积分等于在V的边界上F与法向量n的点积的积分。 \mathcal{V}_i = (\Delta x \Delta y \Delta z)\cdot \mathcal{K}_i 对于所有的 j∈N(i)\setminus i，定义 nabla dot F^EB_j 为 nabla dot F^EB_j + w_ij * delta M_i。 ∇ · F^(EB)_i = 𝒦_i∇ · F^c_i + (1-𝒦_i) ∇ · 𝒢^(nc)_i $\nabla\cdot{F}^{nc}_i = \dfrac{\sum\limits_{j\in N(i) } \mathcal{K}_j\nabla \cdot {F}^c_j} {\sum\limits_{j\in N(i) } {\mathcal{K}}_j}$ `EB/CNS`_ 是一种使用嵌入边界方法求解可压缩Navier-Stokes方程的AMR（自适应网格细化）代码。 `EB/MacProj`_ 是一个单层代码，用于计算围绕球体的无散流场。对一个初始速度场 (1,0,0) 进行了 MAC 投影。 `EB/Poisson`_ 是一个单层代码，用于求解带有一个点电荷的接地球的静电泊松方程的代理。 一个 而权重，:math:`w_{ij}`，是 b 计算。细胞表面的部分。 可以用来返回对用于构建MultiFab的EBFArrayBoxFactory的引用。使用dynamic_cast，我们可以测试一个MultiFab是否是使用EBFArrayBoxFactory构建的。 细胞表面。体积（标记为V）是 被嵌入边界切割的部分。灰色区域。 面（标记为A）通过其中的通量。 这些是完整区域中的“未覆盖”部分。 或者 代表被排除在外的地区 内部的未覆盖区域。 w_{ij} = \dfrac{1}{\sum\limits_{j\in N(i)\setminus i}  \mathcal{K}_j} 其中 :math:`N(i)` 是细胞 :math:`i` 及其邻居的索引集合。 其中 :math:`\mathcal{K}_i` 表示细胞 :math:`i` 的体积分数。 其中coeff可以是一个实数（即在每个单元格中的值相同），或者是一个MultiFab，其中包含每个单元格的梯度系数和EB面。 phi_on_eb 是一个 MultiFab，其中包含每个切割单元的迪里切特值。coeff 是一个实数（即每个单元的值相同），或者是一个 MultiFab，其中包含每个单元的梯度系数和 EB 面。 在单元格 :math:`i` 中，质量损失 :math:`\delta M_i` 的表达式如下： 在计算中，会有一个时间步长约束：math:`\delta t \sim h \kappa^{1/D}/V_m`，其中 :math:`\kappa` 是计算中最小体积分数的大小。随着EB体积分数可以任意小，这个约束是不可接受的。这就是所谓的“小单元问题”，而基于AMReX的应用程序通过重新分配方法来解决这个问题。 |a| |b| 