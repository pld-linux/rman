.\" {PTM/WK/1999-11}
.TH RosettaMan 1
.SH NAZWA
RosettaMan, rman - odwrotna kompilacja stron man z postaci sformatowanej
do r�nych format�w �r�d�owych
.SH SK�ADNIA
rman [ \fIopcje \fR] [ \fIplik \fR] 
.SH OPIS
\fIRosettaMan\fR przyjmuje strony man podr�cznika systemowego z wi�kszo�ci
popularnych odmian Unixa i przekszta�ca je na jeden z wielu format�w tekstu
�r�d�owego. Uprzednio \fIRosettaMan\fR wymaga�, by przed przetwarzaniem
strony zosta�y sformatowane przez nroff. Od wersji 3.0 \fIwoli
�r�d�a [tn]roff\fR i zwykle daje wyniki, kt�re s� jeszcze lepsze. Za�
przetwarzanie �r�d�owej postaci stron man jest jedyn� metod� t�umaczenia
tabel.
.PP
W analizie �r�de� [tn]roff powinno si� zaimplementowa� dowolnie du�y
podzbi�r [tn]roff, czego nie zrobi�em i nie zrobi�, zatem wyniki mog� by�
do�� odleg�e. Zaimplementowa�em jednak znacz�cy podzbi�r u�ywanych
w stronach man, ��cznie z tbl (ale nie eqn), testami if, definicjami makr
og�lnych. Wyniki zatem zwykle wygl�daj� doskonale. Je�li nie, sformatuj
stron� przy pomocy nroff przed przes�aniem jej do RosettaMan. Je�li jednak
RosettaMan nie rozpoznaje wa�nego makra u�ywanego przez liczn� klas� stron
man, to wy�lij mi e-mail ze �r�d�em i stron� sformatowan� nroff-em a
zobacz�, co da si� zrobi�. Uruchamiaj�c RosettaMan ze �r�d�em strony
zawieraj�cym makro .so (w��czanie innych albo przekierowanie
do innego �r�d�a [tn]roff), powiniene� by� w katalogu nadrz�dnym danej
strony, gdy� strony s� zapisywane przy takim w�a�nie za�o�eniu. Na przyk�ad,
je�li przekszta�casz /usr/man/man1/ls.1, to zmie� uprzednio katalog na /usr/man. 
.PP
\fIRosettaMan \fR przyjmuje strony man z: SunOS, Sun Solaris, 
Hewlett-Packard HP-UX, AT&T System V, OSF/1 aka Digital UNIX, 
DEC Ultrix, SGI IRIX, Linux, FreeBSD, SCO. Przetwarzanie postaci �r�d�owej
dzia�a dla: SunOS, Sun Solaris, Hewlett-Packard HP-UX, AT&T System 
V, OSF/1 aka Digital UNIX, DEC Ultrix. Potrafi tworzy� drukowalne
tylko-ASCII (usuni�te znaki steruj�ce), tylko-nag��wki-sekcji, 
Tk, TkMan, [tn]roff (tradycyjne �r�d�a stron man), SGML, HTML, 
MIME, LaTeX, LaTeX2e, RTF, Perl 5 POD. Modularna budowa umo�liwia �atwe
dodawanie dodatkowych format�w wyj�ciowych.
.PP
Najnowsza wersja RosettaMan dost�pna jest zawsze z
\fIftp://ftp.cs.berkeley.edu/ucb/people/phelps/tcltk/rman.tar.Z\fR. 
.SH OPCJE
Poni�sze dwie opcje nie powinny by� u�ywane z innymi. Powoduj� zako�czenie
pracy przez RosettaMan bez przetwarzania wej�cia.
.TP
.BR -h ", " --help 
Poka� list� opcji wiersza polece� i zako�cz prac�.
.TP
.BR -v ", " --version 
Poka� numer wersji i zako�cz prac�.
.PP
\fIFiltr powiniene� poda� jako pierwszy, gdy� ta ustawia r�ne inne parametry.
Pozosta�e opcje podaj po nim.
.TP
.BR -f ", " --filter " [" ASCII | roff | TkMan | Tk | Sections | HTML | SGML | MIME |
.RS 14
.BR LaTeX | LaTeX2e | RTF | POD ]
.RE
.RS 8
Ustaw filtr wyj�cia. Domy�lnie jest to ASCII.
.RE
.TP
.BR -S ", " --source 
RosettaMan usi�uje samoczynnie okre�li� czy dane wej�ciowe s� w postaci
�r�d�owej czy w sformatowanej; pos�u� si� t� opcj� do zadeklarowania wej�cia
w postaci �r�d�owej.
.TP
.BR -F ", " --format ", " --formatted 
RosettaMan usi�uje samoczynnie okre�li� czy dane wej�ciowe s� w postaci
�r�d�owej czy w sformatowanej; pos�u� si� t� opcj� do zadeklarowania wej�cia
w postaci sformatowanej.
.TP
.BR -l ", " --title " \fI�a�cuch-printf\fR"
W trybie HTML ustawia tytu� (znacznik <TITLE>) stron man, pobieraj�c parametry
takie jak opcja \fI-r\fR. 
.TP
.BR -r ", " --reference ", " --manref " \fI�a�cuch-printf\fR"
W trybach HTML i SGML okre�la posta� URL, przy pomocy kt�rej pozyskiwa�
inne strony man. �a�cuch mo�e u�ywa� dwu podanych parametr�w: nazwy strony
man i jej sekcji. (Zobacz sekcja Przyk�ady.)
Je�eli �a�cuch jest pusty (tak jak ustawiony z pow�oki przez "-r ''"),
ma warto�� `-' lub `off', to odno�niki wyst�puj�ce na stronie man nie b�d�
wymienione na znaczniki HREF, lecz tylko zapisane czcionk� pochy�� (italic).
Je�li Tw�j printf obs�uguje okre�lanie pozycji XPG3, to mo�e to by� do��
elastyczne.
.\" If your printf supports XPG3 positions specifier, this can be quite flexible.
.TP
.BR -V ", " --volumes " \fI<lista rozdzielana drukropkami>\fR"
Ustawia list� dozwolonych wolumen�w (cz�ci) sprawdzanych
podczas wyszukiwania powi�za� z innymi stronami man. Domy�lnie jest to
\fI1:2:3:4:5:6:7:8:9:o:l:n:p\fR (nazwy cz�ci mog� by� wieloznakowe).
Je�eli po �a�cuchu zawieraj�cym znaki r�ne od bia�ych znak�w
wyst�puje bezpo�rednio lewy nawias, nast�pnie jedna z nazw wolumen�w,
za� ko�czy si� opcjonalnymi innymi znakami i prawym nawiasem -- to taki �a�cuch
zg�aszany jest jako odno�nik do innej strony man. Je�li w u�ytej opcji -V
�a�cuch zaczyna si� od znaku r�wno�ci, to nie s� dozwolone �adne dodatkowe
znaki pomi�dzy dopasowan� nazw� wolumenu a prawym nawiasem. (Opcja ta jest
potrzebna dla SCO UNIX.)
.PP
Poni�sze opcje maj� zastosowanie tylko wtedy, gdy jako wej�cie podano strony
sformatowane. Nie maj� zastosowania lub nie zawsze s� obs�ugiwane poprawnie
dla stron w postaci �r�d�owej.
.TP
.BR -b ", " --subsections 
Opr�cz tytu��w sekcji pr�buj rozpoznawa� tytu�y podsekcji. W niekt�rych
odmianach mo�e to powodowa� k�opoty.
.TP
.BR -K ", " --nobreak 
Wska�, �e strony man nie posiadaj� �amania strony, zatem nie szukaj w pobli�u
stopek i nag��wk�w. (Starsze makra nroff -man zawsze wstawia�y �amanie strony,
ale ostatnio niekt�rzy dostawcy zauwa�yli, �e wydruki robione s� poprzez
troff, podczas gdy nroff -man s�u�y do formatowania stron do czytania
na ekranie, a zatem usun�li �amanie stron.)
\fIRosettaMan \fR zwykle obs�uguje t� sytuacj� poprawnie, nawet bez tej flagi.
.TP
.BR -k ", " --keep 
Pozostaw nag��wki i stopki jako kanoniczny raport na ko�cu strony.
.TP
.BR -c ", " --changeleft 
Przesu� changebars, takie jak znajdowane w stronach man Tcl/Tk, do lewej.
.ig
.\" Analiza poszerzona dzia�a tak dobrze, �e opcja --nonaggressive
.\" zosta�a usuni�ta
.TP
.BR -m ", " --nonaggressive
\fIWy��cz\fR poszerzon� analiz� stron man. Domy�lnie w��czona, poszerzona
analiza stron podr�cznika man opuszcza nag��wki i stopki, identyfikacj�
sekcji i inne.
..
.TP
.BR -n ", " --name " \fInazwa\fR"
Ustaw nazw� strony man (u�ywane w formacie roff). Je�li nazw� pliku podano
w postaci "\fInazwa\fB.\fIsekcja\fR", to nazwa i sekcja s� okre�lane
automatycznie. Je�li strona jest analizowana ze �r�d�a [tn]roff i posiada
wiersz .TH, to s� one wy�uskiwane z tego wiersza.
.TP
.BR -p ", " --paragraph 
Prze��cznik trybu akapit�w. Zastosowany filtr okre�la, czy wiersze powinny
by� �amane, tak jak zrobi�by to nroff, czy te� p�yn�� razem tworz�c akapity.
G��wnie do u�ytku wewn�trznego.
.TP
.BR -s ", " section " \fI#\fR"
Ustaw numer wolumenu (cz�ci, sekcji) strony man (u�ywane w formacie roff).
.\" W �r�d�owych automatyczne, w preformatowanych tak naprawd� nie dzia�a
.ig
.TP
.BR -T ", " tables
W��cz poszerzon� analiz� tabel.
..
.TP
.BR -t ", " --tabstops " \fI#\fR"
Niekt�re zestawy makr u�ywaj�, gdzie to mo�liwe, tabulator�w zamiast spacji
w celu zmniejszenia liczby u�ywanych znak�w. Ta opcja ustawia pozycje
tabulacji co \fI#\fR kolumn. Domy�lnie co 8.
.SH UWAGI NT.TYP�W FILTR�W
.SS ROFF
W niekt�rych odmianach Unixa strony man dostarczane s� bez �r�de� [tn]roff,
czyni�c z Twojej drukarki laserowej niewiele wi�cej ni� laserowo nap�dzan�
drukark� rozetkow�.
Ten filtr pr�buje odtworzy� pierwotne dyrektywy [tn]roff, kt�re nast�pnie mog�
by� skompilowane przez [tn]roff.
.SS TkMan
TkMan, hipertekstowa przegl�darka stron man, pos�uguje si� programem
\fIRosettaMan\fR do pokazywania stron man bez, zwykle zb�dnych, nag��wk�w
i stopek na ka�dej stronie. Zbiera r�wnie� nag��wki sekcji (i opcjonalnie
podsekcji), by z rozwijalnego menu zapewni� bezpo�redni dost�p
do odpowiednich cz�ci strony. TkMan oraz Tcl/Tk, narz�dzie, w kt�rym jest
on napisany, dost�pne s� przez anonimowe ftp z 
\fIftp://ftp.smli.com/pub/tcl/\fR
.SS Tk
Opcja ta generuje tekst w postaci serii list Tcl sk�adaj�cych si� z par
tekst-znaczniki, gdzie nazwy znacznik�w z grubsza odpowiadaj� u�ywanym w HTML.
Wynik taki mo�e by� wstawiony do tekstowego widgetu Tk przez wykonanie
\fIeval <textwidget> insert end <text>\fR.
Format ten powinien by� stosunkowo �atwy do analizowania przez inne programy,
kt�re potrzebuj� zar�wno tekstu jak i znacznik�w. Zobacz te� ASCII.
.\" trudno stwierdzi�, jaki jest format u�ywany przez Ensemble
.ig
.SS Ensemble
Ensemble, multimedialny edytor dokument�w strukturalnych, jest obecnie
rozwijany przez grupy badawcze profesor�w Michaela A. Harrisona oraz
Susan L. Graham na University of California, Berkeley.  Przy poprawnej
strukturze i specyfikacjach prezentacji (schematy), wygl�d strony man mo�e
by� znacz�co zmieniony przez Ensemble.
..
.SS ASCII
Przy wydruku na drukarce wierszowej strony man usi�uj� uzyska� specjalne
efekty tekstu przez nadpisywanie znak�w ponownie tymi samymi znakami
(by otrzyma� pogrubienie) czy znakami dolnej kreski (podkre�lenia)
(by otrzyma� pokre�lenie znaku). Inne oprogramowanie przetwarzaj�ce teksty,
jak edytory, wyszukiwarki czy programy indeksuj�ce musi temu przeciwdzia�a�.
Filtr ASCII pozbywa si� dodatk�w z opisanego sposobu formatowania.
Przepuszczenie przez potok wyj�cia z nroff do \fIcol -b\fR r�wnie� usuwa
takie formatowanie, ale pozostawia brzydkie nag��wki i stopki stron.
Zobacz tak�e Tk.
.SS Sections
Zrzuca tytu�y sekcji i (opcjonalnie) podsekcji. Mo�e by� przydatne dla
innego programu przetwarzaj�cego strony man.
.SS HTML
Przy prostym rozszerzeniu serwera HTTP dla Mosaic czy innej przegl�darki
WWW [np.Netscape], \fIRosettaMan\fR mo�e w locie tworzy� wysokiej jako�ci
kod HTML. Kilka takich rozszerze� i wskazanie na inne do��czone s�
w katalogu \fIcontrib\fR programu \fIRosettaMan\fR.
.SS SGML
Ten filtr zmierza do Docbook DTD, ale mam nadziej�, �e kto� faktycznie
zainteresowany t� opcj� wyg�adzi tworzone znaczniki. Spr�buj, a zobaczysz,
jak blisko s� one obecnie.
.SS MIME
MIME (Multipurpose Internet Mail Extensions), jak zdefiniowano w RFC 1563, 
odpowiednie do spo�ycia przez programy pocztowe obs�uguj�ce MIME
albo jako wzbogacone dokumenty Emacsa (>=19.26).
.SS LaTeX i LaTeX2e
Czemu nie? 
.SS RTF
U�yj wyniku na Mac-u, NeXT lub czymkolwiek. Mo�e we� losowe strony man
i lepiej po��cz je z systemem dokumentacji NeXTa. Mo�e NeXT ma swoje w�asne
makra stron man, kt�re to robi�.
.SS PostScript i FrameMaker
W celu uzyskania PostScriptu u�yj \fIgroff\fR lub \fIpsroff\fR.
By utworzy� MIF dla FrameMakera pos�u� si� jego wbudowanym filtrem.
W obu przypadkach potrzebujesz �r�d�a \fI[tn]roff\fR, wi�c je�li dysponujesz
wy��cznie sformatowan� wersj� strony man, u�yj najpierw filtru roff
z \fIRosettaMan\fR.
.SH PRZYK�ADY
Konwersja \fIsformatowanej\fR strony podr�cznika man o nazwie \fIls.1\fR
na powr�t do postaci �r�d�owej [tn]roff: 
.PP
\fIrman -f roff /usr/local/man/cat1/ls.1 > /usr/local/man/man1/ls.1\fR
.PP
W celu zaoszcz�dzenia miejsca d�ugie strony man s� cz�sto kompresowane.
Kompresja jest szczeg�lnie efektywna dla stron sformatowanych, gdy� zawieraj�
wiele spacji. Poniewa� jest to d�uga strona, prawdopodobnie posiada podsekcje,
kt�re pr�bujemy wydzieli� (niekt�re zestawy makr nie wyr�niaj� podsekcji
wystarczaj�co dobrze, by \fIRosettaMan\fR je wykry�). Zamie�my j� na
format LaTeX-u:
.PP
\fIpcat /usr/catman/a_man/cat1/automount.z | rman -b -n automount -s 1 -f latex > automount.man\fR
.PP
Albo te�:
.br
\fIman 1 automount | rman -b -n automount -s 1 -f latex > automount.man \fR
.PP
Dla u�ytkownik�w HTML/Mosaic [czy Netscape] \fIRosettaMan\fR mo�e, bez zmiany
kodu �r�d�owego, utworzy� odno�niki (links) HTML do innych stron man w formacie
HTML albo utworzonych wcze�niej albo w locie. Za��my najpierw, �e wst�pnie
stworzone wersje HTML stron man umieszczane b�d� w \fI/usr/man/html\fR. 
Utw�rzmy je jedna po drugiej w nast�puj�cy spos�b:
.PP
\fIrman -f html -r 'http:/usr/man/html/%s.%s.html' /usr/man/cat1/ls.1 > /usr/man/html/ls.1.html \fR
.PP
Je�eli rozszerzy�e� swego klienta HTML tak, by tworzy� kod HTML w locie, to
powiniene� pos�u�y� si� czym� takim
.PP
\fIrman -f html -r 'http:~/bin/man2html?%s:%s' /usr/man/cat1/ls.1 \fR
.br
przy bie��cym tworzeniu wersji HTML stron man.
.SH B��DY/NIEZGODNO�CI
\fIRosettaMan\fR nie we wszystkich przypadkach jest doskona�y, ale zwykle
wykonuje dobr� robot�, i w ka�dym przypadku redukuje k�opot z konwersj�
stron podr�cznika man do niewielkich poprawek edycyjnych.
.PP
Tabele w sformatowanych stronach, szczeg�lnie H-P, nie s� obs�ugiwane
najlepiej. Upewnij si�, �e jako parametr podajesz plik �r�d�owy strony, co
umo�liwi rozpoznanie tabel.
.PP
Przegl�darka stron man o nazwie \fIwoman \fR wykorzystuje swoj� w�asn�
koncepcj� formatowania stron podr�cznika systemowego. Rozwi�zanie to mo�e by�
myl�ce dla \fIRosettaMan\fR.
Mo�esz omin�� ten problem przesy�aj�c sformatowany tekst strony man wprost
do \fIRosettaMan\fR. 
.PP
Format wynikowy [tn]roff pos�uguje si� fB do w��czania pogrubienia (Bold).
Je�eli Tw�j zestaw makr wymaga .B, to b�dziesz musia� przetworzy�
wynik z \fIRosettaMan\fR.
.SH ZOBACZ TAK�E
.BR tkman (1),
.BR fIxman (1),
.BR man (1),
.BR man (7)
lub
.BR man (5)
.br
w zale�no�ci od swojej odmiany UNIXa.
.SH COPYRIGHT
RosettaMan 
.br
Copyright (c) 1993-1996 Thomas A. Phelps (\fIphelps@ACM.org\fR) 
.br
All Rights Reserved. 
.br
developed at the 
.br
University of California, Berkeley 
.br
Computer Science Division 
.PP
Permission to use, copy, modify, and distribute this software 
and its documentation for educational, research and non-profit 
purposes, without fee, and without a written agreement is hereby 
granted, provided that the above copyright notice and the following 
paragraph appears in all copies. 
.PP
Permission to incorporate this software into commercial products 
may be obtained from the Office of Technology Licensing, 2150 
Shattuck Avenue, Suite 510, Berkeley, CA 94704. 
.PP
IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY 
PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL 
DAMAGES ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, 
EVEN IF THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE. 
.PP
THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER 
IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS 
NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, 
OR MODIFICATIONS. 
.PP
Manual page last updated on $Date$ 
