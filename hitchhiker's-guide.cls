\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitchhiker's-guide}

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
% Paragraph Formatting
% ================================
\RequirePackage{ragged2e} % Left-align text (ragged-right).
\RaggedRight % Enforce ragged-right alignment globally.
\hfuzz=5pt % Avoid underfull/overfull hbox warnings.
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
\RequirePackage{longtable}  % Tables that span multiple pages
\RequirePackage{colortbl}   % Add colors to tables

% ================================
% Looks
% ================================
\RequirePackage{darkmode} % Darkmode

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

\newtheoremstyle{customstyle} % Unified style for theorems and environments.
{10pt}   % Space above.
{10pt}   % Space below.
{\normalfont} % Body font.
{}        % Indentation.
{\bfseries} % Theorem head font.
{:}       % Punctuation after theorem head.
{.5em}    % Space after theorem head.
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}} % Custom theorem head spec.

% Apply the custom theorem style.
\theoremstyle{customstyle}

% ================================
% Custom Environments
% ================================
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{intuition}[theorem]{Intuition}
\newtheorem{wormhole}[theorem]{Wormhole}
\newtheorem{fallacy}[theorem]{Fallacy}
\newtheorem{example}[theorem]{Example}
\newtheorem{case_study}[theorem]{Case Study}

