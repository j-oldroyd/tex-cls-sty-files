% A style file for Appalachian Journal of Student Scholarship
% Adapted from http://tutex.tug.org/pracjourn/2005-4/hefferon/hefferon.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ajss}[2019/09/08 Class for AJSS style]

% Send class options to article class
  \providecommand\ajssfontsize{12pt}
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

  \ProcessOptions\relax

  \LoadClass[\ajssfontsize]{article}

% Page settings
  % 1 inch margins on all sides per AJSS style guidelines
  \RequirePackage[bottom=1in,left=1in,right=1in,top=1in]{geometry}

  % single-spaced per AJSS style
  \linespread{1}

  % title spacing
  \usepackage{titling}
  \setlength{\droptitle}{-3.5em}
  \posttitle{\end{center}\vspace{-5em}}

  % Set paragraph spacing to 12pt
  \usepackage{parskip}
  \setlength{\parskip}{12pt}

  % Remove page numbers.
  \pagenumbering{gobble}

% Font settings
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}

% Section headings
  % Font size and style. Require uppercase for section headings!
  \RequirePackage{titlesec}
  \titleformat{\section}{\fontsize{12}{0}\bfseries\selectfont}{}{0pt}{\MakeUppercase}
  
  % Spacing after section heading
  % Some "wiggle room" is built in: margins are {left}{before}{after}[right]
  \titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt}

% URL packages
  \usepackage{hyperref}
  \usepackage{xcolor} % provides colors for links

% Bibliography settings
  % Options needed:
  %   style = verbose-note: abbreviates repeated citations
  %   bibstyle = authoryear: author name followed by year of publication
  %   notetype = endonly: moves citations to end of document as footnotes
  %   giveninits = true: replaces first name with first initial
  %   labeldateparts: adds date label to abbreviated citations
  %   pageref: removed pageref to suppress page numbers in repeated citations
  % helpful? https://tex.stackexchange.com/questions/445656/how-to-convert-in-text-citations-to-endnotes
  \RequirePackage[%
    style = verbose-note,
    bibstyle = authoryear,
    notetype = endonly,
    giveninits = true,
    labeldateparts,]{biblatex}
    % pageref]{biblatex}

  % Remove "In:" from bib items.
  \renewbibmacro{in:}{}

  % Remove quotes around article titles.
  \DeclareFieldFormat[article]{title}{#1} 

  % Changes order of names displayed.
  \DeclareNameAlias{author}{family-given}

  % Settings for citations
    \renewcommand{\labelnamepunct}{\addspace} % removes period after year

    \DeclareFieldFormat{pages}{#1} %removes "pp." from citations

    \renewbibmacro*{publisher+location+date}{%
      \ifentrytype{book}
        {\printlist{publisher}%
         \iflistundef{location}
           {\setunit*{\addcomma\space}}
           {\setunit*{\addcomma\space}}%
         \printlist{location}}
        {\ifentrytype{inbook}
        {\printlist{publisher}%
         \iflistundef{location}
           {\setunit*{\addcomma\space}}
           {\setunit*{\addcomma\space}}%
         \printlist{location}}
        {\printlist{location}%
         \iflistundef{publisher}
          {\setunit*{\addcomma\space}}
          {\setunit*{\addcolon\space}}%
         \printlist{publisher}}}
      \setunit*{\addcomma\space}%
      \usebibmacro{date}%
      \newunit}

  % Settings for @book and @inbook
    % formatting for editors
    % Put editor string in parentheses
    \DeclareFieldFormat{editortype}{\mkbibparens{#1}}

    % part of replacing "Ed. by" with "Author, Ed."
    \DefineBibliographyStrings{english}{%
      editor           = {Ed.},
      editors          = {Eds.},
    }

    % change order of editor name
    \DeclareNameAlias{editor}{last-first}

    % AJSS-compliant editor formatting
    \newbibmacro*{ineditor+others}{%
      \ifboolexpr{ test \ifuseeditor and not test {\ifnameundef{editor}} }
        % {\printnames{editor}%
        %  \setunit{\addspace}%
         {\printtext[parens]{\printnames{editor}\setunit*{\addcomma\addspace}\bibstring{editor}}%
         \clearname{editor}}
        {}}

    % remove quotes from titles in citations and in bibliography for @inbook
    \DeclareFieldFormat[inbook]{citetitle}{#1}
    \DeclareFieldFormat[inbook]{title}{#1}

    % no period after title
    \DeclareFieldFormat[inbook]{title}{#1\nopunct}

    % part of replacing "Title. In: Title" for @inbook
    \NewBibliographyString{in}
    \DefineBibliographyStrings{english}{
       in           = {in}
    }

    % @inbook template
    \DeclareBibliographyDriver{inbook}{%
      \usebibmacro{bibindex}%
      \usebibmacro{begentry}%
      \usebibmacro{author/translator+others}%
      \setunit{\printdelim{nametitledelim}}\newblock
      \usebibmacro{title}%
      \setunit*{\addspace}
      \printtext{\bibstring{in}}
      \usebibmacro{maintitle+booktitle}%
      % \newunit\newblock
      \printunit{\addcomma\space}
      \usebibmacro{ineditor+others}%
      % \newunit\newblock
      \printunit{\addcomma\space}
      \printfield{edition}%
      \newunit
      \usebibmacro{chapter+pages}%
      % \newunit\newblock
      \printunit{\addcomma\space}
      \iffieldundef{maintitle}
        {\printfield{volume}%
         \printfield{part}}
        {}%
      \newunit
      \printfield{volumes}%
      \newunit\newblock
      \usebibmacro{series+number}%
      \newunit\newblock
      \printfield{note}%
      \newunit\newblock
      \usebibmacro{publisher+location+date}%
      % \newunit\newblock
      % \usebibmacro{chapter+pages}%
      % \newunit\newblock
      \iftoggle{bbx:isbn}
        {\printfield{isbn}}
        {}%
      \newunit\newblock
      \usebibmacro{doi+eprint+url}%
      \newunit\newblock
      \usebibmacro{addendum+pubstate}%
      \setunit{\bibpagerefpunct}\newblock
      \usebibmacro{pageref}%
      \newunit\newblock
      \iftoggle{bbx:related}
        {\usebibmacro{related:init}%
         \usebibmacro{related}}
        {}%
      \usebibmacro{finentry}}

  % URL and DOI formatting
    % Removes URLs when using \cite.
    % \AtEveryCitekey{\clearfield{url}}

    % Removes "DOI:" from citations
    \DeclareFieldFormat{doi}{%
      \ifhyperref
        {\href{https://doi.org/#1}{\nolinkurl{#1}}}
        {\nolinkurl{#1}}}

    % Makes links italic instead of small caps
    \renewcommand\UrlFont{\rmfamily\itshape}

  % @online settings
    % changes how website title is displayed
    \DeclareFieldFormat[online]{title}{#1}

    % Uses editor to display website name
    \newbibmacro*{mywebsite}{%
          \ifboolexpr{ test \ifuseeditor and not test {\ifnameundef{editor}} }
            % {\printnames{editor}%
            %  \setunit{\addspace}%
             {\printtext{\printnames{editor}\setunit{\adddot\addspace}\printlist{url}}%
             \clearname{editor}}
            {}}

    % changes "visited on mm/yy" to "(accessed Month, Year)"
    \DefineBibliographyStrings{english}{%
        urlseen = {accessed}
    }
    \DeclareFieldFormat{urldate}{\mkbibparens{\bibstring{urlseen}\space\printfield{month}\space\printfield{year}}}

    % makes links blue
    \DeclareFieldFormat{url}{%
          \ifhyperref
            {\href{#1}{\color{blue}{#1}}}
            {\nolinkurl{#1}}}

    %@online template
    \DeclareBibliographyDriver{online}{%
        \usebibmacro{bibindex}%
        \usebibmacro{begentry}%
        \setunit{\labelnamepunct}\newblock
        \usebibmacro{title}%
        \setunit{\addcomma\addspace}\newblock
        \printlist{organization}
        \newunit\newblock
        \usebibmacro{mywebsite}
        \newunit\newblock
        \usebibmacro{url}
        \usebibmacro{urldate}
        \newunit\newblock
        \usebibmacro{finentry}}

  % Redefine "see note" for repeated citations.
  \DefineBibliographyStrings{english}{seenote = {{See note}}}

  % Redefines footcite:note from BibLaTeX default to include year in parentheses.
  % I believe labeldateparts option in biblatex is essential for this, hence why it's included above.
  \renewbibmacro*{footcite:note}{%
    \ifnameundef{labelname}
      {\printfield{label}}
      {\printnames{labelname}}%
    \ifsingletitle
      {}
      {\setunit*{\printdelim{nametitledelim}}%
       \printfield[title]{labeltitle}}%
    \setunit*{\addspace}                            % Adds space after author names.
    \printtext[parens]{\printlabeldateextra}        % Adds year in parentheses.
    \setunit*{\adddot\addspace}%                    % Adds period and small space after year.
    \printtext{%
      \bibstring{seenote}\addnbspace
      \ref{cbx@\csuse{cbx@f@\thefield{entrykey}}}%
      \iftoggle{cbx:pageref}
        {\ifsamepage{\the\value{instcount}}
                    {\csuse{cbx@f@\thefield{entrykey}}}
           {}
           {\addcomma\space\bibstring{page}\addnbspace
            \pageref{cbx@\csuse{cbx@f@\thefield{entrykey}}}}}
        {}}}

  % Required for citations to appear as endnotes
  % By default, endnotes are size 10pt if fontsize is 12pt
  \RequirePackage{endnotes}

  % Places line immediately above endnotes
  % \def\enoteheading{\par\kern2\baselineskip\footnoterule}
  \renewcommand\footnoterule{\kern12pt \hrule width 2in \kern 6pt} % redefine footnoterule so footnoterule has same length as Microsoft Word
  \def\enoteheading{\footnoterule}

  % Removes indentation from endnotes by redefining \enoteformat
  \def\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=0em\leavevmode\makeenmark}

  % Redefines \theendnotes to remove spacing after endnotes by setting \parskip to 0pt
  % Modified version of default endnotes.sty code
  \def\theendnotes{\immediate\closeout\@enotes \global\@enotesopenfalse
    \begingroup
      \setlength{\parskip}{0pt}
      \makeatletter
      %
      % The machinery with \@ResetGT and > here ensures that
      % \@doanenote works properly even if > is an active character
      % at the point where \theendnotes is invoked. > needs to have
      % catcode 12 when the arguments of \@doanenote are scanned, so
      % that the > in the string "macro:->" is matched.  The actual
      % footnote text is not an argument to \@doanenote, but just
      % follows it in the .ent file; so \@ResetGT can reset the
      % category code for > that should be used when processing
      % that text.  That resetting takes place within a
      % \begingroup-\endgroup block set up by \@doanenote and
      % \@endanenote, so the catcode for > is back to 12 for the
      % next note.
      %
      \edef\@tempa{`\string >}%
      \ifnum\catcode\@tempa=12%
        \let\@ResetGT\relax
      \else
        \edef\@ResetGT{\noexpand\catcode\@tempa=\the\catcode\@tempa}%
        \@makeother\>%
      \fi
      \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup
          \@ResetGT
          \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
          \enoteformat}
      \def\@endanenote{\par\endgroup}%
      \enoteheading
      \enotesize
      \input{\jobname.ent}%
    \endgroup}