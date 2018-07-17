<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lista Pracowników</title>

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
                            <li>Wyświetl listę pracowników</li>
                            <li><a href="dodajprac.php">Dodaj Pracownika</a></li>
                            <li><a href="edytujpracownik.php">Wyszukaj pracownika</a></li>

                        </ul>
                    </div>
                </section>
                <section id="east">

                    <div style="height: 550px; width: 700px; overflow-x: hidden;">
<?php
                require_once'connect.php';
                $conn = new mysqli($host, $db_user, $db_password, $db_name);
                        
               if($conn->connect_error) die($conn->connect_error);
               
                $query = "SELECT * FROM pracownik";
                $result=$conn->query($query);
                        
               if(!$result) die ($conn->error);
               $rows = $result->num_rows;
                        
               for( $j = 0; $j < $rows; ++$j)
               {
                   $result->data_seek($j);
                   $wiersz = $result->fetch_array(MYSQLI_ASSOC);
                   echo '<br>';
                   echo 'ID pracownika:  '  .$wiersz['idPracownika'].'<br>';
                   echo $wiersz['Tytul'].' '.$wiersz['Imie'].' '.$wiersz['Nazwisko'].'<br><br>';
                   
                   
                   echo "<a href='editprac.php?edit=$wiersz[idPracownika]'><input id='przycisk' type='button' value='Edytuj dane'></a>".'        '."<a href='usunprac.php?edit=$wiersz[idPracownika]'><input id='przyciskusun' type='button' value='Usuń' onclick='return confirm_alert(this);' ></a>"."<br>";
                
                  
                }
                        $result->close();
                        $conn->close();
               
?>
                            <script language="javascript">
                                function confirm_alert(node) {

                                    return confirm("Czy na pewno chcesz usunąc dane pracownika?");

                                }

                            </script>

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
