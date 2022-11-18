\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math-jeo}[2022/11/16 math-jeo.cls]

\RequirePackage{etoolbox}
\newbool{pfont}

\DeclareOption{palatino}{%
  % Set a boolean variable to be true in order to use palatino fonts below.
  % Requires etoolbox.
  \booltrue{pfont}
}

\DeclareOption{lecture}{%
  \newcommand{\class}{\textsc{Class 001-01}}
  \newcommand{\term}{\textsc{Fall 20xx}}
  \newcommand{\chapter}{\textsc{Chapter X}}
  \newcommand{\topic}{\textsc{Awesome Math}}
  \AtBeginDocument{%
      % These commands set up the running header on the top of the exam pages
      \pagestyle{headandfoot}
      \header{\textsc{\class}}{\textsc{\chapter}}{\textsc{\topic}}
      % \footer{\oddeven{}{\pointbox}}{}{\oddeven{\pointbox}{}}
      \headrule
      \extraheadheight{.5cm}
      }}

\DeclareOption{exam}{%
  \PassOptionsToClass{addpoints}{exam}
  \newcommand{\class}{\textsc{CLASS 001-01}}
  \newcommand{\term}{\textsc{FALL 20XX}}
  \newcommand{\examnum}{\textsc{Test X}}
  \newcommand{\examdate}{\textsc{DECEMBER 31, 1999}}
  \AtBeginDocument{%
      % These commands set up the running header on the top of the exam pages
      \pagestyle{headandfoot}
      \header{\class}{\examnum\ - Page \thepage\ of \numpages}{\examdate}
      \footer{\oddeven{}{\pointbox}}{}{\oddeven{\pointbox}{}}
      \headrule
      \extraheadheight{.5cm}
      }}
\ProcessOptions\relax

% My setup for using exam class
\LoadClass[twoside]{exam}

%=========================%
%  PACKAGES AND SETTINGS  %
%=========================%

  % AMS packages
    \RequirePackage{%
    amsfonts,
    amsmath,
    amssymb,
    amsthm
    }

  % Font settings for Palatino.
    % If these are loaded before amssymb it causes an error
    % see: https://tex.stackexchange.com/questions/564490/command-bbbk-already-defined-ol-bbbk-mathordamsb7c-when-i-try-t
    \ifbool{pfont}{%
      \RequirePackage{newpxtext, newpxmath}
      \RequirePackage[tracking=smallcaps,protrusion=true,expansion=false,verbose=silent]{microtype}
    }

  % Packages for implementing basic notation, e.g., derivatives and paired delimiters
    \RequirePackage{%
    physics,
    mathtools
    }

  % TikZ packages and settings
    \RequirePackage{%
    tikz,
    pgfplots
    }
    \usetikzlibrary{%
    angles,
    arrows,
    backgrounds,
    calc,
    decorations.pathmorphing,
    decorations.markings,
    decorations.pathreplacing,
    graphs,
    graphs.standard,
    intersections,
    patterns,
    positioning,
    quotes,
    }

    \definecolor{darkgreen}{rgb}{0.125,0.5,0.169}

    \pgfplotsset{compat=newest}
    \pgfplotsset{
      myplot/.style={% primary style for curves
      color=blue,
      mark=none,
      line width=1pt,
      <->,
      solid,
      samples=100
      },
      myaxis/.style={% primary style for axes
      view={120}{30},
      axis lines=center,
      axis line style={shorten >=-10pt, shorten <=-10pt, <->},
      axis equal image,
      xlabel={$x$}, xlabel style={at=(current axis.right of origin), anchor=west, xshift=10pt},
      ylabel={$y$}, ylabel style={at=(current axis.above origin), anchor=south, yshift=10pt},
      xmin = -7, xmax = 7,
      ymin = -7, ymax = 7,
      grid = both,
      grid style={line width=.1pt, draw=gray!30},
      major grid style={line width=.2pt,draw=gray!60},
        % grid = minor,
        % grid=major,
        % grid style = {solid,gray!40},
        % minor xtick = {-7,-6,...,7},
        % minor ytick = {-7,-6,...,7},
        xtick={\pgfkeysvalueof{/pgfplots/xmin},...,\pgfkeysvalueof{/pgfplots/xmax}},
        ytick={\pgfkeysvalueof{/pgfplots/ymin},...,\pgfkeysvalueof{/pgfplots/ymax}},
        minor tick num=1,
        tick label style={font=\footnotesize},
        scale only axis,  % only scale axes when specifying height/width
        legend cell align=left,
        vector/.style={-stealth,blue,very thick}
        , 
        vector guide/.style={dashed,red,thick}
        },
      numberline/.style={% style for drawing numberline
      axis x line = center,
      axis y line = none,
      axis line style={shorten >=-10pt, shorten <=-10pt, <->},
      xlabel={$x$}, xlabel style={at=(current axis.right of origin), anchor=west, xshift=10pt},
      ymin=0,
      ymax=0},
      mypolarplot/.style={%PGFPlots polaraxis settings
        clip=false, % needed for double line (last \addplot command)
        domain=0:360, % plot full cycle
        samples=180, % number of samples; can be locally adjusted
        grid=both, % display major and minor grids
        major grid style={gray!70}, 
        minor grid style={gray!20}, 
        minor x tick num=3, % 3 minor x ticks between majors
        minor y tick num=1, % 1 minor y tick between majors
        xtick={0,30,45,60,90,120,135,150,180,210,225,240,270,300,315,330},
        xticklabels={%
        $0$,
        $\frac{\pi}{6}$,
        $\frac{ \pi}{4}$,
        $\frac{\pi}{3}$,
        $\frac{ \pi}{2}$,
        $\frac{2\pi}{3}$,
        $\frac{3\pi}{4}$,
        $\frac{5\pi}{6}$,
        $\pi$,
        $\frac{7\pi}{6}$,
        $\frac{5\pi}{4}$,
        $\frac{4\pi}{3}$,
        $\frac{3\pi}{2}$,
        $\frac{5\pi}{3}$,
        $\frac{7\pi}{4}$,
        $\frac{11\pi}{6}$
        },
        yticklabel style={anchor=north}, % move label position
        },
        }

        \tikzset{
        jumpdot/.style={mark=*,solid},
        excl/.append style={jumpdot,fill=white},
        incl/.append style={jumpdot,fill=black},
        }

  % Improvements to tables and lists
  \RequirePackage{booktabs}
  \RequirePackage[shortlabels]{enumitem}

  % hyperref, cleverref and setup
  \RequirePackage{hyperref}
    \hypersetup{%
        colorlinks=true, % links are colored
        urlcolor=blue, % url/email color
        linkcolor=magenta % interdocument link color
        }
    \RequirePackage[capitalize,noabbrev]{cleveref} % hyperref and cleveref are used for autoref to work the way I want it to.

  % Get blank line between paragraphs.
  \RequirePackage[parfill]{parskip}

  % Miscellaneous
    \RequirePackage{%
    calc,
    siunitx,
    bm,
    pdfpages,
    matlab-prettifier,
    asymptote,
    tiscreen
    }

%==========%
%  MACROS  %
%==========%
  % Delimiters from mathtools
    % \DeclarePairedDelimiter\abs{\lvert}{\rvert}
    \DeclarePairedDelimiter\set{\{}{\}}
    \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
    \DeclarePairedDelimiter\parens{\lparen}{\rparen}
    \DeclarePairedDelimiter\brackets{[}{]}
    \DeclarePairedDelimiter\abrackets{\langle}{\rangle}
    % \DeclarePairedDelimiter\norm{\|}{\|}

  % Miscellaneous symbols, functions, mathmode commands.
    \newcommand{\RR}{\ensuremath{\mathbb{R}}}
    \newcommand{\QQ}{\ensuremath{\mathbb{Q}}}
    \newcommand{\NN}{\ensuremath{\mathbb{N}}}
    \newcommand{\ZZ}{\ensuremath{\mathbb{Z}}}
    \newcommand{\CC}{\ensuremath{\mathbb{C}}}
    \newcommand{\ii}{\vb{\imath}}
    \newcommand{\jj}{\vb{\jmath}}
    \newcommand{\kk}{\vb{k}}
    \newcommand{\ivec}[2][.8]{%
      \scalebox{#1}{%
        \renewcommand{\arraystretch}{.8}%
        $\begin{bmatrix}#2\end{bmatrix}$%
      }
    }
    % New emptyset symbol
    \let\oldemptyset\emptyset
    \let\emptyset\varnothing

  % SI unit commands
    \sisetup{exponent-product = \cdot, per-mode = fraction}
    \let\DeclareUSUnit\DeclareSIUnit % These are for
    \let\US\SI                       % declaring imperial units

    \DeclareUSUnit\mile{mi}
    \DeclareUSUnit\foot{ft}
    \DeclareUSUnit\inch{in}

  % Settings for cleverref
  \crefname{subsection}{Subsection}{Subsections}
    % Allows custom label for inequalities. Intended to be used in equation environments.
    \crefname{ineq}{Inequality}{Inequalities}
    \creflabelformat{ineq}{#2{\upshape(#1)}#3}

  % Theorem environments
    \newtheorem{theorem}{Theorem}[section]

    \newtheorem{proposition}[theorem]{Proposition}
    \newcommand{\propositionautorefname}{Proposition}

    \newtheorem{corollary}[theorem]{Corollary}
    \newcommand{\corollaryautorefname}{Corollary}

    \newtheorem{lemma}[theorem]{Lemma}
    \newcommand{\lemmaautorefname}{Lemma}

  % Following environments should be nonitalicized.
    \theoremstyle{definition}
    \newtheorem{definition}[theorem]{Definition}
    \newcommand{\definitionautorefname}{Definition}

    \newtheorem{remark}[theorem]{Remark}
    \newcommand{\remarkautorefname}{Remark}

    \newtheorem{fact}{Fact}

    \newtheorem{algorithm}[theorem]{Algorithm}
    \newcommand{\algoritheoremautorefname}{Algorithm}

    \newtheorem{example}[theorem]{Example}
    \newcommand{\exampleautorefname}{Example}

  % Defines pointbox for exams.
    \newcommand{\pointbox}{\fbox{Points:$\phantom{\bigg]}$\makebox[.75cm]{}/\pointsonpage{\thepage}}}

%==========================================%
%           DOCUMENT INFORMATION           %
%==========================================%
  \pointsinmargin