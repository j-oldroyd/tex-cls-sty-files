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

\def\fileversion{0.2}
\def\filedate{2026/08/04}

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
\newcommand{\@credits}{}
\newcommand{\credits}[1]{\gdef\@credits{#1}}
\newcommand{\@termstart}{}
\newcommand{\termstart}[1]{\gdef\@termstart{#1}}
\newcommand{\@termend}{}
\newcommand{\termend}[1]{\gdef\@termend{#1}}

\RequirePackage{graphics}
\RequirePackage{afterpage}
\RequirePackage{tabularx}
\RequirePackage{xcolor}
\RequirePackage{changepage}

% This class extends the article class primarily to take advantage of tagged PDF compatibility.
\LoadClass[11pt]{article}

% ============ %
% CLASS MACROS %
% ============ %
% The code below is adapted from
% https://tex.stackexchange.com/a/40051/60075
\definecolor{headingorange}{RGB}{247, 230, 215}
\definecolor{wvwcorange}{HTML}{F05123}

\usepackage{titlesec}
\titleformat{name=\section}[block]
{\bfseries\large}
{}
{0pt}
{\colorsection}
{}
\titlespacing*{\section}{9bp}{9bp}{-9bp}
\titlespacing*{\subsection}{0.25in}{12pt}{6pt}
\newcommand{\colorsection}[1]{%
	\colorbox{headingorange}{%
		\parbox[][18bp][c]{\dimexpr\textwidth-2\fboxsep}{\hspace{9bp}#1\vphantom{27bp}}
	}
}

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
	\fancyhead[C]{%
		\vspace{-\baselineskip}
		\par
		\includegraphics{wvwclogo.jpg}
		\vspace{\baselineskip}
		\par
		{\Large \textbf{Course Syllabus} \par}
	}
	\renewcommand{\headrulewidth}{.05in}
	\let\oldheadrule\headrule
	\renewcommand{\headrule}{\color{wvwcorange}\oldheadrule}
	\fancyfoot[C]{\@course{} Syllabus, Page~\thepage}
}

% Remaining page headfoot
\fancyhf{}
\fancyfoot[C]{\@course{} Syllabus, Page~\thepage}

\usepackage{hyperref} % Load this after loading class to avoid conflict
\hypersetup{%
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,
	urlcolor=cyan,
}

\AtBeginDocument{%
	\thispagestyle{firstpage}
	\newgeometry{%
		top = 0.5in,
		bottom = 0.5in,
		left = 0.7in,
		right = 0.7in,
		includeheadfoot,
		headheight = 2.25in,
	}
	\afterpage{\aftergroup\restoregeometry}

	\begin{center}
		{\large \textbf{\@course{}: \@coursetitle{}}}

		{\large \textbf{\@term{} | \@credits{} credit(s)}}

		{\large \textbf{\@termstart{}--\@termend{}}}
	\end{center}

		{\noindent\large \textbf{Instructor \& Course Details}}

	\begin{center}
		\begin{tabularx}{6.625in}{lXl}
			\textbf{Instructor:} Jesse Oldroyd &  &                              \\
			\textbf{Email:}                    &  & \textbf{Phone:} 304-473-8339 \\ % TODO: enter email
			\textbf{Office Location:} CHS 125  &  & \textbf{Office Hours}        \\ % TODO: enter office hours
			\textbf{Modality of Course:}       &  &                              \\ % TODO: enter modality of course
			\textbf{Days and Times of Class:}  &  &                              \\ % TODO: enter meeting times
			\textbf{Building and Room:}        &  &                              \\ % TODO: enter class location
		\end{tabularx}
	\end{center}
}
