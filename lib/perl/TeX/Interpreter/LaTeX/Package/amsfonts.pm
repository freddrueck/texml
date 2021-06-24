package TeX::Interpreter::LaTeX::Package::amsfonts;

use strict;
use warnings;

sub install ( $ ) {
    my $class = shift;

    my $tex = shift;
    my @options = @_;

    $tex->package_load_notification(__PACKAGE__, @options);

    $tex->read_package_data(*TeX::Interpreter::LaTeX::Package::amsfonts::DATA{IO});

    return;
}

######################################################################
##                                                                  ##
##                           ENVIRONMENTS                           ##
##                                                                  ##
######################################################################

1;

__DATA__

\TeXMLprovidesPackage{amsfonts}[2013/01/14 v3.01 Basic AMSFonts support (texml)]

\new@mathgroup\symAMSa
\new@mathgroup\symAMSb

\@namedef{U/msa/m/n}{}

\RequirePackage{unicode-math}

\DeclareRobustCommand{\frak}[1]{\mathfrak{#1}}
\DeclareRobustCommand{\bold}[1]{\mathbf{#1}}

\let\Bbb\relax
\DeclareRobustCommand{\Bbb}[1]{\mathbb{#1}}

%% These 4 are mathrel in unicode-math (which, FWIW, matches Unicode's
%% description of them as "relations").

\def\lhd  {\mathbin{\vartriangleleft}}  % U+22B2
\def\unlhd{\mathbin{\trianglelefteq}}   % U+22B4
\def\rhd  {\mathbin{\vartriangleright}} % U+22B3
\def\unrhd{\mathbin{\trianglerighteq}}  % U+22B5

\DeclareMathPassThrough{hbar}           % U+0127 [TeX/jax.js]

\def\yen{\mathyen}                      % U+00A5

\DeclareSVGMathChar\circledR\mathord

%% These three arrows are declared mathord in unicode-math, which is
%% probably a bug.

\def\dasharrow     {\mathrel{\rightdasharrow}}  % U+21E2
\def\dashrightarrow{\mathrel{\rightdasharrow}}  % U+21E2
\def\dashleftarrow {\mathrel{\leftdasharrow}}   % U+21E0

\DeclareMathPassThrough{lozenge}                % U+25CA [AMSsymbols.js]
\DeclareMathPassThrough{square}                 % U+25FB [AMSsymbols.js]

\RequirePackage{latexsym}

\TeXMLendPackage

\endinput

__END__
