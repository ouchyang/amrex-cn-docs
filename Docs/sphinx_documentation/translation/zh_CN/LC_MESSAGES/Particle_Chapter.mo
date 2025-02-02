��          4               L     M   	   g  v  q  }  �     f   In addition to the tools for working with mesh data described in previous chapters, AMReX also provides data structures and iterators for performing data-parallel particle simulations. Our approach is particularly suited to particles that interact with data defined on a (possibly adaptive) block-structured hierarchy of meshes. Example applications include Particle-in-Cell (PIC) simulations, Lagrangian tracers, or particles that exert drag forces onto a fluid, such as in multi-phase flow calculations. The overall goals of AMReX's particle tools are to allow users flexibility in specifying how the particle data is laid out in memory and to handle the parallel communication of particle data. In the following sections, we give an overview of AMReX's particle classes and how to use them. Particles Project-Id-Version: amrex 23.00-dev
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
 除了前几章中描述的用于处理网格数据的工具之外，AMReX还提供了用于执行数据并行粒子模拟的数据结构和迭代器。我们的方法特别适用于与在（可能是自适应的）块结构网格层次上定义的数据相互作用的粒子。示例应用包括粒子-电磁场（PIC）模拟、拉格朗日示踪器或对流体施加阻力力的粒子，例如在多相流计算中。AMReX粒子工具的总体目标是允许用户灵活地指定粒子数据在内存中的布局，并处理粒子数据的并行通信。在接下来的几节中，我们将概述AMReX的粒子类及其使用方法。 粒子 