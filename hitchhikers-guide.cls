\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitchhikers-guide}[v3.0.0]

% ================================
% Base Class
% ================================
\LoadClass{book} % This class builds on the "book" document class.

% ================================
% Required Language Packages
% ================================
\RequirePackage[english]{babel} % English language support.
\RequirePackage{csquotes} % Context-sensitive quotation marks.

% ================================
% Page Layout and Margins
% ================================
\RequirePackage[a4paper,
inner=0.6in,
outer=1.8in,
top=1in,
bottom=1in,
bindingoffset=0.75in,
marginparwidth=1.4in,
marginparsep=0.2in]{geometry}

% ================================
% Paragraph Formattingopacityback=0
% ================================
\RequirePackage{ragged2e} % Left-align text (ragged-right).
\RaggedRight % Enforce ragged-right alignment globally.
\hfuzz=15pt % Avoid underfull/overfull hbox warnings.
\hbadness=99999
\vbadness=99999
\RequirePackage{enumitem} % Customization of lists.
\RequirePackage[skip=0.2in, indent=0in]{parskip} % Paragraph spacing.

% ================================
% Annotations (e.g., Margin Notes)
% ================================
\RequirePackage{marginnote} % For margin notes.
\renewcommand\marginfont{\normalfont\scriptsize} % Font for margin notes.

% ================================
% Lists Configuration
% ================================
\setlist[itemize]{itemsep=0.25\parskip, parsep=0pt} % Itemize settings.
\setlist[enumerate]{itemsep=0.25\parskip, parsep=0pt} % Enumerate settings.

% ================================
% Indexing
% ================================
\RequirePackage{makeidx} % Index creation package.
\makeindex % Enable indexing.

% ================================
% Mathematics
% ================================
\RequirePackage{amsmath, amssymb, amsfonts, amsthm} % Standard AMS packages for math.
\RequirePackage{cancel} % Strike-through for mathematical terms.
\RequirePackage{mathtools}

% ================================
% Graphics and Figures
% ================================
\RequirePackage{tikz} % Drawing and illustrations.

% ================================
% Trees
% ================================
\RequirePackage{qtree} % Typesetting simple trees.

% ================================
% Bibliography
% ================================
\RequirePackage[backend=biber]{biblatex} % Biber backend for bibliography.

% ================================
% Tables
% ================================
\RequirePackage{tabularx} % Automatic width adjustment for tables.
\RequirePackage{booktabs} % Professional-quality tables.
\RequirePackage{array} % Extended table formatting.
\RequirePackage{longtable} % Tables that span multiple pages
\RequirePackage{colortbl} % Add colors to tables

% ================================
% Looks
% ================================
\RequirePackage[enable]{darkmode} % Darkmode

% ================================
% Custom Commands
% ================================
% Label and index a section simultaneously.
\NewDocumentCommand{\labelandindex}{m o}{%
\IfValueTF{#2}{%
\label{#2} \index{#1}%
}{%
\label{#1} \index{#1}%
}%
}

% Define the title of the guide.
\newcommand{\thetitle}[1]{\def\guidetitle{#1}}

% ================================
% Header and Footer Configuration
% ================================
\RequirePackage{fancyhdr} % Enhanced headers and footers.
\pagestyle{fancy}
\fancyhead[LE]{\thepage} % Left-even: Page number.
\fancyhead[RE]{\guidetitle} % Right-even: Guide title.
\fancyhead[LO]{\leftmark} % Left-odd: Chapter title.
\fancyhead[RO]{\thepage} % Right-odd: Page number.
\fancyfoot{} % No footer content.
\renewcommand{\footrulewidth}{0pt} % Disable footer rule.

% Update chapter mark for fancyhdr.
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% ================================
% Abstract Environment
% ================================
\newenvironment{abstract}
{\section*{Abstract}\itshape}
{\par}

% ================================
% Code Listings
% ================================
\RequirePackage{xcolor} % Color definitions.
\definecolor{lightgray}{rgb}{0.9, 0.9, 0.9} % Light gray background for code.
\RequirePackage{minted} % Syntax-highlighted code listings.
\setminted{
bgcolor=lightgray,
fontsize=\small,
frame=single,
linenos=true,
numbersep=5pt,
breaklines=true,
mathescape=true,
texcl=true
}

% ================================
% Custom Theorem Style
% ================================
\RequirePackage[most]{tcolorbox}
\IfDarkModeTF
{% true
\newtcbtheorem[auto counter,number within=chapter]{exampletcb}{Example}{
standard jigsaw, breakable,
coltitle=white,
coltext=white,
colframe = blue!50!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{exmp}

\newtcbtheorem[auto counter,number within=chapter]{theoremtcb}{Theorem}{
standard jigsaw, breakable,
coltitle=white,
coltext=white,
colframe = violet!90!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{thm}

\newtcbtheorem[auto counter,number within=chapter]{definitiontcb}{Definition}{
standard jigsaw, breakable,
coltitle=black,
coltext=white,
colframe = yellow!70!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{defn}

\newtcbtheorem[auto counter,number within=chapter]{algorithmtcb}{Algorithm}{
standard jigsaw, breakable,
coltitle=white,
coltext=white,
colframe=green!50!black, % Change to a standard color for debugging
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{algx}
}{% false

\newtcbtheorem[auto counter,number within=chapter]{exampletcb}{Example}{
standard jigsaw, breakable,
coltitle=black,
coltext=black,
colframe = blue!50!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{exmp}

\newtcbtheorem[auto counter,number within=chapter]{theoremtcb}{Theorem}{
standard jigsaw, breakable,
coltitle=black,
coltext=black,
colframe = purple!50!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{thm}

\newtcbtheorem[auto counter,number within=chapter]{definitiontcb}{Definition}{
standard jigsaw, breakable,
coltitle=black,
coltext=black,
colframe = red!40!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{defn}

\newtcbtheorem[auto counter,number within=chapter]{algorithmtcb}{Algorithm}{
standard jigsaw, breakable,
coltitle=black,
coltext=black,
colframe = orange!50!black,
fonttitle=\small\bfseries,
description font=\normalfont,
opacityback=0
}{algo}
}

% ================================
% Hyperlinks and Cross-References
% ================================
\RequirePackage[hidelinks]{hyperref} % Hyperlinks without colored boxes or borders.
\RequirePackage{cleveref} % Smart referencing (automatically adds 'Section', 'Equation', etc.)

% Define reference names for tcolorbox environments
\crefname{tcb@cnt@exampletcb}{example}{examples}
\Crefname{tcb@cnt@exampletcb}{Example}{Examples}

\crefname{tcb@cnt@theoremtcb}{theorem}{theorems}
\Crefname{tcb@cnt@theoremtcb}{Theorem}{Theorems}

\crefname{tcb@cnt@algorithmtcb}{algorithm}{algorithms}
\Crefname{tcb@cnt@algorithmtcb}{Algorithm}{Algorithms}

\crefname{tcb@cnt@definitiontcb}{definition}{definitions}
\Crefname{tcb@cnt@definitiontcb}{Definition}{Definitions}