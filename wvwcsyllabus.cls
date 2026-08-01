% wvwcsyllabus.cls
%
% A LaTeX document class for creating syllabi at West Virginia Wesleyan College.

% Copyright (c) 2026 Jesse Oldroyd
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version.
% The latest version of this license is in http://www.latex-project.org/lppl.txt and version 1.3 or later is part of all distributions of LaTeX version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%
% This work consists of the files wvwcsyllabus.cls.

% =================== %
% CONTACT INFORMATION %
% =================== %
% Jesse Oldroyd
% Department of Mathematics and Computer Science
% West Virginia Wesleyan College
% Buckhannon, WV 26201
% oldroyd.j@wvwc.edu

\def\fileversion{0.0}
\def\filedate{2026/07/31}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvwcsyllabus}[\filedate\space WVWC syllabus version \fileversion]

% =========== %
% USER INPUTS %
% =========== %
\newcommand{\@course}{}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\@coursetitle}{}
\newcommand{\coursetitle}[1]{\gdef\@coursetitle{#1}}
\newcommand{\@term}{}
\newcommand{\term}[1]{\gdef\@term{#1}}

\RequirePackage{graphics}
\RequirePackage{afterpage}

% This class extends the article class primarily to take advantage of tagged PDF compatibility.
\LoadClass[11pt]{article}

% ===== %
% FONTS %
% ===== %
% The code below assumes that Arial is already installed on the system.
% If not, then the uarial package will need to be setup separately.
\usepackage{fontspec}
\setmainfont{arial}

% =========== %
% PAGE LAYOUT %
% =========== %
\usepackage[%
top = 0.5in,
bottom = 0.5in,
left = 0.7in,
right = 0.7in,
includeheadfoot,
showframe,
]{geometry}

\usepackage{fancyhdr}
\pagestyle{fancy}

% First page headfoot style.
\fancypagestyle{firstpage}{%
  \fancyhead[C]{\vspace{-\baselineskip} \par \includegraphics{wvwclogo.jpg} \vspace{\baselineskip} \par {\Large \textbf{Course Syllabus} \par}}
  \fancyfoot[C]{\@course{} Syllabus, Page~\thepage}
}

% Remaining page headfoot
\fancyfoot[C]{\@course{} Syllabus, Page~\thepage}

\AtBeginDocument{%
  \thispagestyle{firstpage}
  \newgeometry{%
    top = 0.5in,
    bottom = 0.5in,
    left = 0.7in,
    right = 0.7in,
    includeheadfoot,
    headheight = 2.25in}
  \afterpage{\aftergroup\restoregeometry}

  \begin{center}
    {\large \textbf{\@course{}: \@coursetitle{}}}
    \par
    {\large \textbf{\@term{} | 3 credits}}
  \end{center}
  }
