% wvwcdocs.cls
%
% A LaTeX2e document class for lecture notes, research diaries,
% homework assignments and exams in several mathematics courses at
% West Virginia Wesleyan College.

%% wvwcdocs.cls
%% Copyright (c) 2026 Jesse Oldroyd
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%
% This work consists of the files wvwcdocs.cls and wvwcmath.sty.

%%% Jesse Oldroyd
%%% Department of Mathematics and Computer Science
%%% West Virginia Wesleyan College
%%% Buckhannon, WV 26201
%%% oldroyd.j@wvwc.edu

\def\fileversion{0.2}
\def\filedate{2026/10/14}

% =====================================%
% This class and associated style file are built around Philip
% Hirschhorn's excellent exam.cls LaTeX class.  The thorough
% documentation provided is particularly relevant to the documentation
% provided here.  Please see http://www-math.mit.edu/~psh/ for the
% latest version of the exam class.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvwcdocs}[\filedate\space Version \fileversion]

\RequirePackage{etoolbox}
\newbool{pfont}
\newbool{pfontXTX}
\newbool{lectureTF}

%==========================================%
%           User provided inputs           %
%==========================================%
% Adapated from discussion at https://tex.stackexchange.com/questions/97881/how-to-make-an-automatic-title-head-in-my-own-class-but-with-some-user-definable
\newcommand{\@course}{}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\@bookchapter}{}
\newcommand{\bookchapter}[1]{\gdef\@bookchapter{#1}}
\newcommand{\@chaptertopic}{}
\newcommand{\chaptertopic}[1]{\gdef\@chaptertopic{#1}}
\newcommand{\@name}{}
\newcommand{\name}[1]{\gdef\@name{#1}}
\newcommand{\@diarytype}{}
\newcommand{\diarytype}[1]{\gdef\@diarytype{#1}}
\newcommand{\@topic}{}
\newcommand{\topic}[1]{\gdef\@topic{#1}}
\newcommand{\@examnum}{}
\newcommand{\examnum}[1]{\gdef\@examnum{#1}}
\newcommand{\@examdate}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
% provide error messages if document info commands haven't been defined in preamble
\newcommand{\mycls@headerror}{%
	\ClassError{wvwcdocs}{This command must be in the preamble}{...}%
}

%===========================================%
%           Specify class options           %
%===========================================%
% Load different classes based on options.  See:
% https://tex.stackexchange.com/a/186253/60075
\def\myclasstype{exam} % default class

% Set a boolean variable to be true in order to use palatino fonts below.
% Requires etoolbox.
\DeclareOption{palatino}{
	\booltrue{pfont}
}

\DeclareOption{palatinoXTX}{%
	\booltrue{pfontXTX}
}

% Used for lecture notes.
\DeclareOption{lecture}{%
	\booltrue{lectureTF}
	\gdef\myclasstype{report}
}

% Used for research journals
\DeclareOption{diary}{%
	\AtBeginDocument{%
		% These commands set up the running header on the top of the exam pages
		\pagestyle{headandfoot}
		\header{\textsc{\@name}}{\textsc{\@diarytype}}{\textsc{\@topic}}
		% \footer{\oddeven{}{\pointbox}}{}{\oddeven{\pointbox}{}}
		\headrule
		\extraheadheight{.5cm}
		% Check to see if document info commands are given after preamble
		% Uses \mycls@headerror to provide error message
		\let\name\mycls@headerror
		\let\diarytype\mycls@headerror
		\let\topic\mycls@headerror
	}
}
% Used for homework.
\DeclareOption{homework}{%
	\PassOptionsToClass{addpoints, twoside}{exam}
	\AtBeginDocument{%
		\pagestyle{headandfoot}
		% Allow horizontal rule under header for coverpage and main pages
		\coverheadrule
		\headrule
		% These commands set up the header for the cover page(s)
		\coverheader{\textsc{\@course}}{\textsc{\@examnum}}{\textsc{\@examdate}}
		% \firstpageheadrule
		% These commands set up the running header on the top of the main exam pages
		% Headers and footers make use of \oddeven to get page number to appear on outside of page
		\header{\oddeven{\textsc{\@examnum}}{\textsc{Page \thepage\ of \numpages}}}{}{\oddeven{\textsc{Page \thepage\ of \numpages}}{\textsc{\@examnum}}}
		% Clear footer
		\footer{}{}{}
		\extraheadheight{.5cm}
		% Check to see if document info commands are given after preamble
		% Uses \mycls@headerror to provide error message
		\let\course\mycls@headerror
		\let\examnum\mycls@headerror
		\let\examdate\mycls@headerror
		% Set point display for problems.
		\nopointsinmargin
	}
}
% Used for exams.
\DeclareOption{exam}{%
	\PassOptionsToClass{addpoints, twoside}{exam}
	\AtBeginDocument{%
		\pagestyle{headandfoot}
		% Allow horizontal rule under header for coverpage and main pages
		\coverheadrule
		\headrule
		% These commands set up the header for the cover page(s)
		\coverheader{\textsc{\@course}}{\textsc{\@examnum}}{\textsc{\@examdate}}
		% \firstpageheadrule
		% These commands set up the running header on the top of the main exam pages
		% Headers and footers make use of \oddeven to get page number and point box to appear on outside of page
		\header{\oddeven{\textsc{\@examnum}}{\textsc{Page \thepage\ of \numpages}}}{}{\oddeven{\textsc{Page \thepage\ of \numpages}}{\textsc{\@examnum}}}
		\footer{\oddeven{}{\pointbox}}{}{\oddeven{\pointbox}{}}
		\extraheadheight{.5cm}
		% Check to see if document info commands are given after preamble
		% Uses \mycls@headerror to provide error message
		\let\course\mycls@headerror
		\let\examnum\mycls@headerror
		\let\examdate\mycls@headerror
		% Set points.
		\marginpointname{}
		\pointformat{\fbox{\phantom{$ \sum $}/{\scriptsize \themarginpoints}}}
		\marginbonuspointname{}
		\pointstwosided
	}
}

% Assume all other options are sent to class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\myclasstype}}
\ProcessOptions\relax

% My setup for using exam class
\LoadClass{\myclasstype}

%=========================%
%  PACKAGES AND SETTINGS  %
%=========================%
% Load personal defaults
\RequirePackage{wvwcmath}
\usepackage[T1]{fontenc}

% Font settings for Palatino.
% If these are loaded before amssymb it causes an error
% see: https://tex.stackexchange.com/questions/564490/command-bbbk-already-defined-ol-bbbk-mathordamsb7c-when-i-try-t
\ifbool{pfont}{%
	\RequirePackage{newpxtext, newpxmath}
	\RequirePackage[%
		tracking=smallcaps,
		protrusion=true,
		expansion=false,
		verbose=silent]{microtype}
}

% We also need to ignore microtype if using XeLaTeX, so add an option for this.
\ifbool{pfontXTX}{%
	\RequirePackage{newpxtext, newpxmath}
}

% Fallback
\ifboolexpr{%
	not ( bool {pfont} or bool {pfontXTX} )
}
{%
	\RequirePackage{mlmodern}
	\RequirePackage{microtype}
}

% Marginalia settings
\ifbool{lectureTF}{%
	% ``no-text'' allows individual options to be set for XCharter as
	% below.  Note that xcharter-otf loads unicode-math by default
	\usepackage[no-text]{xcharter-otf}
	\setmainfont{XCharter}[scaled=.98, sups, osf]
	\setsansfont{cabin}[Scale=MatchLowercase, type1]
	\setmonofont{Inconsolatazi4}[scaled=1.04]

	\RequirePackage{%
		fancyhdr,
		keytheorems,
		marginalia
	}
	\RequirePackage[most]{tcolorbox}
	\definecolor{example-color}{HTML}{800000} % Red
	\definecolor{definition-color}{HTML}{008000} % Green
	\definecolor{theorem-color}{HTML}{000080} % Blue

	\renewkeytheoremstyle{plain}{%
		tcolorbox={colback=green!5!white, colframe=green!50!black,
				fonttitle=\bfseries,}
	}
	\renewkeytheorem{theorem}[%
		style=plain,
		parent=section,
		refname={Theorem, Theorems},
		Refname={Theorem, Theorems}
	]

	\renewkeytheoremstyle{definition}{%
		tcolorbox={colback=blue!5!white, colframe=blue!75!black, fonttitle=\bfseries},
		inherit-style=definition,
	}
	\renewkeytheorem{definition}[%
		style=definition,
		sibling=theorem,
		refname={Definition, Definitions},
		Refname={Definition, Definitions},
	]

	\newkeytheoremstyle{example}{%
		tcolorbox={colback=example-color!5!white, colframe=example-color!75!black, fonttitle=\bfseries},
		bodyfont=\normalfont,
	}
	\renewkeytheorem{example}[%
		style=example,
		sibling=definition,
		refname={Example, Examples},
		Refname={Example, Examples},
	]

	\newkeytheorem{solution}[qed=\( \triangle \)]

	\AtBeginDocument{%
		% These commands set up the running header on the top of the exam pages
		% \fancypagestyle{head}{%
		%     \fancyhead[L]{\textsc{\@course}}
		%     \fancyhead[C]{\textsc{\@bookchapter}}
		%     \fancyhead[R]{\textsc{\@chaptertopic}}
		% }
		% \pagestyle{head}
		\pagestyle{fancy}
		\fancyhead[LE]{\leftmark}
		\fancyhead[RE]{\rightmark}
		\fancyfoot[LE,RO]{\thepage}

		\listofkeytheorems[%
			ignoreall,
			numwidth=3em,
			show={theorem, definition},
			title={List of key results and definitions}
		]

		% Check to see if document info commands are given after preamble
		% Uses \mycls@headerror to provide error message
		\let\course\mycls@headerror
		\let\bookchapter\mycls@headerror
		\let\chaptertopic\mycls@headerror
	}
}

%==========================================%
%           DOCUMENT INFORMATION           %
%==========================================%
% Only relevant for assessments
% \nopointsinmargin
