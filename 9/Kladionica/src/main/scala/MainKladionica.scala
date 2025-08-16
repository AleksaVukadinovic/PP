import java.io.File
import java.util.Scanner
import java.util.concurrent.ThreadLocalRandom
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

class Kladionicar(ime: String, novac: Int, tiket: mutable.HashMap[String, Char], utakmice: mutable.HashMap[String, (Float, Float, Float, Char)]) extends Thread {
  var zarada: Float = 0



  override def run(): Unit = {
    println(s"$ime start")

    utakmice.synchronized {
      utakmice.wait()
    }

    var pogodjeno : Int = 0
    var kvota : Float = 0
    for (t <- tiket) {
      if (t._2 == utakmice(t._1)._4) {
        println(s"Kladionicar $ime JESTE pogodio rezultat utakmice: ${t._1}")
        pogodjeno += 1

        if (utakmice(t._1)._4 == '1') {
          kvota *= utakmice(t._1)._1
        } else if (utakmice(t._1)._4 == 'x') {
          kvota *= utakmice(t._1)._2
        } else if (utakmice(t._1)._4 == '2') {
          kvota *= utakmice(t._1)._3
        } else {
          throw new RuntimeException("Invalid game result")
        }
      }

      if (pogodjeno == 5) {
        println(s"$ime je PROSAO TIKET: $tiket")
        println(s"Dobitak : ${novac*kvota}")
      } else {
        println(s"$ime NIJE PROSAO TIKET: $tiket")
      }

    }


    println(s"$ime end")
  }

  override def toString: String = s"[$ime, $novac: $tiket]"
}

object MainKladionica {
  def main(args: Array[String]): Unit = {
    val utakmiceScanner = new Scanner(File("/home/aleksa/Documents/PP/9/Kladionica/utakmice.txt"))
    val utakmice = new mutable.HashMap[String, (Float, Float, Float, Char)]()
    while(utakmiceScanner.hasNextLine) {
      utakmice.put(utakmiceScanner.nextLine(), (utakmiceScanner.nextFloat(), utakmiceScanner.nextFloat(), utakmiceScanner.nextFloat(), '-'))
      utakmiceScanner.nextLine()
    }
    println(utakmice)

    val kladionicariScanner = new Scanner(File("/home/aleksa/Documents/PP/9/Kladionica/kladionicari.txt"))
    var kladionicari = new ArrayBuffer[Kladionicar]()

    while(kladionicariScanner.hasNextLine) {
      var ime : String = kladionicariScanner.next()
      var novac : Int = kladionicariScanner.nextInt()
      val tiket = new mutable.HashMap[String, Char]()
      kladionicariScanner.nextLine()
      for (i <- 0 until 5) {
        tiket.put(kladionicariScanner.nextLine(), kladionicariScanner.nextLine()(0))
      }
      kladionicari.append(new Kladionicar(ime, novac, tiket, utakmice))
    }
    println(kladionicari)

    for (kladionicar <- kladionicari)
      kladionicar.start()

    println("Igranje utakmica...")
    Thread.sleep(8000)
    println("Uktamice odigrane, rezultati: ")
    val res = Array('1', 'x', '2')
    for (u <- utakmice)
      utakmice(u._1) = (u._2._1, u._2._2, u._2._3, res(ThreadLocalRandom.current().nextInt(0, 3)))
    println(utakmice)

    utakmice.synchronized {
      utakmice.notifyAll()
    }

    for (kladionicar <- kladionicari)
      kladionicar.join()

    println("Main end.")
  }
}
