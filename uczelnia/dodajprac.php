<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dodaj Pacownika</title>

    <link href="https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed:400,800&amp;subset=latin-ext" rel="stylesheet">

    <link rel="stylesheet" href="styleucz.css">

</head>

<body>
    <div id="abc">
        <header>
            <img src="pracownicy.jpg" alt="logo uczelni" />
        </header>
        <nav>
            <a class="menu" href="index.php">Studenci</a>
            <a class="menu active" href="pracownicy.php">Pracownicy</a>
            <a class="menu" href="grupy.php">Grupy</a>
            <a class="menu" href="przedmioty.php">Przedmioty</a>

        </nav>

        <menu>

            <article>
                <section id="west">
                    <div class="menuWest">
                        <ul>
                            <li><a href="listapracownikow.php">Wyświetl listę pracowników</a></li>
                            <li>Dodaj Pracownika</li>
                            <li><a href="edytujpracownik.php">Wyszukaj pracownika</a></li>

                        </ul>
                    </div>
                </section>
                <section id="east">

                    <div style="height: 550px; width: 700px; overflow-x: hidden;">
                        <h1>Formularz dodawania nowych pracowników</h1>
                        <form action="wynikdodprac.php" method="post">

                            Tytuł: <br> <select id="tytul" name="tytul" style="margin-bottom: 5px;">
                                   <option>Mgr</option>
                                   <option>Mgr inż.</option>
                                   <option>Dr.</option>
                                   <option>Dr.hab.inż.</option>
                                   <option>Prof.dr. hab.</option>
                               </select><br>
                            <input type="text" name="imie" placeholder="imię" style="font-size: 18px; height: 22px; margin-bottom: 5px;" required><br>
                            <input type="text" name="naz" placeholder="nazwisko" style="font-size: 18px; height: 22px" required><br> Adres:

                            <br><input type="text" name="ulica" placeholder="ulica" style="font-size: 18px; height: 22px; margin-bottom: 5px;" required>
                            <br> <input type="text" name="miej" placeholder="miejscowość" style="font-size: 18px; height: 22px; margin-bottom: 5px;" required><br>
                            <input type="text" name="kod" placeholder="kod pocztowy" style="font-size: 18px; height: 22px; margin-bottom: 5px;" required><br> Dane Kontaktowe:
                            <br> <input type="text" name="tels" placeholder="tel. stacjonarny" style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br>
                            <input type="text" name="telk" placeholder="tel. komórkowy" style="font-size: 18px; height: 22px; margin-bottom: 5px;" />
                            <br> <input type="text" name="mail" placeholder="adres e-mail" style="font-size: 18px; height: 22px; margin-bottom: 5px;" required><br> Stanowisko :<br>
                            <select id="tytul" name="stan">
                                   <option> wykładowca</option>
                                   <option>asystent</option>
                                   <option>rektor</option>
                               </select><br> Oddział :<br>
                            <select id="tytul" name="odddzial">
                                   <option value="1">WSIZ "Copernicus"</option>
                                   <option value="2">WSIZ "Copernicus" Filia w Legnicy</option>
                                   <option value="3">WSIZ "Copernicus" Filia w Opolu</option>
                               </select><br><br>

                            <input id="przycisk" type="submit" value="Dodaj pracownika" /><br>


                        </form>

                    </div>

                </section>

            </article>
        </menu>



        <footer>projekt aplikacji bazodanowej "Dziekanat"

        </footer>

    </div>
</body>

</html>

<!--font-family: 'Barlow Semi Condensed', sans-serif;
