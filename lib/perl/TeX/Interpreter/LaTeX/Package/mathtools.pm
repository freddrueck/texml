package TeX::Interpreter::LaTeX::Package::mathtools;

# Copyright (C) 2022 American Mathematical Society
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For more details see, https://github.com/AmerMathSoc/texml

# This code is experimental and is provided completely without warranty
# or without any promise of support.  However, it is under active
# development and we welcome any comments you may have on it.

# American Mathematical Society
# Technical Support
# Publications Technical Group
# 201 Charles Street
# Providence, RI 02904
# USA
# email: tech-support@ams.org

use strict;
use warnings;

sub install ( $ ) {
    my $class = shift;

    my $tex = shift;

    $tex->package_load_notification();

    $tex->read_package_data();

    return;
}

1;

__DATA__

\ProvidesPackage{mathtools}

\LoadRawMacros

\AtBeginDocument{%
    \def\coloneqq{\coloneq}
}

\let\adjustlimits\@empty

\let\smashoperator\@gobbleopt

% I don't think there's a good way to emulate this.

\def\vdotswithin#1{\ensuremath{\vdots}}

% Meh.

\renewcommand{\prescript}[3]{{}^{#1}_{#2}#3}

\renewcommand*\DeclarePairedDelimiter[3]{%
    \newcommand{#1}{\mathtools@PD{#2}{#3}}%
}

\def\mathtools@PD#1#2{%
    \begingroup
        \maybe@st@rred{\mathtools@PD@{#1}{#2}}%
}

% TBD: optional argument

\def\mathtools@PD@#1#2#3{%
        \ifst@rred
            \left#1#3\right#2%
        \else
            \mathopen{#1}#3\mathclose{#2}%
        \fi
    \endgroup
}

\DeclareMathPassThrough{coloneq}
\DeclareMathPassThrough{underbrace}[1]

\DefineAMSMathSimpleEnvironment{multlined}

\DefineAMSMathSimpleEnvironment{matrix*}

\DefineAMSMathSimpleEnvironment{bmatrix*}
\DefineAMSMathSimpleEnvironment{bsmallmatrix}

\DefineAMSMathSimpleEnvironment{psmallmatrix}

\DefineAMSMathSimpleEnvironment{dcases}
\DefineAMSMathSimpleEnvironment{rcases}

\let\xrightharpoonup\relax
\newcommand{\xrightharpoonup}[2][]{%
    \TeXMLCreateSVG{$\xrightharpoonup[#1]{#2}$}%
}

\let\xhookrightarrow\relax
\newcommand*\xhookrightarrow[2][]{%
    \TeXMLCreateSVG{$\xhookrightarrow[#1]{#2}$}%
}

\DeclareMathPassThrough{xleftrightarrow}%[2][]

\DeclareMathPassThrough{xmapsto}%[2][]

\DefineAMSMathSimpleEnvironment{gathered}

\endinput

__END__
