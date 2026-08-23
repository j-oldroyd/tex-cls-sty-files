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

\def\fileversion{0.5.1}
\def\filedate{2026/08/23}

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
\newcommand{\@officehours}{}
\newcommand{\officehours}[1]{\gdef\@officehours{#1}}
\newcommand{\@coursemodality}{}
\newcommand{\coursemodality}[1]{\gdef\@coursemodality{#1}}
\newcommand{\@coursemeetings}{}
\newcommand{\coursemeetings}[1]{\gdef\@coursemeetings{#1}}
\newcommand{\@courselocation}{}
\newcommand{\courselocation}[1]{\gdef\@courselocation{#1}}
\newcommand{\@withdrawal}{}
\newcommand{\withdrawal}[1]{\gdef\@withdrawal{#1}}
\newcommand{\@finalexamdate}{}
\newcommand{\finalexamdate}[1]{\gdef\@finalexamdate{#1}}

\RequirePackage{graphics}
\RequirePackage{afterpage}
\RequirePackage{tabularx}
\RequirePackage{xcolor}
\RequirePackage{changepage}
\RequirePackage{biblatex}

% This class extends the article class primarily to take advantage of tagged PDF compatibility.
\LoadClass[11pt]{article}
\usepackage{titlesec}
\usepackage{fontspec}
\usepackage{lmodern}
\usepackage{microtype}
\usepackage{tabularx}
\usepackage{zref-totpages}
\usepackage{termcal}
% Calendar commands for schedule
\newcommand{\MWFClass}{%
	\calday[Monday]{\classday} % Monday
	\skipday % Tuesday (no class)
	\calday[Wednesday]{\classday} % Wednesday
	\skipday % Thursday (no class)
	\calday[Friday]{\classday} % Friday
	\skipday\skipday % weekend (no class)
}

\newcommand{\MTWFClass}{%
	\calday[Monday]{\classday} % Monday
	\calday[Tuesday]{\classday} % Tuesday
	\calday[Wednesday]{\classday} % Wednesday
	\skipday % Thursday (no class)
	\calday[Friday]{\classday} % Friday
	\skipday\skipday % weekend (no class)
}

\newcommand{\MWRFClass}{%
	\calday[Monday]{\classday} % Monday
	\skipday % Tuesday (no class)
	\calday[Wednesday]{\classday} % Wednesday
	\calday[Thursday]{\classday}
	\calday[Friday]{\classday} % Friday
	\skipday\skipday % weekend (no class)
}

\newcommand{\TRClass}{%
	\skipday % Monday (no class)
	\calday[Tuesday]{\classday} % Tuesday
	\skipday % Wednesday (no class)
	\calday[Thursday]{\classday} % Thursday
	\skipday % Friday
	\skipday\skipday % weekend (no class)
}

\newcommand{\Holiday}[2]{%
	\options{#1}{\noclassday}
	\caltext{#1}{#2}
}

\newcommand{\homework}[1]{%
	\\\hfill\scriptsize\framebox{HW #1}
}

\newcommand{\homeworkdue}[1]{%
	\\\scriptsize\framebox{HW #1 due}\hfill\,
}

\newcommand{\homeworkanddue}[2]{%
	\\\scriptsize\framebox{HW #1 due}\hfill\framebox{HW #2}
}

\newcommand{\lecture}[1]{\centering\footnotesize #1}
\newcommand{\test}[1]{\centering\footnotesize\textbf{TEST #1}}

\usepackage[%
	top = 0.5in,
	bottom = 0.5in,
	left = 0.7in,
	right = 0.7in,
	includeheadfoot,
	% showframe,
]{geometry}

\usepackage{fancyhdr}

\usepackage{hyperref} % Load this after loading class to avoid conflict
\hypersetup{%
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,
	urlcolor=cyan,
}

\usepackage{booktabs}

\DeclareOption{fyex}{
	% ============ %
	% CLASS MACROS %
	% ============ %
	% The code below is adapted from
	% https://tex.stackexchange.com/a/40051/60075
	\definecolor{headingorange}{RGB}{247, 230, 215}
	\definecolor{wvwcorange}{HTML}{F05123}

	\titleformat{name=\section}[block] {\bfseries\large} {} {0pt} {\colorsection} {}
	\titlespacing*{\section}{9bp}{9bp}{-9bp}	% {<cmd>}{<left>}{<before>}{<after>}[<right>]
	\titlespacing*{\subsection}{0.25in}{12pt}{6pt}
	\newcommand{\colorsection}[1]{%
		\colorbox{headingorange}{%
			% \parbox[][18bp][c]{\dimexpr\textwidth-2\fboxsep}{\hspace{9bp}#1\vphantom{27bp}}
			\parbox[][18bp][c]{\dimexpr\textwidth-18bp}{\hspace{9bp}#1\vphantom{27bp}}
		}
	}

	% ===== %
	% FONTS %
	% ===== %
	% The code below assumes that Arial is already installed on the system.
	% If not, then the uarial package will need to be setup separately.
	\setmainfont{arial}

	% =========== %
	% PAGE LAYOUT %
	% =========== %
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

	\setlength{\parindent}{0pt}

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

		% {\noindent\large \textbf{Instructor \& Course Details}}
		\section{Instructor \& Course Details}

		\begin{center}
			\begin{minipage}{0.45\linewidth}
				\begin{tabular}{l}
					\textbf{Instructor:} Jesse Oldroyd                                   \\
					\textbf{Email:} \href{mailto:oldroyd.j@wvwc.edu}{oldroyd.j@wvwc.edu} \\
					\textbf{Office Location:} CHS 125                                    \\
					\textbf{Phone:} 304-473-8339                                         \\
					\textbf{Office Hours:} \@officehours{}                               \\
				\end{tabular}
			\end{minipage}
			\begin{minipage}{0.45\linewidth}
				\begin{tabular}{l}
					\textbf{Modality of Course:} \@coursemodality{}      \\
					\textbf{Days and Times of Class:} \@coursemeetings{} \\
					\textbf{Building and Room:} \@courselocation{}
				\end{tabular}
			\end{minipage}
			% 	\begin{tabularx}{6.625in}{lXl}
			% 		\textbf{Instructor:} Jesse Oldroyd                                   &  &                                       \\
			% 		\textbf{Email:} \href{mailto:oldroyd.j@wvwc.edu}{oldroyd.j@wvwc.edu} &  & \textbf{Phone:} 304-473-8339          \\
			% 		\textbf{Office Location:} CHS 125                                    &  & \textbf{Office Hours} \@officehours{} \\
			% 		\textbf{Modality of Course:} \@coursemodality{}                      &  &                                       \\
			% 		\textbf{Days and Times of Class:} \@coursemeetings{}                 &  &                                       \\
			% 		\textbf{Building and Room:} \@courselocation{}                       &  &                                       \\
			% 	\end{tabularx}
		\end{center}
	}

	\AtEndDocument{%
		% Add boilerplate
		\section{College Policies}
		\begin{adjustwidth}{9bp}{}
			Please refer to the \href{https://www.wvwc.edu/policies-student-handbook/}{WVWC Student Handbook} for more comprehensive information about institutional-level policies.
		\end{adjustwidth}

		\subsection*{Academic Integrity}
		\begin{adjustwidth}{9bp}{}
			For clarification on academic integrity violations, and corresponding penalties and procedures,
			students should consult the \href{https://www.wvwc.edu/policies-student-handbook/}{WVWC Student Handbook}.
		\end{adjustwidth}

		\subsection*{Classroom Behavior}
		\begin{adjustwidth}{9bp}{}
			Students share responsibility for maintaining a respectful and inclusive learning environment that supports participation across diverse perspectives and lived experiences.
			Disruptive behavior, including repeated tardiness, side conversations, misuse of technology, or conduct that limits others’ ability to engage, will be addressed through the following process:

			\begin{enumerate}
				\item Verbal reminder: The instructor will redirect the behavior during class.

				\item Verbal warning: A more direct warning will be issued and documented.

				\item Removal from class: The student may be asked to leave for the remainder of the session.

				\item Written notice: A written warning will outline expectations and next steps.

				\item Meeting and escalation: Continued disruption will require a meeting with the instructor and may be referred to the department chair or the Office of Academic Affairs.
			\end{enumerate}

			Because the college is committed to safeguarding a respectful and inclusive learning environment, some behaviors, such as discriminatory remarks or refusal to comply with reasonable instructor requests may warrant a more immediate, formal response.
			In these cases, the instructor may move directly to higher-level consequences such as removal from class, written notice, or referral to a department chair or other office.
		\end{adjustwidth}
		\subsection*{Statement on Non-Discrimination and Title IX/ADA 504 Information}
		\begin{adjustwidth}{9bp}{}
			West Virginia Wesleyan College does not discriminate on the basis of race, sex, color, national or ethnic origin, creed, ancestry, marital/family status, veteran status, sexual orientation, sex characteristics,  pregnancy, religion, age, disability or blindness, or any other characteristic protected by local, state or federal law, to include Title VI, Title VII, Title IX, Section 504, and the Age Discrimination Act, in the administration of its admission policies, scholarship and loan programs, educational programs, employment, athletic programs, co-curricular activities, or other College administered programs.
			WVWC’s nondiscrimination polices may be accessed at \url{https://www.wvwc.edu/title-ix/}.
			For inquiries about the application of these laws in WVWC’s programs activities or to file a report, contact the Title IX Coordinator at \href{mailto:titleix@wvwc.edu}{titleix@wvwc.edu} or 304-621-1316.
		\end{adjustwidth}

		\subsection*{WVWC Policy Regarding Students with Disabilities}
		\begin{adjustwidth}{9bp}{}
			West Virginia Wesleyan College supports students who are pregnant (Title IX) and students with disabilities, including short term disabilities (as defined by Section 504 of the Rehabilitation Act of 1973 [29 U.S.C. 794(a)] and Americans with Disabilities Act of 1990 (ADA) [42 U.S.C. § 12101, et seq.])

			If you are a person with any of these conditions and anticipate needing any type of accommodation in order to participate in this class, please advise me and make appropriate arrangements with the Director of the Learning Center and Accessibility Services as specified in our \href{https://www.wvwc.edu/policies-student-handbook/}{Student Handbook}.
			To discuss accommodation needs, call 304-473-8558.
		\end{adjustwidth}

		\section{College Resources}
		\begin{adjustwidth}{9bp}{}
			Please refer to the \href{https://www.wvwc.edu/policies-student-handbook/}{WVWC Student Handbook} and the \href{https://www.wvwc.edu/students/academic-support/}{Academic Support Center} for more comprehensive information about institutional resources and support.
		\end{adjustwidth}

		\subsection*{Student Success Center}
		\label{sec:stud-succ-cent}
		\begin{adjustwidth}{9bp}{}
			The Student Success Center provides services designed to assist in the academic development of students.
			The staff encourages students to reach their full academic potential and provides resources to assist in the journey toward educational goals.
			The SSC provides a variety of services, including advising, academic skills seminars, and support for first generation college students.
			Visit the \href{https://www.wvwc.edu/students/academic-support/}{Student Success Center website} for more information.
		\end{adjustwidth}

		\subsection*{The Learning Center and Accessibility Services}
		\label{sec:learn-cent-access}
		\begin{adjustwidth}{9bp}{}
			West Virginia Wesleyan College is strongly committed to giving you the outstanding learning support you are looking for.
			Our resources and facilities are among the most complete in the country.
			They are designed to serve a broad scope of student needs, ranging from the individually structured assistance, accommodations, and services of our foundational program to our specialized, concentrated support systems.
			Services include graduate school preparation, support for students with learning disabilities, accommodation plans, reading skills, mentoring, counseling, strategizing, and tutoring.
			Visit \href{https://www.wvwc.edu/the-learning-center/}{The Learning Center and Accessibility Services} for more information.
		\end{adjustwidth}

		\subsection*{Library Services}
		\label{sec:library-services}
		\begin{adjustwidth}{9bp}{}
			The Annie Merner Pfeiffer Library provides students with access to high-quality scholarly resources and research support that empowers students for success in the classroom.
			Our research databases offer access to thousands of scholarly journals, electronic books, magazines, streaming media, and news sources.
			The library also offers print collections of academic and pleasure reading books, local newspapers, and West Virginia magazines and journals.
			Professional librarians are available to help students find appropriate resources and improve their research skills.
			Visit the \href{https://amplibrary.wvwc.edu/libraryhome}{library website} or email \href{mailto:librarian@wvwc.edu}{librarian@wvwc.edu} for assistance.
		\end{adjustwidth}

		\subsection*{Writing Center}
		\label{sec:writing-center}

		\begin{adjustwidth}{9bp}{}
			The Writing Center at West Virginia Wesleyan College is a welcoming space where students receive personalized support for their writing needs across various disciplines. As a student-focused resource, we prioritize creating an inclusive environment that fosters growth, critical thinking, and effective communication skills. Through collaborative consultations, workshops, and resources, we strive to help students develop their writing abilities, enhance their academic performance, and cultivate lifelong writing skills. Email \href{mailto:writing_center@wvwc.edu}{writing\_center@wvwc.edu} for more information.
		\end{adjustwidth}

		\subsection*{Counseling Services}
		\label{sec:counseling-services}

		\begin{adjustwidth}{9bp}{}
			The WVWC Counseling Center offers free therapy sessions to all students as part of Wesleyan’s commitment to student well-being.
			The objective of the Counseling Center is to assist students in resolving personal and educational concerns, developing self-management and interpersonal skills, and learning to improve individual well-being.
			A variety of services are offered, including individual counseling, educational programs and resource materials on a variety of important issues.
			These services are confidential.
			If a student needs specialized services not available on campus, the staff will make an appropriate recommendation or referral.

			The main WVWC Counseling Center door is located across from the back of Christopher Hall of Science.
			The Center partners with Community Care therapists as well (these sessions are billed to the student’s insurance).
			While both therapy options are located in the same building, they are separate entities.
			To set up an initial session at the Counseling Center, email \href{mailto:counseling@wvwc.edu}{counseling@wvwc.edu}.
			To set up an initial session with Community Care, call 304.937.0041.

			If you are in crisis after hours, call Campus Security at (304) 473-8011 or 988.
		\end{adjustwidth}
	}
}

\DeclareOption{default}{%
	\newgeometry{%
		top = 1in,
		bottom = 1in,
		left = 1in,
		right = 1in,
		includeheadfoot,
		% headheight = 2.25in,
	}

	\setlength{\parindent}{0pt}
	\setlength{\parskip}{\baselineskip}

	\pagestyle{fancy}
	% First page headfoot style.
	\fancypagestyle{firstpage}{%
		\fancyhead[L]{\footnotesize\textit{\@course{}}}
		\fancyhead[C]{\footnotesize\textit{\underline{\@coursetitle{}}}}
		\fancyhead[R]{\footnotesize{\textit\@term{}}}
	}
	% \renewcommand{\headrulewidth}{.05in}
	% \let\oldheadrule\headrule
	% \renewcommand{\headrule}{\color{wvwcorange}\oldheadrule}
	% \fancyfoot[C]{\@course{} Syllabus, Page~\thepage}

	% Remaining page headfoot
	\fancyhf{}
	\fancyhead[C]{\footnotesize\textit{DIFFERENTIAL EQUATIONS}}
	\fancyfoot[C]{Page \thepage\ of \ztotpages}

	% \pagestyle{headandfoot}
	% \firstpageheader{\footnotesize \textit{\@course{}}}{\footnotesize \textit{\underline{\@coursetitle{}}}}{\textit{\footnotesize \@term{}}}
	% \footer{}{Page \thepage\ of \numpages}{}
	% \extraheadheight[.5cm]{0cm}
	% \extrafootheight[.5cm]{.5cm}

	\AtBeginDocument{%
		\thispagestyle{firstpage}
		\begin{center}
			\begin{tabularx}{\linewidth}{llXll}\toprule
				\noindent \textbf{INSTRUCTOR:} & Jesse Oldroyd      &  & \textbf{EMAIL:}        & \href{mailto:oldroyd.j@wvwc.edu}{\nolinkurl{oldroyd.j@wvwc.edu}} \\
				\textbf{OFFICE:}               & CHS 125            &  & \textbf{OFFICE HOURS:} & \@officehours{}                                                  \\
				\textbf{LECTURE:}              & \@coursemeetings{} &  & \textbf{CLASSROOM:}    & \@courselocation{}                                               \\\bottomrule
			\end{tabularx}
		\end{center}
	}

	\AtEndDocument{%
		\paragraph{ATTENDANCE:} Attendance will be taken for record-keeping purposes but will not directly affect your grade.
		However, keep in mind that attending class regularly is \textbf{absolutely crucial} to succeeding in this course.
		If you miss class or know that you will be missing class, please contact me as soon as you can to determine what material and announcements you may be missing.
		Should you miss a class, \textit{it is your responsibility to cover any missed material.}

		\paragraph*{IMPORTANT DATES:}
		\begin{itemize}
			\item Withdrawal deadline: \@withdrawal{}.

			\item Final exam: \@finalexamdate{}.
		\end{itemize}

		\section*{College Policies}
		Please refer to the \href{https://www.wvwc.edu/policies-student-handbook/}{WVWC Student Handbook} for more comprehensive information about institutional-level policies.

		\paragraph{ACADEMIC INTEGRITY:}\label{academic-integrity} I follow the academic integrity policy as stated in the current \href{https://www.wvwc.edu/wp-content/uploads/2023/08/Student-Handbook-Fall-2023.pdf}{WVWC Student Handbook}.
		The College considers academic dishonesty a serious offense as it diminishes the quality of scholarship and defrauds those who eventually depend upon our knowledge and integrity.
		The penalties for violating these standards are based on our firm belief in academic integrity.
		Violations of academic integrity include but are not limited to the following:
		\begin{enumerate}
			\item  Cheating on tests, examinations and quizzes;

			\item  Plagiarism; appropriating the original work of another with the intent of falsely misrepresenting work as one's own; includes using the exact words of another without identification of the material as a direct quotation or without citing the exact source; paraphrasing the work of another person without citing the exact source (note that a correct paraphrase requires complete transformation of the passage, not a simple change of a few phrases or words); using facts, figures, statistics, graphical representations or interpretations which are not original with the writer or speaker without citing the original source; knowingly aiding or abetting another who is plagiarizing;

			\item Use of A.I.\ technology, such as ChatGPT, or any other artificial intelligence tool in the creation of course content without the instructor's consent and proper citation;

			\item Collaboration without the instructor's consent on individual assignments intended to be performed outside the classroom;

			\item Submitting work for one course which has already been submitted for another course without the explicit permission of the instructors involved; and,

			\item Selling or purchasing papers or other assignments for submission to meet course requirements.
			      This includes downloading papers from the Internet.
		\end{enumerate}

		\paragraph{CLASSROOM BEHAVIOR:} Students share responsibility for maintaining a respectful and inclusive learning environment that supports participation across diverse perspectives and lived experiences.
		Disruptive behavior, including repeated tardiness, side conversations, misuse of technology, or conduct that limits others’ ability to engage, will be addressed through the following process:
		\begin{enumerate}
			\item Verbal reminder: The instructor will redirect the behavior during class.

			\item Verbal warning: A more direct warning will be issued and documented.

			\item Removal from class: The student may be asked to leave for the remainder of the session.

			\item Written notice: A written warning will outline expectations and next steps.

			\item Meeting and escalation: Continued disruption will require a meeting with the instructor and may be referred to the department chair or the Office of Academic Affairs.
		\end{enumerate}

		Because the college is committed to safeguarding a respectful and inclusive learning environment, some behaviors, such as discriminatory remarks or refusal to comply with reasonable instructor requests may warrant a more immediate, formal response.
		In these cases, the instructor may move directly to higher-level consequences such as removal from class, written notice, or referral to a department chair or other office.

		\paragraph{NON-DISCRIMINATION AND AFFIRMATIVE ACTION:} West Virginia Wesleyan College does not discriminate on the basis of race, sex, color, national or ethnic origin, creed, ancestry, marital/family status, veteran status, sexual orientation, gender, gender identity, gender expression, pregnancy, religion, age, disability or blindness, or any other characteristic protected by local, state or federal law, to include Title VI, Title IX, Section 504, and the Age Discrimination Act, in the administration of its admission policies, scholarship and loan programs, educational programs, employment, athletic programs, co-curricular activities, or other College administered programs.
		WVWC’s nondiscrimination polices may be accessed at \url{https://www.wvwc.edu/title-ix/}
		For inquiries about the application of these laws in WVWC programs, or to file a report, contact the Title IX Coordinator at 59 College Ave, Buckhannon WV, \href{mailto:titleix@wvwc.edu}{\nolinkurl{titleix@wvwc.edu}}, or 304-621-1316.

		\paragraph{THE COLLEGE'S POLICY REGARDING STUDENTS WITH DISABILITIES:} West Virginia Wesleyan College ensures that no qualified person shall, by reason of a disability, be denied access to, excluded from participation in, or denied the benefits of any program or activity operated by the College or be subjected to discrimination under any of its programs or activities.
		The College shall make reasonable accommodations to the known limitations of an otherwise qualified student with a disability to enable the qualified student with the disability to have equal access to educational opportunities, programs and activities.
		Section 504 of the Rehabilitation Act of 1973 [29 U.S.C.\ 794(a)] and Americans with Disabilities Act of 1990 (ADA) [42 U.S.C.\ $\S$ 12101, et seq.].

		If you are a person with a disability and anticipate needing any type of accommodation in order to participate in this class, please advise me and make appropriate arrangements with the Director of the Learning Center as specified in our
		\href{https://www.wvwc.edu/policies-student-handbook/}{Student
			Handbook}.
		(TEL: 304-473-8558).

		\paragraph{COLLEGE RESOURCES:} Please refer to the \href{https://www.wvwc.edu/policies-student-handbook/}{Student Handbook} and the \href{https://www.wvwc.edu/students/academic-support/}{Academic Support Center} for more comprehensive information about institutional resources and support.

		\begin{itemize}
			\item Student Success Center: The Student Success Center provides services designed to assist in the academic development of students.
			      The staff encourages students to reach their full academic potential and provides resources to assist in the journey toward educational goals.
			      The SSC provides a variety of services, including advising, academic skills seminars, and support for first generation college students.
			      Visit the \href{https://www.wvwc.edu/students/academic-support/}{Student Success Center website} for more information.

			\item Learning Center and Office of Accessibility Services: West Virginia Wesleyan College is strongly committed to giving you the outstanding learning support you are looking for.
			      Our resources and facilities are among the most complete in the country.
			      They are designed to serve a broad scope of student needs, ranging from the individually structured assistance, accommodations, and services of our foundational program to our specialized, concentrated support systems.
			      Services include graduate school preparation, support for students with learning disabilities, accommodation plans, reading skills, mentoring, counseling, strategizing, and tutoring.
			      Visit the \href{https://www.wvwc.edu/the-learning-center/}{Learning Center and Office of Accessibility Services} for more information.

			\item Library Services: The Annie Merner Pfeiffer Library provides students with access to high-quality scholarly resources and research support that empowers students for success in the classroom.
			      Our research databases offer access to thousands of scholarly journals, electronic books, magazines, streaming media, and news sources.
			      The library also offers print collections of academic and pleasure reading books, local newspapers, and West Virginia magazines and journals.
			      Professional librarians are available to help students find appropriate resources and improve their research skills.
			      Visit the \href{https://amplibrary.wvwc.edu/libraryhome}{library website} or email \href{mailto:librarian@wvwc.edu}{\nolinkurl{librarian@wvwc.edu}} for assistance.

			\item Writing Center: The Writing Center at West Virginia Wesleyan College is a welcoming space where students receive personalized support for their writing needs across various disciplines.
			      As a student-focused resource, we prioritize creating an inclusive environment that fosters growth, critical thinking, and effective communication skills.
			      Through collaborative consultations, workshops, and resources, we strive to help students develop their writing abilities, enhance their academic performance, and cultivate lifelong writing skills.
			      Email \href{mailto:writing_center@wvwc.edu}{\nolinkurl{writing_center@wvwc.edu}} for more information.

			\item Counseling Services: The WVWC Counseling Center offers free therapy sessions to all students as part of Wesleyan's commitment to student well-being.
			      The objective of the Counseling Center is to assist students in resolving personal and educational concerns, developing self-management and interpersonal skills, and learning to improve individual well-being.
			      A variety of services are offered, including individual counseling, educational programs and resource materials on a variety of important issues.
			      These services are confidential.
			      If a student needs specialized services not available on campus, the staff will make an appropriate recommendation or referral.

			      The main WVWC Counseling Center door is located across from the back of Christopher Hall of Science.
			      The Center partners with Community Care therapists as well (these sessions are billed to the student's insurance).
			      While both therapy options are located in the same building, they are separate entities.
			      To set up an initial session at the Counseling Center, email \href{mailto:counseling@wvwc.edu}{\nolinkurl{counseling@wvwc.edu}}.
			      To set up an initial session with Community Care, call (304) 937-0041.

			      If you are in crisis after-hours, call Campus Security at (304) 473-8011 or 988.
		\end{itemize}
	}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
