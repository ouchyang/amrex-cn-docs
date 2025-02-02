��          4               L      M   Q  _   v  �     (  �  7   Fortran Interface The core of AMReX is written in C++. For Fortran users who want to write all of their programs in Fortran, AMReX provides Fortran interfaces around most of functionalities except for the :cpp:`AmrLevel` class (see the chapter on :ref:`Chap:AmrLevel`) and particles (see the chapter on :ref:`Chap:Particles`). We should not confuse the Fortran interface in this chapter with the Fortran kernel functions called inside :cpp:`MFIter` loops in codes (see the section on :ref:`sec:basics:fortran`). For the latter, Fortran is used in some sense as a domain-specific language with native multi-dimensional arrays, whereas here Fortran is used to drive the whole application code. In order to better understand AMReX, Fortran interface users should read the rest of the documentation except for the Chapters on :ref:`Chap:AmrLevel` & :ref:`Chap:Particles`. Project-Id-Version: amrex 23.00-dev
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
 Fortran 接口 AMReX的核心是用C++编写的。对于希望完全使用Fortran编写程序的Fortran用户，AMReX提供了Fortran接口，覆盖了大部分功能，除了:cpp:`AmrLevel`类（请参阅:ref:`Chap:AmrLevel`章节）和粒子（请参阅:ref:`Chap:Particles`章节）。我们不应该将本章中的Fortran接口与代码中:cpp:`MFIter`循环内调用的Fortran内核函数混淆（请参阅:ref:`sec:basics:fortran`节）。对于后者，Fortran在某种程度上被用作具有本地多维数组的领域特定语言，而在这里，Fortran用于驱动整个应用程序代码。为了更好地理解AMReX，Fortran接口用户应该阅读除了:ref:`Chap:AmrLevel`和:ref:`Chap:Particles`章节之外的其他文档内容。 