% Adapted from uvamath.cls by JB
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adammath}[2014/05/23 1.0 Mathematics in Amsterdam LaTeX document class]

\newif\if@dutchlanguage \@dutchlanguagefalse
\newif\if@generic \@generictrue

\DeclareOption{dutch}{
\@dutchlanguagetrue
% Dutch values for translatable constant text
\def\supervisortext{Begeleider}
\def\titletext{Titel}
\def\authortextsingular{Auteur}
\def\authortextplural{Auteurs}
\def\datetext{Einddatum}
\def\bytext{door}
\def\tracktext{Richting}
\def\secondgradertext{Tweede beoordelaar}
}

\DeclareOption{vu}{
% VU specific values
\def\logosize{6cm}
\@genericfalse
\def\website{http://www.math.vu.nl/}
\def\universityaddress{de Boelelaan 1081, 1081 HV Amsterdam}
\if@dutchlanguage
  \def\logopicture{vulogo-nl}
  \def\departmenttext{Afdeling Wiskunde}
  \def\facultytext{Faculteit der Exacte Wetenschappen}
  \def\universitytext{Vrije Universiteit Amsterdam}
\else
  \def\logopicture{vulogo-en}
  \def\departmenttext{Department of Mathematics}
  \def\facultytext{Faculty of Sciences}
  \def\universitytext{VU University Amsterdam}
\fi
}

\DeclareOption{uva}{
% UvA specific values
\@genericfalse
\def\logosize{8cm}
\def\website{http://www.math.vu.nl/}
\def\universityaddress{de Boelelaan 1081, 1081 HV Amsterdam}
\if@dutchlanguage
  \def\logopicture{uvalogo-nl}  
  \def\departmenttext{Korteweg-de Vries Instituut voor Wiskunde}
  \def\facultytext{Faculteit der Natuurwetenschappen, Wiskunde en Informatica}
  \def\universitytext{Universiteit van Amsterdam}
\else
  \def\logopicture{uvalogo-en} 
  \def\departmenttext{Korteweg-de Vries Institute for Mathematics}
  \def\facultytext{Faculty of Science}
  \def\universitytext{University of Amsterdam}
\fi
}


% Default values for translatable constant text

\def\supervisortext{Supervisor}
\def\titletext{Title}
\def\authortextsingular{Author}
\def\authortextplural{Authors}
\def\datetext{Date}
\def\bytext{by}
\def\tracktext{Track}
\def\secondgradertext{Second examiner}
\def\logosize{5cm}

\def\departmenttext{Mathematics in Amsterdam}
\def\universitytext{Universiteit van Amsterdam \& VU University Amsterdam}
\def\logopicture{uvavulogo}
%\def\facultytext{EMPTY}
%\def\universityaddress{EMPTY}
\def\website{}

\DeclareOption*{%
      \PassOptionsToClass{\CurrentOption}{scrreprt}%
}

\ProcessOptions\relax

\LoadClass{scrreprt}
\setkomafont{disposition}{\bfseries}
%\RequirePackage[a4paper]{geometry}

\RequirePackage{graphicx}

% Variable text commands
\def\institute#1{\gdef\@institute{#1}}
\def\instituteaddress#1{\gdef\@instituteaddress{#1}}
\def\coverimage#1{\gdef\@coverimage{#1}}
\def\what#1{\gdef\@what{#1}}
\def\track#1{\gdef\@track{#1}}
\def\programme#1{\gdef\@programme{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\secondgrader#1{\gdef\@secondgrader{#1}}

% Default values for variable text
\institute{
\departmenttext\\\smallskip
\if@generic\else \facultytext\\ \fi
%\universitytext\\\bigskip
\medskip\includegraphics[width=\logosize]{\logopicture}
}
\instituteaddress{\departmenttext\\
\universitytext\\
%\universityaddress\\
\if@generic\else \universityaddress\\ \fi
\url{\website}{}
}
\coverimage{}
\what{}
\track{\relax}
\programme{\relax}
\supervisor{\relax}
\secondgrader{\relax}

% Author command
\newcounter{authors}
\def\@authordetails{}
\def\@authors{}
\renewcommand\author[2][\relax]{
    \ifnum\value{authors}>0\relax
        \addtocounter{authors}{1}
        \xdef\@authors{\@authors, #2}
        \protected@xdef\@authordetails{\@authordetails\protect{\\}\indent #2\if#1\relax\else{, #1}\fi}
    \else
        \addtocounter{authors}{1}
        \gdef\@authors{#2}
        \gdef\@authordetails{#2, #1}
    \fi
}



% Maketitle command
\renewcommand{\maketitle}{
\pagestyle{empty}
\vspace*{1pt}
{\centering
\if\@programme\relax
\else {\Large\@programme\par}
\if\@track\relax\else\medskip{\large\tracktext: \@track\par}\fi
\bigskip\fi
{\Large \textit{\@what}\par}\bigskip\medskip\hrule\@height2pt\bigskip
{\LARGE \textbf{\bf \@title}\par}\bigskip\hrule\@height2pt\bigskip\medskip
{\large \bytext\par}\medskip
{\LARGE \@authors
\par}\bigskip
{\large \@date\par}\bigskip\bigskip\bigskip
\if\@supervisor\relax\else {\large\supervisortext: \@supervisor\par}\bigskip\fi
\if\@secondgrader\relax\else {\large\secondgradertext: \@secondgrader\par}\bigskip\fi
\vspace{\stretch{1}}
\@coverimage
\vspace{\stretch{1}}

\@institute

\vspace{-70pt}
}
\newpage
\pagestyle{plain}
}

% Abstract and info page
\renewenvironment{abstract}{\section*{\abstractname}}{
\vfill
%\section*{Gegevens}
\noindent
\titletext: \@title\\
\ifnum\value{authors} < 2%
\authortextsingular: \@authordetails\\
\else
\authortextplural:\\ \indent\@authordetails\\
\fi
\if\@supervisor\relax\else \supervisortext: \@supervisor\\ \fi
\if\@secondgrader\relax\else \secondgradertext: \@secondgrader\\ \fi
\datetext: \@date

\bigskip\noindent
\@instituteaddress
\newpage
}

\endinput

