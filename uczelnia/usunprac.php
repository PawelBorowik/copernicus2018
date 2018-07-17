<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Usuwanie danych pracownika</title>

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
                            <li><a href="edytujpracownik.php">Edytuj dane</a></li>

                        </ul>
                    </div>
                </section>

                <section id="east">
                    <div style="height: 550px; width: 700px; overflow-x: hidden;">
<?php
    error_reporting(E_ALL ^ E_NOTICE);
    require_once'connect.php';
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
                        
    if($conn->connect_error) die($conn->connect_error);
        
    $id=$_GET['edit'];
             
             
     $query = $conn->query("DELETE FROM pracownik WHERE idPracownika ='$id'") ;
                
     echo " Dane pracownika zostały usunięte!".'<br>'.'<br>';

     mysqli_close($conn);
                           
    
?>

 <a onclick="location.href='edytujpracownik.php';"><input id="przycisk" type="button" value="Powrót do wyszukiwania"></a>


                    </div>

                </section>

            </article>
        </menu>



        <footer>projekt aplikacji bazodanowej "Dziekanat"

        </footer>

    </div>
</body>

</html>


