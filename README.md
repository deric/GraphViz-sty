graphviz.sty - A LaTeX library for GraphViz
===============================================

graphviz.sty allows you to write GraphViz code directly in your LaTeX source.

Prerequisites
-------------

You must have the GraphViz program in your path. See http://graphviz.org for more details.

Installation
------------

Copy graphviz.sty to your texmf directory.

LaTeX distribution folder can be found
  * On Mac OS X with the MacTeX distribution: ~/Library/texmf/tex/latex
  * On Debian Linux it's usually: /usr/share/texmf-texlive/tex/latex/

1. Copy graphviz.sty to you LaTeX distribution folder
2. run 
    $ texhash

Usage
-----
Add the following lines to your preamble:

    \usepackage[pdftex]{graphicx}
    \usepackage{graphviz}
    \usepackage{pdftexcmds}
    \usepackage{pgfkeys}
    \usepackage{environ}
    \usepackage{ifthen}

If the options "[pdflatex]" is causing troubles, replace it with 

    \PassOptionsToPackage{pdftex}{graphicx}
    \usepackage{graphicx}

graphviz.sty supports two environments (which produces oriented graphs):

    \begin{digraph}[scale=0.5]{MyDiGraph}
	rankdir=LR; 
	a->b; 
	b->c;
    \end{digraph}

and `graph` for non-oriented graphs:

    \begin{graph}{MyGraph}
	a--b; 
	b--c;
    \end{graph}

Parameters to `digraph` environment:

1. optional parameters: 
    * `scale` -- default value is "scale=1"
    * `layout` -- for changing graphviz layout filter  (possible values "layout=dot|neato|twopi|circo|fdp|sfdp" see graphviz documentation for more details), default is "layout=dot"
    * `output` -- default is `pdf`,  you can use "output=ps|png|pdf" or which everformat \includegraphics supports. When output is `tex` graph is converted with `dot2tex` tool (you have to add `tikz` package to your preamble) -- this is an experimental feature
2. name of the digraph

To include an external GraphViz dot file named mydotfile.dot:

    \includedot[scale=0.5]{mydotfile}

Parameters to \includedot:

1. optional parameters (default value is "scale=1") or you can use "layout=twopi"
for changing graphviz filter  (possible values "layout=dot|neato|twopi|circo|fdp|sfdp" see graphviz documentation for more details)
default is "layout=dot"
Last supported option is "output", you can use "output=ps|png|pdf" or which everformat \includegraphics supports (default if "output=pdf")
2. name of the dot file (w/out file extension, which must be ".dot")

You must use the `-shell-escape` option to pdflatex. This enables LaTeX to execute system commnds which is for security reasons disabled by default.

    $ pdflatex -shell-escape *.tex

If you are having problems with generating output see LaTeX *.log for this:

    runsystem(bash -c "dot -Tpdf graph1.dot > graph1.pdf")...executed.

Using regular LaTeX
-------------------

To modify this command for regular LaTeX change output to ps

    \begin{digraph}[output=ps]{MyGraph}
	rankdir=LR; 
	a->b; 
	b->c;
    \end{digraph}

   
Contributors
------------

graphviz.sty is based on graphviz.tex by Derek Rayside (2003).

2006-03-25:

graphviz.sty by [Mark Aufflick](mailto:mark@aufflick.com)

Website: [http://mark.aufflick.com/](http://mark.aufflick.com/)

2011-02-21:

Modified by [Mike Prentice](mailto:mjp44@buffalo.edu) to
use PDF output directly from dot.

Added includedot layout.

2012-02-17:

* Improved check for generated file, allowed backslash and other "unsafe" characted in digraph code
* Added output option
* changed \digraph command to `digraph` and `graph` environment which follows much more LaTeX conventions
* supports conversion with `dot2tex`
by [Tomas Barton](mailto:barton.tomas@gmail.com)
