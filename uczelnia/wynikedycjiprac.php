<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Strona główna</title>

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
                    <div style="height: 550px; width: 700px; overflow-x: hidden;">

                        <h1>Wynik:</h1><br>





    <?php
             require_once'connect.php';
             $conn = new mysqli($host, $db_user, $db_password, $db_name);
    
             if(isset($_POST["przycisk"])){
    
                $search = $conn->real_escape_string($_POST['znajdz']);
                }
    
             $query= $conn->query("SELECT IdPracownika,Nazwisko,Imie FROM pracownik WHERE Nazwisko LIKE '%{$search}%'OR Imie LIKE '%{$search}%' OR IdPracownika = '{$search}'");
             if ($query->num_rows > 0 ){

              
                while ($data = $query->fetch_array())
                    
                    echo $data['IdPracownika'].' '.$data['Imie'].' '.$data['Nazwisko']."<br>"."<a href='editprac.php?edit=$data[IdPracownika]'><input id='przycisk' type='button' value='Edytuj dane'></a>".'        '."<a href='usunprac.php?edit=$data[IdPracownika]'><input id='przyciskusun' type='button' value='Usuń' onclick='return confirm_alert(this);' ></a>"."<br>"."<br>";
                
             }
            else{
                echo "nie znaleziono pracownika". "<br>". "<br>";
                }
                
            $conn->close();


?>
                            <script language="javascript">
                                function confirm_alert(node) {

                                    return confirm("Czy na pewno chcesz usunąc dane pracownika?");

                                }

                            </script>




                            <br><br> <a onclick="location.href='edytujpracownik.php';"><input id="przycisk" type="button" value="Powrót do wyszukiwania"></a>

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
