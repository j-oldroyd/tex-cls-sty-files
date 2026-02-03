% wvwcdocs.cls
%
% A LaTeX2e document class for lecture notes, research diaries,
% homework assignments and exams in several mathematics courses at
% West Virginia Wesleyan College.

%% wvwcdocs.cls
%% Copyright (c) 2025 Jesse Oldroyd
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

\def\fileversion{0.12}
\def\filedate{2025/5/14}

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
  % Set a boolean variable to be true in order to use palatino fonts below.
  % Requires etoolbox.
  \DeclareOption{palatino}{%
    \booltrue{pfont}
  }

  \DeclareOption{palatinoXTX}{%
    \booltrue{pfontXTX}
  }

  % Used for lecture notes.
    \DeclareOption{lecture}{%
      \AtBeginDocument{%
        % These commands set up the running header on the top of the exam pages
        \pagestyle{headandfoot}
        \header{\textsc{\@course}}{\textsc{\@bookchapter}}{\textsc{\@chaptertopic}}
        % \footer{\oddeven{}{\pointbox}}{}{\oddeven{\pointbox}{}}
        \headrule
        \extraheadheight{.5cm}
        % Check to see if document info commands are given after preamble
        % Uses \mycls@headerror to provide error message
        \let\course\mycls@headerror
        \let\bookchapter\mycls@headerror
        \let\chaptertopic\mycls@headerror
      }
    }
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
      \PassOptionsToClass{addpoints}{exam}
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
      \PassOptionsToClass{addpoints}{exam}
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
  % Assume all other options are sent to exam class
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
  \ProcessOptions\relax

% My setup for using exam class
\LoadClass[twoside]{exam}

%=========================%
%  PACKAGES AND SETTINGS  %
%=========================%
  % Load personal defaults
    \RequirePackage{wvwcmath}
    \usepackage[T1]{fontenc}
    \RequirePackage{mlmodern}

  % Font settings for Palatino.
    % If these are loaded before amssymb it causes an error
    % see: https://tex.stackexchange.com/questions/564490/command-bbbk-already-defined-ol-bbbk-mathordamsb7c-when-i-try-t
    \ifbool{pfont}{%
      \RequirePackage{newpxtext, newpxmath}
      \RequirePackage[tracking=smallcaps,protrusion=true,expansion=false,verbose=silent]{microtype}
    }

    % We also need to ignore microtype if using XeLaTeX, so add an option for this.
    \ifbool{pfontXTX}{%
      \RequirePackage{newpxtext, newpxmath}
    }

%==========================================%
%           DOCUMENT INFORMATION           %
%==========================================%
  % Only relevant for assessments
  \nopointsinmargin
