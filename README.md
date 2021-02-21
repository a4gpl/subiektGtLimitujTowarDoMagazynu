# subiektGtLimitujTowarDoMagazynu
Trigger ukrywający towary z wybranych grup po zmianie magazynu.

Trigger porównuje kolumnę `sl_GrupaTw.grt_NrAnalityka` z `sl_Magazyn.mag_Analityka` - kolumny te często są puste.

## Instalacja:

* Wykonaj kopię bazy danych Subiekt GT
* Uzupełnij kolumnę `sl_GrupaTw.grt_NrAnalityka` - rozdzielając grupy względem magazynów (branży)
* Uzupełnij kolumnę `sl_Magazyn.mag_Analityka` - używając identyfikatorów z `grt_NrAnalityka` zmapuj Magazyny do grup.
* Uruchom zapytanie z pliku subiektGtLimitujTowarDoMagazynu/src/trigger_tw_UsunZerowyStanWgGrupy.sql
* Zapisz Towar (lub uaktualnij wszystkie przy użyciu zmian Zbiorczych)

## Działanie:

Trigger usunie zbędne wiersze z tabeli `tw_Stan` biorąc pod uwagę relację pomiędzy grupami i magazynami. Trigger pomija stary **niezerowe**, a więc nie wpływa na stan Towarów magazynowy, a Towary w magazynie pojawią się po przyjęciu ich na stan, nawet jeżeli Grupa Towaru wskazuje inny magazyn. 


Przed instalacją zaleca się przetestowanie rozwiązania na skopiowanej bazie danych. 
