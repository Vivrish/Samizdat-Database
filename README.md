# Samizdat-Database
Společnost Samizdat se zabývá tvorbou a distribucí zakázanou literatury a prodejem povolenou.

Zaměstnanci tuto firmy prodávají různou literaturu, pomáhají tvůrcům trpícím censurou psát tvorby a zúčastňovat se ve aktivitách. Ve skutečnosti společnost pomáhá jenom básníkům a spisovatelům, ale nikdo neví, co se stane zítra, proto databáze umožňuje rozšiřování druhů tvůrců.

Všechna díla zpočátku sbíráme ve obchodu. O něm musíme vědět, jaké zboží (básně a knihy) jsou k dispozici a jaký název má ten obchod .

Každý tvůrce musí mít jméno, příjmení, datum narození, styl ve kterém píše. Také musíme vědět jestli tvůrce je zakázaný státem, protože v takovém případě nemůžeme prodávat ho tvorby ve svém oficiálním obchodu a odešleme je pryč do našeho prodavače, který bude prodávat je individuálně.

Básnící mají možnost se zúčastnit ve tajných schůzkách básníků, kde oni můžou prezentovat své básně nebo diskutovat se jinými účastníky. Tak máme znát, jaké lide budou na schůzce, kdy (datum a čas) a kde (budova) to proběhne. Pro spisovatele taky máme speciální aktivitu: tajný festival knih, tady stejně musíme znát datum, čas, místo a návštěvníky.

Aby kupující věděli, co vlastně kupují, musíme znát název, styl, rok napsaní, autora, cenu, typ (báseň nebo kniha) a velikost (ve stránkách) každou tvorby. Tak přidáme entitu zboží

Z bezpečnostních důvodů pokaždé měníme lokalitu schůzek básníků a festivalů knih. Tak dostáváme další entitu budova, která má maximální kapacitu, adresu, otevírací dobu a cenu pronajmu za jednu hodinu.

Ale nezapomeňme, že většinou pracujeme s zakázanými státem tvůrci, tak policie nechce, abychom se teto festivaly a schůzky konali. Tak občas ve každou budově probíhá policejní kontrola. Na štěstí my máme známosti v policie a vždycky známe datum, čas, místo a policistu, který bude řídit kontrolu.

Zde policista je velmi důležitý detail, protože může se stát, že na kontrolu přijede úplatný policista. V takovém případě nemusíme se bát a klidně můžeme mít jakékoli festivaly a schůzky přímo během kontroly budovy. Jinak musíme zrušit naší plány a provést schůzku čí festival v jiný čas nebo v jiném místě. Pro každého policistu známe jméno, přimění, rok narození a jestli je úplatný.
