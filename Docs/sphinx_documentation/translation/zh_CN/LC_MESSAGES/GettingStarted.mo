��    $      <              \  �   ]     2     P     b     w     �     �  ?   �     �  �  	  �   �    �  �  �  [   �	  �   
            '   (  �   P  _       l  �  �  s   +  �   �  n  �  >  �  �   ;  �   �     �  �   �  �  �  0      �   Q  3     �   A  v  8  �   �     �     �     �     �  !   �     �  =   �     8  �  E  $  �   �   "  �  #  k   �$    =%  	   L&     V&  *   c&  �   �&  /  ('     X)  j  t)  v   �*  �   V+  "  N,  3  q.  �   �/  �   �0  	   =1  �   G1  y  2  .   4  �   �4  $   j5  �   �5   AMReX can also be obtained using Spack (https://spack.io/).  Assuming you have Spack installed, simply type, ``spack install amrex``. For more information see the :ref:`sec:build:spack` section in Building AMReX. Building and Running the Code Building the Code Downloading the Code Example Codes Example: Heat Equation Solver Example: Hello World F_{i+^1\!/_2,\,j} = \frac{\phi_{i+1,j}-\phi_{i,j}}{\Delta x},

 Guided Tutorials If the compilation fails, you are referred to :ref:`Chap:BuildingAMReX` for more details on how to configure the build system.  The *optional* command line argument ``amrex.v=1`` sets the AMReX verbosity level to 1 to print the number of MPI processes used.  The default verbosity level is 1, and you can pass ``amrex.v=0`` to turn it off. More details on how runtime parameters are handled can be found in section :ref:`sec:basics:parmparse`. If you want to build with OpenMP, type make ``USE_OMP=TRUE``.  This should make an executable named ``main3d.gnu.DEBUG.OMP.ex``. Note OMP in the file name. Make sure the ``OMP_NUM_THREADS`` environment variable is set on your system. You can then run, In the GNUmakefile there are compilation options for DEBUG mode (less optimized code with more error checking), dimensionality, compiler type, and flags to enable MPI and/or OpenMP parallelism.  If there are multiple instances of a parameter, the last instance takes precedence. Note that the command takes a file ``inputs_2d.`` The calculation solves the heat equation in 2D on a domain with :math:`256 \times 256` cells.  It runs :math:`10,000` steps and makes a plotfile every :math:`1,000` steps.  When the run finishes, you will have a number of plotfiles, ``plt00000, plt01000,`` etc, in the directory where you are running.  You can control runtime parameters such as how many time steps to run and how often to write plotfiles by setting them in ``inputs_2d.`` Note that you can build with both ``USE_MPI=TRUE`` and ``USE_OMP=TRUE``.  You can then run, Now let's build with MPI by typing ``make USE_MPI=TRUE`` (alternatively you can set ``USE_MPI=TRUE`` in the GNUmakefile). This should make an executable named ``main3d.gnu.DEBUG.MPI.ex``. Note MPI in the file name. You can then run, Parallelization Running the Code The example code can be run as follows, The implementation details of the code are discussed in the `Heat Equation`_ example section of the Guided Tutorials. For now let's just build and run the code, and visualize the results. The main body of this short example contains three statements.  Usually the first and last statements for the :cpp:`int main(...)` function of every program should be calling :cpp:`amrex::Initialize` and :cpp:`amrex::Finalize`, respectively. The second statement calls :cpp:`amrex::Print` to print out a string that includes the AMReX version returned by the :cpp:`amrex::Version` function. The example code includes two AMReX header files. Note that the name of all AMReX header files starts with ``AMReX_`` (or just AMReX in the case of AMReX.H). All AMReX C++ functions are in the :cpp:`amrex` namespace. The result may look like, The source code is available at https://github.com/AMReX-Codes/amrex. The GitHub repo is our central repo for development. The development branch includes the latest state of the code, and it is tagged as a release on a monthly basis with version number YY.MM (e.g., 17.04). The MM part of the version is incremented every month, and the YY part every year.  Bug fix releases are tagged with YY.MM.patch (e.g., 17.04.1). The source code of this example is at ``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/`` and is also shown below. The version string means the current commit 5775aed933c4 (note that the first letter g in g577.. is not part of the hash) is based on 17.05 with 30 additional commits and the AMReX work tree is dirty (i.e. there are uncommitted changes). There are several visualization tools that can be used for AMReX plotfiles. One standard tool used within the AMReX-community is Amrvis, a package developed and supported by CCSE that is designed specifically for highly efficient visualization of block-structured hierarchical AMR data.  (Amrvis can also be used to visualize performance data; see the :ref:`Chap:AMRex-based Profiling Tools` chapter for further details.) Plotfiles can also be viewed using the VisIt, ParaView, and yt packages.  Particle data can be viewed using ParaView.  Refer to Chapter on :ref:`Chap:Visualization` for how to use each of these tools. To assist users we have multiple example codes introducing AMReX functionality. They range from HelloWorld walk-thrus to stand-alone examples of complex features in practice. To access the available examples, please see `AMReX Guided Tutorials and Example Codes <https://amrex-codes.github.io/amrex/tutorials_html/>`_. To build a 2D executable, go to ``amrex-tutorials/ExampleCodes/Basic/HeatEquation_EX1_C/Exec`` and type ``make DIM=2``. This will generate an executable named ``main2d.gnu.ex``. To run it, type, Users new to AMReX may be interested in following the `Guided Tutorials`_. The Guided Tutorials are designed to provide an introduction to AMReX features by focusing on key concepts in a progressive way. Visualization We now look at a more complicated example at ``amrex-tutorials/ExampleCodes/Basic/HeatEquation_EX1_C`` and show how simulation results can be visualized. This example solves the heat equation, You build the code in the ``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/`` directory. Typing ``make`` will start the compilation process and result in an executable named ``main3d.gnu.DEBUG.ex``. The name shows that the GNU compiler with debug options set by AMReX is used.  It also shows that the executable is built for 3D. Although this simple example code is dimension independent, dimensionality does matter for all non-trivial examples. The build process can be adjusted by modifying the ``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/GNUmakefile`` file.  More details on how to build AMReX can be found in :ref:`Chap:BuildingAMReX`. \frac{\partial\phi}{\partial t} = \nabla^2\phi

 \phi_{i,\,j}^{n+1} = \phi_{i,\,j}^n
+ \frac{\Delta t}{\Delta x}\left(F_{i+^1\!/_2,\,j}-F_{i-^1\!/_2,\,j}\right)
+ \frac{\Delta t}{\Delta y}\left(F_{i,\,j+^1\!/_2}-F_{i,\,j-^1\!/_2}\right) and then taking the divergence to update the cells, using forward Euler temporal integration on a periodic domain.  We could use a 5-point (in 2D) or 7-point (in 3D) stencil, but for demonstration purposes we spatially discretize the PDE by first constructing (negative) fluxes on cell faces, e.g., Project-Id-Version: amrex 23.00-dev
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
 AMReX也可以通过Spack（https://spack.io/）获取。假设您已经安装了Spack，只需输入``spack install amrex``即可。有关更多信息，请参阅构建AMReX中的:ref:`sec:build:spack`部分。 构建和运行代码 构建代码 下载代码。 示例代码 示例：热传导方程求解器 示例：Hello World F_{i+^1\!/_2,\,j} = \frac{\phi_{i+1,j}-\phi_{i,j}}{\Delta x}, 指导教程 如果编译失败，可以参考 :ref:`Chap:BuildingAMReX` 获取有关如何配置构建系统的更多详细信息。*可选的*命令行参数 ``amrex.v=1`` 将 AMReX 的详细程度设置为 1，以打印使用的 MPI 进程数量。默认的详细程度为 1，可以使用 ``amrex.v=0`` 来关闭打印。有关运行时参数处理的更多详细信息，请参阅 :ref:`sec:basics:parmparse` 章节。 如果你想使用OpenMP进行构建，请输入命令``make USE_OMP=TRUE``。这将生成一个名为``main3d.gnu.DEBUG.OMP.ex``的可执行文件。请注意文件名中的OMP标识。确保你的系统上设置了``OMP_NUM_THREADS``环境变量。然后你可以运行该可执行文件。 在GNUmakefile中，存在针对DEBUG模式（更少优化的代码，但具有更多错误检查）、维度、编译器类型以及启用MPI和/或OpenMP并行性的编译选项。如果某个参数有多个实例，则以最后一个实例为准。 请注意，该命令采用一个文件 ``inputs_2d``。该计算使用 :math:`256\times 256` 单元格的计算域求解2d热传导方程。它运行 :math:`10000` 步，并每 :math：`1000` 步生成一个绘图文件。当运行完成后，您将在运行的目录中有许多绘图文件，`plt00000、plt01000、``等。您可以通过设置运行时参数来控制这些参数，例如运行多少时间步以及写入绘图文件的频率在``inputs_2d.`` 请注意，您可以同时使用``USE_MPI=TRUE``和``USE_OMP=TRUE``进行构建。然后您可以运行， 现在让我们通过输入“make USE_MPI=TRUE”来使用MPI构建（或者您可以在GNUmakefile中设置“USE_MPI=TRUE”）。这将生成一个名为“main3d.gnu.DEBUG.MPI.ex”的可执行文件。请注意文件名中的MPI。然后您可以运行该文件。 并行化 运行代码 示例代码可以按以下方式运行： 代码的实现细节在Guided Tutorials的`热方程`示例部分进行了讨论。现在，让我们先构建并运行代码，然后可视化结果。 这个简短示例的main函数三个语句。通常，每个程序的 :cpp:`int main(...)` 函数的第一个和最后一个语句应分别调用 :cpp:`amrex::Initialize` 和 :cpp:`amrex::Finalize`。第二个语句调用 :cpp:`amrex::Print` 打印一个字符串，其中包含 :cpp:`amrex::Version` 函数返回的 AMReX 版本。示例代码包含两个 AMReX 头文件。请注意，所有 AMReX 头文件的名称都以 ``AMReX_`` 开头（或者在 AMReX.H 的情况下只是 AMReX）。所有 AMReX 的 C++ 函数都在 :cpp:`amrex` 命名空间中。 结果可能如下所示： 源代码可在https://github.com/AMReX-Codes/amrex获取。GitHub仓库是我们的主要开发仓库。开发分支包含了代码的最新状态，并且每月以版本号YY.MM（例如，17.04）的形式进行发布。版本号中的MM部分每个月递增，YY部分每年递增。Bug修复版本以YY.MM.patch（例如，17.04.1）的形式进行标记。 这个示例的源代码位于``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/``，同时也在下面展示出来。 版本字符串表示当前提交的哈希值为5775aed933c4（请注意，哈希值中的首字母g不是哈希的一部分），基于17.05版本，并有30个额外的提交。AMReX工作目录有未提交的更改，即工作目录不干净。 有几种可用于AMReX plotfiles的可视化工具。在AMReX社区中，一个常用的标准工具是Amrvis，这是一个由CCSE开发和支持的软件包，专门用于高效可视化块结构分层AMR数据。（Amrvis也可以用于可视化性能数据；有关详细信息，请参阅:ref:`Chap:AMRex-based Profiling Tools`章节。）Plotfiles还可以使用VisIt、ParaView和yt软件包进行查看。使用ParaView可以查看粒子数据。有关如何使用这些工具的详细信息，请参阅:ref:`Chap:Visualization`章节。 为了帮助用户，我们提供了多个示例代码来介绍AMReX的功能。这些示例代码涵盖了从HelloWorld的演示到实际复杂功能的独立示例。要访问可用的示例，请参阅AMReX指导教程和示例代码（链接：<https://amrex-codes.github.io/amrex/tutorials_html/>）。 要构建一个二维可执行文件，请转到``amrex-tutorials/ExampleCodes/Basic/HeatEquation_EX1_C/Exec``并输入``make DIM=2``。这将生成一个名为``main2d.gnu.ex``的可执行文件。要运行它，请输入： 对于刚接触AMReX的用户来说，他们可能对`Guided Tutorials`感兴趣。这些指导教程旨在通过逐步介绍关键概念，为用户提供对AMReX功能的入门。 可视化 我们现在来看一个更复杂的示例，位于``amrex-tutorials/ExampleCodes/Basic/HeatEquation_EX1_C``，并展示如何可视化模拟结果。这个示例解决了热传导方程。 你需要在``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/``目录下构建代码。输入``make``命令将开始编译过程，并生成一个名为``main3d.gnu.DEBUG.ex``的可执行文件。文件名表明使用了带有AMReX调试选项的GNU编译器。它还表明可执行文件是为3D构建的。尽管这个简单的示例代码是与维度无关的，但对于所有非琐碎的示例来说，维度确实很重要。构建过程可以通过修改``amrex-tutorials/ExampleCodes/Basic/HelloWorld_C/GNUmakefile``文件来进行调整。有关如何构建AMReX的更多详细信息，请参阅:ref:`Chap:BuildingAMReX`。 \frac{\partial\phi}{\partial t} = \nabla^2\phi \phi_{i,\,j}^{n+1} = \phi_{i,\,j}^n
+ \frac{\Delta t}{\Delta x}\left(F_{i+^1\!/_2,\,j}-F_{i-^1\!/_2,\,j}\right)
+ \frac{\Delta t}{\Delta y}\left(F_{i,\,j+^1\!/_2}-F_{i,\,j-^1\!/_2}\right) 然后通过取差来更新单元。 在一个周期性的区域上使用前向欧拉时间积分。我们可以使用5点（在2D中）或7点（在3D中）的模板，但为了演示目的，我们首先通过在单元格面上构建（负）通量来对PDE进行空间离散化，例如， 