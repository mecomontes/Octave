# **GNU OCTAVE**

GNU Octave is software featuring a High-level programming language, primarily intended for numerical computations. Octave helps in solving linear and nonlinear problems numerically, and for performing other numerical experiments using a language that is mostly compatible with MATLAB. It may also be used as a batch-oriented language. Since it is part of the GNU Project, it is free software under the terms of the GNU General Public License.

Octave is one of the major free alternatives to MATLAB, others being Scilab and FreeMat.Scilab, however, puts less emphasis on (bidirectional) syntactic compatibility with MATLAB than Octave does; and FreeMat has not had an update since June 2013.

## Technical details

*    Octave is written in C++ using the C++ standard library.
*    Octave uses an interpreter to execute the Octave scripting language.
*    Octave is extensible using dynamically loadable modules.
*    Octave interpreter has an OpenGL-based graphics engine to create plots, graphs and charts and to save or print them. Alternatively, gnuplot can be used for the same purpose.
*    Octave includes a Graphical User Interface (GUI) in addition to the traditional Command Line Interface (CLI); see #User interfaces for details.

## Data structures

Octave includes a limited amount of support for organizing data in structures. In this example, we see a structure "x" with elements "a", "b", and "c", (an integer, an array, and a string, respectively):

```
octave:1> x.a = 1; x.b = [1, 2; 3, 4]; x.c = "string";
octave:2> x.a
ans =  1
octave:3> x.b
ans =

   1   2
   3   4

octave:4> x.c
ans = string
octave:5> x
x =
{
  a =  1
  b =

     1   2
     3   4

  c = string
}
```

# Octave
