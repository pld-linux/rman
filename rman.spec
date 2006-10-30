Summary:	PolyglotMan - reverse compilation of man pages
Summary(pl):	PolyglotMan - dekompilacja stron manuala
Name:		rman
Version:	3.2
Release:	2
License:	Artistic
Group:		Applications
Source0:	http://dl.sourceforge.net/polyglotman/%{name}-%{version}.tar.gz
# Source0-md5:	6d1d67641c6d042595a96a62340d3cc6
Source1:	%{name}.1.pl
URL:		http://polyglotman.sourceforge.net/
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
PolyglotMan takes man pages from most of the popular flavors of UNIX
and transforms them into any of a number of text source formats.
PolyglotMan was formerly known as RosettaMan. The name of the binary
is still called rman, for scripts that depend on that name;
mnemonically, just think "reverse man".

%description -l pl
PolyglotMan przyjmuje strony manuala z wiêkszo¶ci popularnych rodzajów
Uniksa i przekszta³ca je w dowolny z wielu formatów ¼ród³owych.
PolyglotMan by³ poprzednio znany jako RosettaMan. Nazwa binarki to
nadal rman ze wzglêdu na skrypty zale¿ne od tej nazwy - ale nale¿y o
niej my¶leæ jako "reverse man" (odwrotny man).

%prep
%setup -q

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{_bindir},%{_mandir}/man1}

%{__make} install \
	BINDIR=$RPM_BUILD_ROOT%{_bindir} \
	MANDIR=$RPM_BUILD_ROOT%{_mandir}/man1

install -D %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/rman.1

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc CHANGES README-rman.txt rman.html
%attr(755,root,root) %{_bindir}/rman
%{_mandir}/man1/rman.1*
%lang(pl) %{_mandir}/pl/man1/rman.1*
