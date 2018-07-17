<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edycja danych</title>

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
<?php
    error_reporting(E_ALL ^ E_NOTICE);
    require_once'connect.php';
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
                        
    if($conn->connect_error) die($conn->connect_error);
        
    $id=$_GET['edit'];
    $query = $conn->query("SELECT * FROM pracownik WHERE idPracownika ='$id'") ;
                
    $row = $query->fetch_array(MYSQLI_ASSOC);
             
             if(isset ($_POST['edytuj1'])){
                 
                    $id= $_POST['id'];             
                    $tytul= $_POST['tytul'];                   
                    $imie= $_POST['imie'];
                    $nazwisko= $_POST['nazwisko'];
                    $ulica= $_POST['ulica'];
                    $miejscowosc= $_POST['miej'];               
                    $kod= $_POST['kod'];
                    $tels= $_POST['tels'];
                    $telk= $_POST['telk'];
                    $mail= $_POST['mail'];
                    $stanowisko= $_POST['stan'];
                    $oddzial= $_POST['odddzial']; 
              
         }
                 
                 $sql= $conn->query(" UPDATE pracownik SET Nazwisko='$nazwisko', Imie='$imie', Adres='$ulica', Miejscowosc='$miejscowosc', KodPocztowy='$kod', TelStac='$tels', TelKom='$telk', Email='$mail', Tytul='$tytul', Stanowisko='$stanowisko', IdOddzialu='$oddzial' WHERE idPracownika='$id'");
                 
               if ($sql) { 
              echo " Dane pracownika: ".$imie." ".$nazwisko ." "."zostały zmienione!".'<br>'.'<br>';
               }
                

          mysqli_close($conn);
                 
                 
            
    
?>


                <h1>Edytuj dane pracownika:</h1><br>

                            <form method="post" action="editprac.php">
                                Numer pracownika:<br>
                                <input type="text" name="id" value="<?php echo $row['idPracownika'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;" readonly> <br> Tytuł: <br> <select id="tytul" name="tytul" style="margin-bottom: 5px;">
                                   <option  ><?php echo $row['Tytul'];?></option>
                                   <option>Mgr</option>
                                   <option>Mgr inż.</option>
                                   <option>Dr.</option>
                                   <option>Dr.hab.inż.</option>
                                   <option>Prof.dr. hab.</option>-->
                               </select><br>
                                <input type="text" name="imie" value="<?php echo $row['Imie'];?> " style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br>
                                <input type="text" name="nazwisko" value="<?php echo $row['Nazwisko'];?> " style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br> Adres:

                                <br><input type="text" name="ulica" value="<?php echo $row['Adres'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;">
                                <br> <input type="text" name="miej" value="<?php echo $row['Miejscowosc'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br>
                                <input type="text" name="kod" value="<?php echo $row['KodPocztowy'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br> Dane Kontaktowe:
                                <br> <input type="text" name="tels" value="<?php echo $row['TelStac'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br>
                                <input type="text" name="telk" value="<?php echo $row['TelKom'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;" />
                                <br> <input type="text" name="mail" value="<?php echo $row['Email'];?>" style="font-size: 18px; height: 22px; margin-bottom: 5px;"><br> Stanowisko :<br>
                                <select id="tytul" name="stan">
                    <option  ><?php echo $row['Stanowisko'];?></option>
                    <option> wykładowca</option>
                    <option>asystent</option>
                    <option>rektor</option>
            </select><br> Oddział :<br>
                                <select id="tytul" name="odddzial">
                                  <option  ><?php echo $row['IdOddzialu'];?></option>
                                   <option value="1">WSIZ "Copernicus"</option>
                                   <option value="2">WSIZ "Copernicus" Filia w Legnicy</option>
                                   <option value="3">WSIZ "Copernicus" Filia w Opolu</option>
                               </select><br><br>

                                <input id="przycisk" type="submit" name="edytuj1" value="Edytuj">


                                <a onclick="location.href='edytujpracownik.php';"><input id="przycisk" type="button" value="Powrót do wyszukiwania"></a>
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