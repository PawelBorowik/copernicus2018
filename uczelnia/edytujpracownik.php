<!DOCTYPE html>


<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Szukaj pracownika</title>

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
                            <li><a href="dodajprac.php">Dodaj Pracownika</a></li>
                            <li><a href="edytujpracownik.php">Wyszukaj pracownika</a></li>

                        </ul>
                    </div>
                </section>
                <section id="east">
                    <h1> Podaj numer lub nazwisko pracownika</h1><br>

                    <form method="post" action="wynikedycjiprac.php">

                        <input type="text" name="znajdz" placeholder="wyszukaj..." style="font-size: 18px; height: 22px; margin-bottom: 5px;" required/><br>

                        <input id="przycisk" type="submit" name="przycisk" value="Szukaj">

                    </form>


                </section>

            </article>
        </menu>



        <footer>projekt aplikacji bazodanowej "Dziekanat"

        </footer>

    </div>
</body>

</html>

<!--font-family: 'Barlow Semi Condensed', sans-serif;
