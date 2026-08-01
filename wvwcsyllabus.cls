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

%% Contact information:
% Jesse Oldroyd
% Department of Mathematics and Computer Science
% West Virginia Wesleyan College
% Buckhannon, WV 26201
% oldroyd.j@wvwc.edu

\def\fileversion{0.0}
\def\filedate{2026/07/31}



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvwcsyllabus}[\filedate\space Version \fileversion]

\RequirePackage{etoolbox}
\newbool{pfont}
\newbool{pfontXTX}

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
