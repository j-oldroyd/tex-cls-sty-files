% This class file is a slightly modifed version of the UIdaho thesis template
% created by Matthew Singer, oringally accessed in 2015. See
% https://www.overleaf.com/latex/templates/university-of-idaho-thesis-and-dissertation-template/vsbrhrybkthx
% for a current version of that class file. The Creative Commons CC BY
% 4.0 license applies to this file:
% http://creativecommons.org/licenses/by/4.0

% Differences: removed Minion Pro option. Changed ``major professor'' to
% ``advisor.'' Included WVWC logo. Changed dissertation language to
% senior project language\@. Adjusted advisor/committee and month/year
% formatting. Changed formatting of TOC\@.  Changed chapter title
% positioning. Changed section title formatting.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvwcthesis}[2023/05/24 wvwcthesis.cls]

\RequirePackage{setspace}

% This is somewhere between \doublespacing and \onehalfspacing
\newcommand{\textspacing}{\setstretch{1.45}}
\setlength{\parskip}{.2ex plus1pt} % threequarters

\DeclareOption{singlespace}{%
    \typeout{Using single spacing}%
    \renewcommand{\textspacing}{\singlespacing}}
\DeclareOption{onehalfspace}{%
  \typeout{Using one-and-a-half spacing}%
  \renewcommand{\textspacing}{\onehalfspacing}}
\DeclareOption{doublespace}{%
    \typeout{Using double spacing}%
    \setlength{\parskip}{.6ex plus1pt}
    \renewcommand{\textspacing}{\doublespacing}}

\newif\ifversioninfo\versioninfofalse

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{report}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{report}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{versioninfo}{\versioninfotrue}

\ProcessOptions\relax

\LoadClass[letterpaper]{report}

%% PAGE LAYOUT
\RequirePackage[top=2.54cm, bottom=2.54cm, left=3.05cm, right=2.54cm]{geometry}

% Make use of Palatino fonts for text/math
\RequirePackage[osf]{mathpazo}
\def\textssc{\textsc}
\def\sscshape{\scshape}
\RequirePackage[tracking=smallcaps,protrusion=true,expansion=false,verbose=silent]{microtype}


\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage[toc,eqno,enum,bib]{tabfigures}

\RequirePackage[overload]{textcase}
\RequirePackage[protrusion=true,expansion=false,verbose=silent]{microtype}
\DeclareRobustCommand{\spacedsmallcaps}[1]{\textls[50]{\scshape{#1}}}%
\DeclareRobustCommand{\spacedallcaps}[1]{\textssc{\MakeTextUppercase{#1}}}
\DeclareRobustCommand{\spacedlowcaps}[1]{\textssc{\MakeTextLowercase{#1}}}

% Header and footer:
% All pages with number in bottom right
% Non-"plain" pages: chapter number in top right
% Page numbering in lowercase roman during front-matter
\usepackage{gitinfo}
\RequirePackage{fancyhdr}
\pagestyle{plain}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RO,RE]{\footnotesize\thepage}
\ifversioninfo
\fancyfoot[RO,RE]{\footnotesize\gitAuthorDate~(\gitAbbrevHash)}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[LE,RO]{\footnotesize\thepage}
  \fancyfoot[LO,RE]{\footnotesize\gitAuthorDate~(\gitAbbrevHash)}}
\else
\fancypagestyle{plain}{\fancyhf{}\fancyhead[LE,RO]{\footnotesize\thepage}}
\fi
\pagenumbering{roman}

% Titles for front matter...hard to get the way I want it...
% \renewcommand{\chaptermark}[1]{%
%   \markboth{#1}{}}
%\renewcommand{\chaptermark}[1]{\markboth{\spacedlowcaps{#1}}{\spacedlowcaps{#1}}}
%\fancyhead[LE,RO]{\footnotesize{\chaptermark}}
%\fancyhead[LE,RO]{\textssc{\footnotesize{\MakeTextLowercase{\leftmark}}}}
% \usepackage{nameref}
% \fancyhead[LE,RO]{\footnotesize{\spacedsmallcaps{\chaptername}}}

% This will set the page numbering to arabic and include the chapter
% number in the right header for the main body of the text.
\newcommand{\mainbody}{\clearpage%
  \pagenumbering{arabic}}%
%  \fancyhead[LE,RO]{\footnotesize{\spacedsmallcaps{chapter \thechapter}}}}
%\rhead{\footnotesize{\spacedsmallcaps{Chapter \thechapter}}}}
%\fancyhead[LE,RO]{\footnotesize{\spacedsmallcaps{\MakeTextLowercase{\leftmark}}}}
%\fancyhead[LE,RO]{\footnotesize{\spacedsmallcaps{\nouppercase{\leftmark}}}}

% This prevents entries breaking over pages, which leads to a ragged
% bottom.  Not sure which is better/worse.
\AtBeginEnvironment{thebibliography}{\interlinepenalty=10000}
\newcommand{\formatbibliography}{\clearpage%
  \singlespacing
}
%  \fancyhead[LE,RO]{\footnotesize{\spacedsmallcaps{bibliography}}}}

\newcommand{\formatappendices}{\clearpage%
  \textspacing
  \appendix
  \renewcommand\thechapter{\textsc{\alph{chapter}}}
  % This adds an "Appendix" in the TOC.
  \phantomsection
  \addcontentsline{toc}{chapter}{Appendices}
   \fancyhead[RO,RE]{\footnotesize\thepage}}

\newcommand{\allcontents}{
\singlespacing
\hyphenpenalty=10000
\tableofcontents
\listoftables
\listoffigures
\hyphenpenalty=3000
\textspacing
}

%% TITLE PAGE
\def\previousdegrees{\gdef\@previousdegrees}
\def\degreetitle{\gdef\@degreetitle}

\def\faculty{\gdef\@faculty}
\def\department{\gdef\@department}
\def\institution{\gdef\@institution}
\def\campus{\gdef\@campus}
\def\advisor{\gdef\@advisor}
\def\committeeA{\gdef\@committeeA}
\def\committeeB{\gdef\@committeeB}
\def\committeeC{\gdef\@committeeC}
\def\admin{\gdef\@admin}

\def\month{\gdef\@month}
\def\year{\gdef\@year}

% Defaults:
\def\@institution{University of Idaho}
\def\@faculty{College of Graduate Studies}
\def\@campus{Moscow}
\def\@advisor{Big Deal, Ph.D.}
\def\@committeeA{Another Big Shot, Ph.D.}
\def\@committeeB{Challenged Your Ideas, Ph.D.}
\def\@committeeC{Always Forget Their Name, Ph.D.}
\def\@admin{Signed Paperwork, Ph.D.}

\def\maketitle{
\thispagestyle{empty}
\singlespacing
\begin{center}
  \phantom{}\vspace{40pt}
  {\LARGE\spacedsmallcaps{\@title}\\}
  \bigskip\bigskip\bigskip
  \includegraphics[scale=.5]{W_mountain.eps}
  \bigskip\bigskip\bigskip

%   \textit{Presented in Partial Fulfillment of}\\
%   \textit{the Requirements for the Degree of}\\[12pt]
  {\large Senior Research Project\\[12pt]}
  \textit{in the}\\[12pt]
  {Department of \@department\\[12pt]
   \textit{at}\\[12pt]
%     \@faculty\\[12pt]
    \@institution\\}
  \bigskip\bigskip\bigskip%\bigskip

%   \textit{by}\\[12pt]
  {\large\textsc\@author\\[12pt]}
  \bigskip

%  \@month\ \@year\\[12pt] Original position of month/year.

  \textit{Faculty Advisor}\\
  {\textsc\@advisor}\\[12pt]
%   \textit{Committee}\\
%   {\textsc\@committeeA}\\
%   {\textsc\@committeeB}\\
%   {\textsc\@committeeC}\\[12pt]
%   \textit{Department Administrator}\\
%   {\textsc\@admin}\\[12pt]
% This is new stuff to make COGS happy
\bigskip

  {\textssc\@month\ \@year}\\[12pt]

\end{center}
\textspacing
\newpage
}
%% TABLE OF CONTENTS:

% tocbibind: cause list of figures, tables in the toc
% CoGS apparently now require the ToC to be itself listed in the ToC,
% which seems redundant (why would you look for the ToC in the ToC?)
\RequirePackage{tocbibind}
\setcounter{tocdepth}{1}

% CoGS requires the Table of Contents to be labelled
% "Table of Contents" and not "Contents"
\renewcommand{\contentsname}{Table of Contents}

% The entire toc situation is a bit of a pain, and could be nicer to
% rewrite.

% Dotted leaders for TOC
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]%
{\addvspace{.7pc}}{\sc\makebox[0pt][r]{\thecontentslabel\enspace}}%
{\sc}{\titlerule*[1pc]{.}\contentspage}

% Prefix list of figures/tables with "Figure" and Table"
% Both of the labels should comfortably fit into 5.5em.

\titlecontents{figure}[5.5em]{}{%
  \makebox[0pt][l]{\hspace*{-5.5em}\sc Figure \thecontentslabel\enspace}}%
{}{\titlerule*[1pc]{.}\contentspage}

\titlecontents{table}[5.5em]{}{%
  \makebox[0pt][l]{\hspace*{-5.5em}\sc Table \thecontentslabel\enspace}}%
{}{\titlerule*[1pc]{.}\contentspage}

\RequirePackage[labelfont={sc}]{caption}

%% HEADINGS
\RequirePackage[raggedright]{titlesec}
\RequirePackage{numname}


\titleformat{\chapter}[display]%
{\relax}{\flushright\spacedsmallcaps{\chaptertitlename{} \thechapter}}{0pt}%
{\onehalfspacing\raggedright\large\spacedsmallcaps}[\normalsize\vspace*{.8\baselineskip}\titlerule]%

% The code above sets the "chapter" marker flush right, which looks
% nice.
% \titleformat{\chapter}[display]%
% {\relax}{\flushleft\spacedsmallcaps{\chaptertitlename{} \thechapter}}{3pt}%
% {\onehalfspacing\raggedright\large\spacedsmallcaps}[\normalsize\vspace*{.8\baselineskip}\titlerule]%


% Can't get spaced sc here
%\titleformat*{\section}{\raggedright\singlespace\large\sscshape}
% The classicthesis version won't allow singlespace/raggedright, which
% is still needed unless I shrink some titles...
\titleformat{\section}
{\singlespacing\raggedright}{\large\textssc{\MakeTextLowercase{\thesection}}}{1em}
{\large\spacedsmallcaps}

\titleformat{\subsection}
{\sscshape}{\MakeTextLowercase{\thesubsection}}{1em}%
{\normalfont\normalsize\itshape}
\titleformat{\subsubsection}[runin]{\normalfont\sc}{}{0pt}{}[\hspace{1.2ex}---]

\titlespacing*{\chapter}{0pt}{-1.5\baselineskip}{1.2\baselineskip}
\titlespacing*{\section}{0pt}{1\baselineskip}{.25\baselineskip}
\titlespacing*{\subsection}{0pt}{1\baselineskip}{.25\baselineskip}

%% MISC OTHER:

% Smart references
% \RequirePackage{prettyref}
% \newrefformat{chap}{Chapter~\ref{#1}}
% \newrefformat{fig}{Figure \ref{#1}}
% \newrefformat{tab}{Table \ref{#1}}

\usepackage{refstyle}
% Capitalise figure references like so:
%\renewcommand{\figref}{\Figref}

% Subtle hyperlinking
\usepackage[colorlinks,citecolor=black,linkcolor=black,urlcolor=black]{hyperref}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

% A very simple abstract environment that omits the title.
%\renewenvironment{abstract}{\begin{quote}}{\end{quote}}
\renewenvironment{abstract}{\section{Summary}}{}

% From fancyhdr documentation, for empty rh pages:
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{plain}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage{natbib}
\setlength{\bibsep}{.75ex}


% TODO: Look here to reduce the insane whitespace that quotation has
% around it:
% http://tex.stackexchange.com/questions/29640/how-to-modify-spacing-around-quotation-environment
\newenvironment{quoteshrink}%
{\begin{quote}\singlespacing}%
{\end{quote}}

% \newenvironment{previouspaper}%
% {\par\vspace{.5ex}\noindent\frenchspacing\raggedright\ignorespaces}%
% {\par\vspace{.5ex}}

\newenvironment{previouspaper}%
{\vspace{-.3\baselineskip}\raggedright\list{}{\leftmargin=3.5em}\item[]}%
{\endlist\vspace{-.2\baselineskip}}

\newcommand{\lettherebespace}{\vspace{1.5ex}}

% One float per page, as per
% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=floatpages+vertposfp
\renewcommand\floatpagefraction{.001}
\setlength\@fpsep{\textheight}

% Verbatim control:
\usepackage{fancyvrb}
\DefineVerbatimEnvironment{Sinput}{Verbatim}{fontshape=sl,xleftmargin=1em,%
frame=none,baselinestretch=1,fontsize=\relsize{-.5}}
\DefineVerbatimEnvironment{Soutput}{Verbatim}{xleftmargin=1em,%
frame=none,baselinestretch=1,fontsize=\relsize{-.5}}
\DefineVerbatimEnvironment{Scode}{Verbatim}{fontshape=sl}
\fvset{listparameters={\setlength{\topsep}{0pt}}}
%\newenvironment{Schunk}{\vspace{\topsep}}{\vspace{\topsep}}
%\newenvironment{Schunk}{\vspace{\topsep}}{}
\newenvironment{Schunk}{\vspace{.67\baselineskip}}{\vspace{.33\baselineskip}}
\usepackage{tabularx}

% Hyphenatable code (doesn't always work manually though)
\newcommand\codeh[1]{\texttt{\hyphenchar\font=45\relax #1}}
% Allow \-/ hyphenation of already-hyphen\-/ated words
\usepackage[shortcuts]{extdash}

% CoGS wants continuously numbered footnotes:
\usepackage{chngcntr}
\counterwithout{footnote}{chapter}

% This is needed to stop some really weird paragraph spacing.
\raggedbottom
\widowpenalty=10000
\clubpenalty=10000

% Tame hyphenation
\hyphenpenalty=3000
\tolerance=200
% \lefthyphenmin4
% \righthyphenmin4

%%% Local Variables:
%%% TeX-master: "thesis.tex"
%%% TeX-PDF-mode: t
%%% End:
