bash alapú tesztelő.
használat:

A változat, ez csak c esetén próbáltam:
cd _testboX
./testItAll pathToExe pathToProblem
pl.
./testItAll ./main ../_problemS/BelsoSzorzat
ez az adott problema összes io-jára lefuttatja a main-t, 
ha valamelyik eset FAIL, akkor az nem jó.

B változat:
cd _pubTest
cp your main.py,main.java vagy main.cc ide
cp a probléma io készlete a _pubTest/io -ba

g++ checker.cc -o checker
az akt feladat io keszletet masoljuk az io alkonyvtarba:
cp in* and out* into io/

ha python-os amegoldas es main.py a neve
./testItAll main.py python[2|3]

ha java:
javac main.java
./testItAll mainclass java

egyebkent:
g++ main.cc -o main
./testItAll main



