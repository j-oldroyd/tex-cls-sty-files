% wvwcslides.cls
%
% A LaTeX document class for creating presentations at West Virginia Wesleyan College.

% Copyright (c) 2026 Jesse Oldroyd
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version.
% The latest version of this license is in http://www.latex-project.org/lppl.txt and version 1.3 or later is part of all distributions of LaTeX version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%
% This work consists of the files wvwcslides.cls.

% =================== %
% CONTACT INFORMATION %
% =================== %
% Jesse Oldroyd
% Department of Mathematics and Computer Science
% West Virginia Wesleyan College
% Buckhannon, WV 26201
% oldroyd.j@wvwc.edu

\def\fileversion{0.0.1}
\def\filedate{2026/08/26}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvwcslides}[\filedate\space WVWC syllabus version \fileversion]

\LoadClass[%
	hyperref={colorlinks, citecolor=blue}
]{beamer}

\usepackage{unicode-math}
\usepackage{pgfplots}
\usepackage{listings}
\usepackage{qrcode}

% The code below is adapted from the style given in the following Overleaf article:
% https://www.overleaf.com/learn/latex/Code_listing
% Colors for syntax highlighting
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{pythonstyle}{
  backgroundcolor=\color{backcolour},
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2
}
\lstset{%
  language=python,
  numbers=left,
  style=pythonstyle,
}

\newfontfamily\Raleway[Ligatures=TeX]{Raleway}
\newfontfamily\Lato[Ligatures=TeX]{Lato}

\usefonttheme{professionalfonts}

\setsansfont{Lato}[
UprightFont=*-Regular,
ItalicFont=*-Italic,
BoldFont=*-Medium,
BoldItalicFont=*-MediumItalic
]

\setmathfont{Lete Sans Math}[
CharacterVariant={3, 6}, % varepsilon/varphi defaults
]

\setbeamercovered{transparent}
% \setbeameroption{show notes on second screen=right}

\setbeamerfont{headline}{family=\Raleway}
\setbeamerfont{headline title}{size=\Huge,series=\bfseries}
\setbeamerfont{headline author}{size=\Large}
\setbeamerfont{headline institute}{size=\normalsize}
\setbeamerfont{block title}{family=\Raleway,size=\large,series=\bfseries}
\setbeamerfont{heading}{family=\Lato,series=\bfseries}
\setbeamerfont{caption}{size=\small}
\setbeamerfont{footline}{family=\Raleway,size=\normalsize}

\usetheme{moloch}

\definecolor{wvwcorange}{HTML}{F05123}
\definecolor{wvwcgray}{HTML}{949CA1}
\definecolor{lightorange}{RGB}{255, 240, 230}
\definecolor{lightgray}{RGB}{240, 240, 240}

\molochset{%
  progressbar=foot,
  block=fill,
}

\molochcolors{%
  title separator=wvwcorange,
  progressbar bg=wvwcgray,
  progressbar fg=wvwcorange,
  frametitle bg=wvwcorange,
}

% Alert Block
\setbeamercolor{block title alerted}{fg=wvwcorange,bg=lightorange}
\setbeamercolor{block separator alerted}{bg=black}
\setbeamercolor{block body alerted}{fg=black,bg=lightorange}

% Example Block
\setbeamercolor{block title example}{fg=wvwcorange,bg=lightorange}
\setbeamercolor{block separator example}{bg=black}
\setbeamercolor{block body example}{fg=black,bg=lightorange}

% Itemize
\setbeamercolor{item}{fg=wvwcorange}

\NewDocumentCommand{\rlang}{}{\textsf{R}}
\NewDocumentCommand{\pythonlang}{}{\textsf{Python}}

\usepackage[%
citestyle=numeric,
sorting=none,
natbib,
]{biblatex}

\titlegraphic{\hfill\includegraphics[width=3.5cm]{W_mountain-eps-converted-to.pdf}}
