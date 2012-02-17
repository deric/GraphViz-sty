graphviz.sty - A LaTeX library for GraphViz dot
===============================================

graphviz.sty lets you include GraphViz dot files directly in your LaTeX source.

graphviz.sty is currently only compatible with pdflatex.

Prerequisites
-------------

You must have the GraphViz dot program in your path.

Installation
------------

Copy graphviz.sty to your texmf directory.

On Mac OS X with the MacTeX distribution:

1. Make folder ~/Library/texmf/tex/latex if it doesn't already exist.
2. Drag and drop graphviz.sty to that folder.

Or for the Terminally ill:

    $ mkdir -p ~/Library/texmf/tex/latex
    $ cp graphviz.sty ~/Library/texmf/tex/latex

Usage
-----

Add the following lines to your preamble:

    \usepackage[pdftex]{graphicx}
    \usepackage{graphviz}

If the options "[pdflatex]" is causing troubles, replace it with 

    \PassOptionsToPackage{pdftex}{graphicx}
    \usepackage{graphicx}

To include GraphViz dot syntax directly in your LaTeX source:

    \digraph[scale=0.5]{MyGraph}{rankdir=LR; a->b; b->c}

Parameters to \digraph:

1. optional parameters (default value is "scale=1") or you can use "command=twopi"
for changing graphviz filter  (possible values "command=dot|neato|twopi|circo|fdp|sfdp" see graphviz documentation for more details)
default is "command=dot"
2. name of the digraph
3. body of the digraph

To include an external GraphViz dot file named mydotfile.dot:

    \includedot[scale=0.5]{mydotfile}

Parameters to \includedot:

1. optional parameters (default value is "scale=1") or you can use "command=twopi"
for changing graphviz filter  (possible values "command=dot|neato|twopi|circo|fdp|sfdp" see graphviz documentation for more details)
default is "command=dot"
2. name of the dot file (w/out file extension, which must be ".dot")

You must use the `-shell-escape` option to pdflatex. This enables LaTeX to execute system commnds which is for security reasons disabled by default.

    $ pdflatex -shell-escape *.tex

If you are having problems with generating output see LaTeX log for this:

    runsystem(bash -c "dot -Tpdf graph1.dot > graph1.pdf")...executed.

Using regular LaTeX
-------------------

To modify this command for regular latex, replace all .pdf with .ps, and the
command becomes simply:

    dot -Tps #2.dot

   
Contributors
------------

graphviz.sty is based on graphviz.tex by Derek Rayside (2003).

2006-03-25:

graphviz.sty by [Mark Aufflick](mailto:mark@aufflick.com)

Website: [http://mark.aufflick.com/](http://mark.aufflick.com/)

2011-02-21:

Modified by [Mike Prentice](mailto:mjp44@buffalo.edu) to
use PDF output directly from dot.

Added includedot command.

2012-02-17:

Improved check for generated file by [Tomas Barton](mailto:barton.tomas@gmail.com)
