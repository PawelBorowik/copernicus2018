<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Wynik dodania pracownika</title>

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
                            <li><a href="dodajprac.php"></a>Dodaj Pracownika</li>
                            <li><a href="edytujpracownik.php">Wyszukaj pracownika</a></li>
                            
                        </ul>
                    </div>
                </section>
                <section id="east">

<?php
    require_once "connect.php";
                    
    $conn = new mysqli($host, $db_user, $db_password, $db_name);
                    
                  
     $tytul= $_POST['tytul'];                   
     $imie= $_POST['imie'];
     $nazwisko= $_POST['naz'];
     $ulica= $_POST['ulica'];
     $miejscowosc= $_POST['miej'];               
     $kod= $_POST['kod'];
     $tels= $_POST['tels'];
     $telk= $_POST['telk'];
     $mail= $_POST['mail'];
     $stanowisko= $_POST['stan'];
     $oddzial= $_POST['odddzial'];  
                    
         if (!$conn) {
             die("Connection failed: " . mysqli_connect_error());
         }

          $sql = "INSERT INTO pracownik (Nazwisko, Imie, Adres, Miejscowosc, KodPocztowy, TelStac, TelKom, Email, Tytul, Stanowisko, IdOddzialu) VALUES ('$nazwisko', '$imie', '$ulica','$miejscowosc', '$kod', '$tels', '$telk', '$mail', '$tytul', '$stanowisko', '$oddzial')";

          if (mysqli_query($conn, $sql)) { 
              echo "Dodano nowego pracownika ".$imie." ".$nazwisko;
          } 
                    else {
          echo "Error: " . $sql . "<br>" . mysqli_error($conn);
          }

          mysqli_close($conn);
?>



                </section>

            </article>
        </menu>



        <footer>projekt aplikacji bazodanowej "Dziekanat"

        </footer>

    </div>
</body>

</html>

<!--font-family: 'Barlow Semi Condensed', sans-serif;
