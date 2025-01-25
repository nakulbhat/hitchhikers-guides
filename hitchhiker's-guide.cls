\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitchhiker's-guide}[v1.1.0]

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
\RequirePackage[skip=0.2in, indent=0.5in]{parskip} % Paragraph spacing.

% ================================
% Annotations (e.g., Margin Notes)
% ================================
\RequirePackage{marginnote} % For margin notes.
\renewcommand\marginfont{\normalfont\scriptsize} % Font for margin notes.

% ================================
% Lists Configuration
% ================================
\setlist[itemize]{itemsep=0.25\parskip, parsep=0pt} % Itemize settings.
\setlist[enumerate]{itemsep=0.35\parskip, parsep=0pt} % Enumerate settings.

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
\usepackage{qtree} % Typesetting simple trees.

% ================================
% Bibliography
% ================================
\RequirePackage[backend=biber]{biblatex} % Biber backend for bibliography.

% ================================
% Tables
% ================================
\RequirePackage{tabularx} % Automatic width adjustment for tables.
\usepackage{booktabs} % Professional-quality tables.
\usepackage{array} % Extended table formatting.

% ================================
% Load Custom Style Package
% ================================
\RequirePackage{hitchhiker's-guide} % Load custom style definitions from .sty file.
