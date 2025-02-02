��          �                         $  �   7  �   �     S     n  3   �     �  e   �  =   4  G   r  N   �  ^   	     h  v  ~     �       �     }   �          /  E   M  	   �  |   �  =     H   X  _   �  W   	     Y	   1-, 2- and 3-D support AMReX Introduction AMReX is a publicly available software framework designed for building massively parallel block-structured adaptive mesh refinement (AMR) applications. AMReX is developed at LBNL, NREL, and ANL as part of the Block-Structured AMR Co-Design Center in DOE's Exascale Computing Project. C++ and Fortran interfaces Key features of AMReX include: Optional subcycling in time for time-dependent PDEs Parallel I/O Parallelization via flat MPI, OpenMP, hybrid MPI/OpenMP, hybrid MPI/(CUDA or HIP or SYCL), or MPI/MPI Plotfile format supported by AmrVis, VisIt, ParaView, and yt. Support for cell-centered, face-centered, edge-centered, and nodal data Support for embedded boundary (cut cell) representations of complex geometries Support for hyperbolic, parabolic, and elliptic solves on hierarchical adaptive grid structure Support for particles Project-Id-Version: amrex 23.00-dev
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
 1D, 2D, 和 3D 支持 AMReX 简介 AMReX 是一个公开可用的软件框架，旨在构建大规模并行的基于块结构的自适应网格（AMR）应用程序。 AMReX是在LBNL、NREL和ANL开发的，作为DOE的Exascale Computing Project中块结构AMR Co-Design Center的一部分。 C++和Fortran接口 AMReX的主要特点包括： 时间相关的偏微分方程(PDEs)中的可选子循环(subcycling) 并行I/O 并行化方式，可以使用单层(falt)MPI、OpenMP、混合MPI/OpenMP、混合MPI/(CUDA或HIP或SYCL)，或者MPI/MPI。 AmrVis、VisIt、ParaView 和 yt 支持的 Plotfile 格式。 支持以单元为中心、面为中心、边为中心和节点数据。 支持复杂几何形状的嵌入边界(embedded boundary)（cut cell, 切割单元）表示。 对层次化自适应网格结构上的双曲、抛物和椭圆方程求解的支持。 对于粒子的支持 