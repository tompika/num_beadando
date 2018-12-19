* news:
  * Az in1@Gershgorin hibás, ignoráld. Köszönöm Zarnescu Krisztián-nak 
  a jelzést!


bash alapú tesztelő.
használat:

* A változat, ez csak c esetén próbáltam:
  * cd _testboX
  * ./testItAll pathToExe pathToProblem
    * ./testItAll ./main ../_problemS/BelsoSzorzat<br>
ez az adott problema összes io-jára lefuttatja a main-t, <br>
ha valamelyik eset FAIL, akkor az nem jó.

* B változat:
  * cd _pubTest
  * cp your main.py,main.java vagy main.cc ide
  * cp a probléma io készlete a _pubTest/io -ba
  * g++ checker.cc -o checker (ha nincsen lefordítva)
  * az akt feladat io keszletet masoljuk az io alkonyvtarba: <br>
     cp in* and out* into io/

  * ha python-os amegoldas es main.py a neve<br>
    ./testItAll main.py python[2|3]

  * ha java:<br>
    javac main.java <br>
    ./testItAll mainclass java
  * egyebkent:<br>
    g++ main.cc -o main<br>
    ./testItAll main

