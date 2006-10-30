.\" {PTM/WK/1999-11}
.TH RosettaMan 1
.SH NAZWA
RosettaMan, rman - odwrotna kompilacja stron man z postaci sformatowanej
do ró¿nych formatów ¼ród³owych
.SH SK£ADNIA
rman [ \fIopcje \fR] [ \fIplik \fR] 
.SH OPIS
\fIRosettaMan\fR przyjmuje strony man podrêcznika systemowego z wiêkszo¶ci
popularnych odmian Unixa i przekszta³ca je na jeden z wielu formatów tekstu
¼ród³owego. Uprzednio \fIRosettaMan\fR wymaga³, by przed przetwarzaniem
strony zosta³y sformatowane przez nroff. Od wersji 3.0 \fIwoli
¼ród³a [tn]roff\fR i zwykle daje wyniki, które s± jeszcze lepsze. Za¶
przetwarzanie ¼ród³owej postaci stron man jest jedyn± metod± t³umaczenia
tabel.
.PP
W analizie ¼róde³ [tn]roff powinno siê zaimplementowaæ dowolnie du¿y
podzbiór [tn]roff, czego nie zrobi³em i nie zrobiê, zatem wyniki mog± byæ
do¶æ odleg³e. Zaimplementowa³em jednak znacz±cy podzbiór u¿ywanych
w stronach man, ³±cznie z tbl (ale nie eqn), testami if, definicjami makr
ogólnych. Wyniki zatem zwykle wygl±daj± doskonale. Je¶li nie, sformatuj
stronê przy pomocy nroff przed przes³aniem jej do RosettaMan. Je¶li jednak
RosettaMan nie rozpoznaje wa¿nego makra u¿ywanego przez liczn± klasê stron
man, to wy¶lij mi e-mail ze ¼ród³em i stron± sformatowan± nroff-em a
zobaczê, co da siê zrobiæ. Uruchamiaj±c RosettaMan ze ¼ród³em strony
zawieraj±cym makro .so (w³±czanie innych albo przekierowanie
do innego ¼ród³a [tn]roff), powiniene¶ byæ w katalogu nadrzêdnym danej
strony, gdy¿ strony s± zapisywane przy takim w³a¶nie za³o¿eniu. Na przyk³ad,
je¶li przekszta³casz /usr/man/man1/ls.1, to zmieñ uprzednio katalog na /usr/man. 
.PP
\fIRosettaMan \fR przyjmuje strony man z: SunOS, Sun Solaris, 
Hewlett-Packard HP-UX, AT&T System V, OSF/1 aka Digital UNIX, 
DEC Ultrix, SGI IRIX, Linux, FreeBSD, SCO. Przetwarzanie postaci ¼ród³owej
dzia³a dla: SunOS, Sun Solaris, Hewlett-Packard HP-UX, AT&T System 
V, OSF/1 aka Digital UNIX, DEC Ultrix. Potrafi tworzyæ drukowalne
tylko-ASCII (usuniête znaki steruj±ce), tylko-nag³ówki-sekcji, 
Tk, TkMan, [tn]roff (tradycyjne ¼ród³a stron man), SGML, HTML, 
MIME, LaTeX, LaTeX2e, RTF, Perl 5 POD. Modularna budowa umo¿liwia ³atwe
dodawanie dodatkowych formatów wyj¶ciowych.
.PP
Najnowsza wersja RosettaMan dostêpna jest zawsze z
\fIftp://ftp.cs.berkeley.edu/ucb/people/phelps/tcltk/rman.tar.Z\fR. 
.SH OPCJE
Poni¿sze dwie opcje nie powinny byæ u¿ywane z innymi. Powoduj± zakoñczenie
pracy przez RosettaMan bez przetwarzania wej¶cia.
.TP
.BR -h ", " --help 
Poka¿ listê opcji wiersza poleceñ i zakoñcz pracê.
.TP
.BR -v ", " --version 
Poka¿ numer wersji i zakoñcz pracê.
.PP
\fIFiltr powiniene¶ podaæ jako pierwszy, gdy¿ ta ustawia ró¿ne inne parametry.
Pozosta³e opcje podaj po nim.
.TP
.BR -f ", " --filter " [" ASCII | roff | TkMan | Tk | Sections | HTML | SGML | MIME |
.RS 14
.BR LaTeX | LaTeX2e | RTF | POD ]
.RE
.RS 8
Ustaw filtr wyj¶cia. Domy¶lnie jest to ASCII.
.RE
.TP
.BR -S ", " --source 
RosettaMan usi³uje samoczynnie okre¶liæ czy dane wej¶ciowe s± w postaci
¼ród³owej czy w sformatowanej; pos³u¿ siê t± opcj± do zadeklarowania wej¶cia
w postaci ¼ród³owej.
.TP
.BR -F ", " --format ", " --formatted 
RosettaMan usi³uje samoczynnie okre¶liæ czy dane wej¶ciowe s± w postaci
¼ród³owej czy w sformatowanej; pos³u¿ siê t± opcj± do zadeklarowania wej¶cia
w postaci sformatowanej.
.TP
.BR -l ", " --title " \fI³añcuch-printf\fR"
W trybie HTML ustawia tytu³ (znacznik <TITLE>) stron man, pobieraj±c parametry
takie jak opcja \fI-r\fR. 
.TP
.BR -r ", " --reference ", " --manref " \fI³añcuch-printf\fR"
W trybach HTML i SGML okre¶la postaæ URL, przy pomocy której pozyskiwaæ
inne strony man. £añcuch mo¿e u¿ywaæ dwu podanych parametrów: nazwy strony
man i jej sekcji. (Zobacz sekcja Przyk³ady.)
Je¿eli ³añcuch jest pusty (tak jak ustawiony z pow³oki przez "-r ''"),
ma warto¶æ `-' lub `off', to odno¶niki wystêpuj±ce na stronie man nie bêd±
wymienione na znaczniki HREF, lecz tylko zapisane czcionk± pochy³± (italic).
Je¶li Twój printf obs³uguje okre¶lanie pozycji XPG3, to mo¿e to byæ do¶æ
elastyczne.
.\" If your printf supports XPG3 positions specifier, this can be quite flexible.
.TP
.BR -V ", " --volumes " \fI<lista rozdzielana drukropkami>\fR"
Ustawia listê dozwolonych wolumenów (czê¶ci) sprawdzanych
podczas wyszukiwania powi±zañ z innymi stronami man. Domy¶lnie jest to
\fI1:2:3:4:5:6:7:8:9:o:l:n:p\fR (nazwy czê¶ci mog± byæ wieloznakowe).
Je¿eli po ³añcuchu zawieraj±cym znaki ró¿ne od bia³ych znaków
wystêpuje bezpo¶rednio lewy nawias, nastêpnie jedna z nazw wolumenów,
za¶ koñczy siê opcjonalnymi innymi znakami i prawym nawiasem -- to taki ³añcuch
zg³aszany jest jako odno¶nik do innej strony man. Je¶li w u¿ytej opcji -V
³añcuch zaczyna siê od znaku równo¶ci, to nie s± dozwolone ¿adne dodatkowe
znaki pomiêdzy dopasowan± nazw± wolumenu a prawym nawiasem. (Opcja ta jest
potrzebna dla SCO UNIX.)
.PP
Poni¿sze opcje maj± zastosowanie tylko wtedy, gdy jako wej¶cie podano strony
sformatowane. Nie maj± zastosowania lub nie zawsze s± obs³ugiwane poprawnie
dla stron w postaci ¼ród³owej.
.TP
.BR -b ", " --subsections 
Oprócz tytu³ów sekcji próbuj rozpoznawaæ tytu³y podsekcji. W niektórych
odmianach mo¿e to powodowaæ k³opoty.
.TP
.BR -K ", " --nobreak 
Wska¿, ¿e strony man nie posiadaj± ³amania strony, zatem nie szukaj w pobli¿u
stopek i nag³ówków. (Starsze makra nroff -man zawsze wstawia³y ³amanie strony,
ale ostatnio niektórzy dostawcy zauwa¿yli, ¿e wydruki robione s± poprzez
troff, podczas gdy nroff -man s³u¿y do formatowania stron do czytania
na ekranie, a zatem usunêli ³amanie stron.)
\fIRosettaMan \fR zwykle obs³uguje tê sytuacjê poprawnie, nawet bez tej flagi.
.TP
.BR -k ", " --keep 
Pozostaw nag³ówki i stopki jako kanoniczny raport na koñcu strony.
.TP
.BR -c ", " --changeleft 
Przesuñ changebars, takie jak znajdowane w stronach man Tcl/Tk, do lewej.
.ig
.\" Analiza poszerzona dzia³a tak dobrze, ¿e opcja --nonaggressive
.\" zosta³a usuniêta
.TP
.BR -m ", " --nonaggressive
\fIWy³±cz\fR poszerzon± analizê stron man. Domy¶lnie w³±czona, poszerzona
analiza stron podrêcznika man opuszcza nag³ówki i stopki, identyfikacjê
sekcji i inne.
..
.TP
.BR -n ", " --name " \fInazwa\fR"
Ustaw nazwê strony man (u¿ywane w formacie roff). Je¶li nazwê pliku podano
w postaci "\fInazwa\fB.\fIsekcja\fR", to nazwa i sekcja s± okre¶lane
automatycznie. Je¶li strona jest analizowana ze ¼ród³a [tn]roff i posiada
wiersz .TH, to s± one wy³uskiwane z tego wiersza.
.TP
.BR -p ", " --paragraph 
Prze³±cznik trybu akapitów. Zastosowany filtr okre¶la, czy wiersze powinny
byæ ³amane, tak jak zrobi³by to nroff, czy te¿ p³yn±æ razem tworz±c akapity.
G³ównie do u¿ytku wewnêtrznego.
.TP
.BR -s ", " section " \fI#\fR"
Ustaw numer wolumenu (czê¶ci, sekcji) strony man (u¿ywane w formacie roff).
.\" W ¼ród³owych automatyczne, w preformatowanych tak naprawdê nie dzia³a
.ig
.TP
.BR -T ", " tables
W³±cz poszerzon± analizê tabel.
..
.TP
.BR -t ", " --tabstops " \fI#\fR"
Niektóre zestawy makr u¿ywaj±, gdzie to mo¿liwe, tabulatorów zamiast spacji
w celu zmniejszenia liczby u¿ywanych znaków. Ta opcja ustawia pozycje
tabulacji co \fI#\fR kolumn. Domy¶lnie co 8.
.SH UWAGI NT.TYPÓW FILTRÓW
.SS ROFF
W niektórych odmianach Unixa strony man dostarczane s± bez ¼róde³ [tn]roff,
czyni±c z Twojej drukarki laserowej niewiele wiêcej ni¿ laserowo napêdzan±
drukarkê rozetkow±.
Ten filtr próbuje odtworzyæ pierwotne dyrektywy [tn]roff, które nastêpnie mog±
byæ skompilowane przez [tn]roff.
.SS TkMan
TkMan, hipertekstowa przegl±darka stron man, pos³uguje siê programem
\fIRosettaMan\fR do pokazywania stron man bez, zwykle zbêdnych, nag³ówków
i stopek na ka¿dej stronie. Zbiera równie¿ nag³ówki sekcji (i opcjonalnie
podsekcji), by z rozwijalnego menu zapewniæ bezpo¶redni dostêp
do odpowiednich czê¶ci strony. TkMan oraz Tcl/Tk, narzêdzie, w którym jest
on napisany, dostêpne s± przez anonimowe ftp z 
\fIftp://ftp.smli.com/pub/tcl/\fR
.SS Tk
Opcja ta generuje tekst w postaci serii list Tcl sk³adaj±cych siê z par
tekst-znaczniki, gdzie nazwy znaczników z grubsza odpowiadaj± u¿ywanym w HTML.
Wynik taki mo¿e byæ wstawiony do tekstowego widgetu Tk przez wykonanie
\fIeval <textwidget> insert end <text>\fR.
Format ten powinien byæ stosunkowo ³atwy do analizowania przez inne programy,
które potrzebuj± zarówno tekstu jak i znaczników. Zobacz te¿ ASCII.
.\" trudno stwierdziæ, jaki jest format u¿ywany przez Ensemble
.ig
.SS Ensemble
Ensemble, multimedialny edytor dokumentów strukturalnych, jest obecnie
rozwijany przez grupy badawcze profesorów Michaela A. Harrisona oraz
Susan L. Graham na University of California, Berkeley.  Przy poprawnej
strukturze i specyfikacjach prezentacji (schematy), wygl±d strony man mo¿e
byæ znacz±co zmieniony przez Ensemble.
..
.SS ASCII
Przy wydruku na drukarce wierszowej strony man usi³uj± uzyskaæ specjalne
efekty tekstu przez nadpisywanie znaków ponownie tymi samymi znakami
(by otrzymaæ pogrubienie) czy znakami dolnej kreski (podkre¶lenia)
(by otrzymaæ pokre¶lenie znaku). Inne oprogramowanie przetwarzaj±ce teksty,
jak edytory, wyszukiwarki czy programy indeksuj±ce musi temu przeciwdzia³aæ.
Filtr ASCII pozbywa siê dodatków z opisanego sposobu formatowania.
Przepuszczenie przez potok wyj¶cia z nroff do \fIcol -b\fR równie¿ usuwa
takie formatowanie, ale pozostawia brzydkie nag³ówki i stopki stron.
Zobacz tak¿e Tk.
.SS Sections
Zrzuca tytu³y sekcji i (opcjonalnie) podsekcji. Mo¿e byæ przydatne dla
innego programu przetwarzaj±cego strony man.
.SS HTML
Przy prostym rozszerzeniu serwera HTTP dla Mosaic czy innej przegl±darki
WWW [np.Netscape], \fIRosettaMan\fR mo¿e w locie tworzyæ wysokiej jako¶ci
kod HTML. Kilka takich rozszerzeñ i wskazanie na inne do³±czone s±
w katalogu \fIcontrib\fR programu \fIRosettaMan\fR.
.SS SGML
Ten filtr zmierza do Docbook DTD, ale mam nadziejê, ¿e kto¶ faktycznie
zainteresowany t± opcj± wyg³adzi tworzone znaczniki. Spróbuj, a zobaczysz,
jak blisko s± one obecnie.
.SS MIME
MIME (Multipurpose Internet Mail Extensions), jak zdefiniowano w RFC 1563, 
odpowiednie do spo¿ycia przez programy pocztowe obs³uguj±ce MIME
albo jako wzbogacone dokumenty Emacsa (>=19.26).
.SS LaTeX i LaTeX2e
Czemu nie? 
.SS RTF
U¿yj wyniku na Mac-u, NeXT lub czymkolwiek. Mo¿e we¼ losowe strony man
i lepiej po³±cz je z systemem dokumentacji NeXTa. Mo¿e NeXT ma swoje w³asne
makra stron man, które to robi±.
.SS PostScript i FrameMaker
W celu uzyskania PostScriptu u¿yj \fIgroff\fR lub \fIpsroff\fR.
By utworzyæ MIF dla FrameMakera pos³u¿ siê jego wbudowanym filtrem.
W obu przypadkach potrzebujesz ¼ród³a \fI[tn]roff\fR, wiêc je¶li dysponujesz
wy³±cznie sformatowan± wersj± strony man, u¿yj najpierw filtru roff
z \fIRosettaMan\fR.
.SH PRZYK£ADY
Konwersja \fIsformatowanej\fR strony podrêcznika man o nazwie \fIls.1\fR
na powrót do postaci ¼ród³owej [tn]roff: 
.PP
\fIrman -f roff /usr/local/man/cat1/ls.1 > /usr/local/man/man1/ls.1\fR
.PP
W celu zaoszczêdzenia miejsca d³ugie strony man s± czêsto kompresowane.
Kompresja jest szczególnie efektywna dla stron sformatowanych, gdy¿ zawieraj±
wiele spacji. Poniewa¿ jest to d³uga strona, prawdopodobnie posiada podsekcje,
które próbujemy wydzieliæ (niektóre zestawy makr nie wyró¿niaj± podsekcji
wystarczaj±co dobrze, by \fIRosettaMan\fR je wykry³). Zamieñmy j± na
format LaTeX-u:
.PP
\fIpcat /usr/catman/a_man/cat1/automount.z | rman -b -n automount -s 1 -f latex > automount.man\fR
.PP
Albo te¿:
.br
\fIman 1 automount | rman -b -n automount -s 1 -f latex > automount.man \fR
.PP
Dla u¿ytkowników HTML/Mosaic [czy Netscape] \fIRosettaMan\fR mo¿e, bez zmiany
kodu ¼ród³owego, utworzyæ odno¶niki (links) HTML do innych stron man w formacie
HTML albo utworzonych wcze¶niej albo w locie. Za³ó¿my najpierw, ¿e wstêpnie
stworzone wersje HTML stron man umieszczane bêd± w \fI/usr/man/html\fR. 
Utwórzmy je jedna po drugiej w nastêpuj±cy sposób:
.PP
\fIrman -f html -r 'http:/usr/man/html/%s.%s.html' /usr/man/cat1/ls.1 > /usr/man/html/ls.1.html \fR
.PP
Je¿eli rozszerzy³e¶ swego klienta HTML tak, by tworzy³ kod HTML w locie, to
powiniene¶ pos³u¿yæ siê czym¶ takim
.PP
\fIrman -f html -r 'http:~/bin/man2html?%s:%s' /usr/man/cat1/ls.1 \fR
.br
przy bie¿±cym tworzeniu wersji HTML stron man.
.SH B£ÊDY/NIEZGODNO¦CI
\fIRosettaMan\fR nie we wszystkich przypadkach jest doskona³y, ale zwykle
wykonuje dobr± robotê, i w ka¿dym przypadku redukuje k³opot z konwersj±
stron podrêcznika man do niewielkich poprawek edycyjnych.
.PP
Tabele w sformatowanych stronach, szczególnie H-P, nie s± obs³ugiwane
najlepiej. Upewnij siê, ¿e jako parametr podajesz plik ¼ród³owy strony, co
umo¿liwi rozpoznanie tabel.
.PP
Przegl±darka stron man o nazwie \fIwoman \fR wykorzystuje swoj± w³asn±
koncepcjê formatowania stron podrêcznika systemowego. Rozwi±zanie to mo¿e byæ
myl±ce dla \fIRosettaMan\fR.
Mo¿esz omin±æ ten problem przesy³aj±c sformatowany tekst strony man wprost
do \fIRosettaMan\fR. 
.PP
Format wynikowy [tn]roff pos³uguje siê fB do w³±czania pogrubienia (Bold).
Je¿eli Twój zestaw makr wymaga .B, to bêdziesz musia³ przetworzyæ
wynik z \fIRosettaMan\fR.
.SH ZOBACZ TAK¯E
.BR tkman (1),
.BR fIxman (1),
.BR man (1),
.BR man (7)
lub
.BR man (5)
.br
w zale¿no¶ci od swojej odmiany UNIXa.
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
