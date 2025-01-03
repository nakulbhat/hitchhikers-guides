\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitchhiker's-guide}[2025/01/03 Custom Book Class]

% Base class
\LoadClass{book}

% Required Packages
\RequirePackage[english]{babel}
\RequirePackage{csquotes}

% Geometry and Margins
\RequirePackage[a4paper, inner=0.75in, outer=2in, top=1in, bottom=1in, bindingoffset=0.75in, marginparwidth=1.4in, marginparsep=0.2in]{geometry}

% Annotations
\RequirePackage{marginnote}

% Header and Footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[LE]{\thepage}
\fancyhead[RE]{\guidetitle}
\fancyhead[LO]{\leftmark}
\fancyhead[RO]{\thepage}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancyfoot{}
\renewcommand{\footrulewidth}{0pt}

% Indexing
\RequirePackage{makeidx}
\makeindex

% Paragraphs and Listings
\RequirePackage{ragged2e}
\RequirePackage{enumitem}
\setlist[itemize]{itemsep=0.25\parskip, parsep=0pt}
\setlist[enumerate]{itemsep=0.35\parskip, parsep=0pt}
\RequirePackage[skip=0.2in, indent=0.5in]{parskip}

% Custom Commands
\RequirePackage{xparse}

\NewDocumentCommand{\labelandindex}{m o}{%
  \IfValueTF{#2}{%
    \label{#2} \index{#1}%
  }{%
    \label{#1} \index{#1}%
  }%
}

\newcommand{\thetitle}[1]{\def\guidetitle{#1}}


% Load your custom package
\RequirePackage{hitchhiker's-guide}

% Math and Equations
\RequirePackage{amsmath, amssymb, amsfonts, amsthm}

% References
\RequirePackage[backend=biber]{biblatex}