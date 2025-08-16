object Main {

  def main(args: Array[String]): Unit = {
    // 1. Hello World
    println("Hello World!")

    // jednolinijski komentar
    /*
    vise
    linijski
    komentar
     */

    // 2. Promenljive: val, var
    val c: Int = 43 // tip nije obavezno navoditi
    var x: Int = 32
    x += 10
    // c+=10 val ne moze da se menja
    println("Val c: " + c)
    println("Val x: " + x)

    // 3. Grananje
    print("x je: ")
    if (x>0 && x< 10)
      println("jednocifreni")
    else if (x >= 10 && x< 100)
      println("dvocifreni")
    else
      println(">=3 cifre")

    // 4. Stringovi
    val film : String = "Hari Poter"
    println("Film " + film + " je niska duzine " + film.length() + " karaktera.")
    val duzina : Int = film.length()
    println(s"Film $film je niska od $duzina karaktera")
    println(
      """
        |Ovo je
        |ispis
        |u
        |vise linija
        |""".stripMargin
    )

    // 5. while
    var trajanje : Int = 206
    var sati : Int = 0
    while (trajanje >= 60) {
      sati+=1
      trajanje -= 60
    }
    println(s"Trajanje filma $sati sati i $trajanje minuta")

    // 6. petlja for
    for (i<-0 until 10) // [,)
      print(i + " ")
    println()

    for (i<-0 to 10)  // [,]
      print (i + " ")
    println()

    for (i <- Range(0, 10))  // [,)
      print(i + " ")
    println()

    for (c <- "stringgg")
      print(c + " ")

    for (i <- Range(0, 10, 2))
      print(i + " ")

    for (i <- Range(100, 10, -10))
      print(i + " ")

    for (i <- Range(start = 100, end =  10, step = -10))
      print(i + " ")

    for (i <- Range(start = 0, step=2, end = 10))
      print(i + " ")

    // 7. Nizovi

    var filmovi: Array[String] = new Array[String](4)
    filmovi(0) = "Petar Pan"
    filmovi(1) = "Aladin"
    filmovi(2) = "Troja"
    filmovi(3) = "Tom Sojer"
    for( film <- filmovi)
      println(film)

    // 8. Funkcije
    /*
    def imeFunkcije([nazivArgumenta: Tip]): povratnaVrednost = {
      teloFunkcije
    }
     */

    def ispisiFilmove(filmovi: Array[String]): Unit = {
      println("Filmovi: ")
      for (film <- filmovi)
        println(film)
    }

    ispisiFilmove(filmovi)

    def ispisiFilmoveSortirano(filmovi: Array[String]): Unit = {
      println("Filmovi: ")
      for (film <- filmovi.sortWith(sortirajLT))
        println(film)
    }

    def ispisiFilmoveSortirano2(filmovi: Array[String]): Unit = {
      println("Filmovi: ")
      for (film <- filmovi.sortWith((f1, f2) => {if (f1.compareTo(f2)<0) true else false}))
        println(film)
    }

    def sortirajLT(film1: String, film2: String): Boolean = {
      if (film1.compareTo(film2) < 0)
        return true
      else
        return false
    }

    ispisiFilmoveSortirano(filmovi)
    ispisiFilmoveSortirano2(filmovi)

    // 9. OOP Koncepti

    /*
    class ImeKlase {
      teloKlase
    }

    class ImeKlase(argumentiKonstruktora) {
      teloKlase
    }
     */

    class Film {
      var naslov: String = "-"
      var trajanje: Int = 0
      var godina: Int = 0

      // konstruktor
      def this(naslov: String, trajanje: Int, godina: Int) = {
        this() // ovo se uvek poziva da inicijalizuje objekat
        this.naslov = naslov
        this.godina = godina
        this.trajanje = trajanje
      }

      def getNaslov : String = this.naslov
      def getTrajanje : Int = this.trajanje
      def getGodina : Int = this.godina

      //      override def toString: String = super.toString
      override def toString: String = "Film: " + naslov + " iz " + godina + " godine traje " + trajanje + " minuta"
    }

    val f : Film = new Film("Tom i Dzeri", 35, 1990)
    println(f)

    class CrtaniFilm extends Film {
      var autor : String = "-"

      override def toString: String = "Crtani" + super.toString() + " autora " + this.autor

      def this(naslov: String, trajanje: Int, godina: Int, autor: String) = {
        this()
        this.naslov = naslov
        this.godina = godina
        this.trajanje = trajanje
        this.autor = autor
      }
    }

    val g : CrtaniFilm = new CrtaniFilm("Tom i Dzeri", 35, 1990, "W. Disney")
    println(g)

  }
}
