import java.io.File
import java.util.Scanner
import scala.collection.mutable.ArrayBuffer

class Mehanicar(id: Int, start: Int, end: Int, data: ArrayBuffer[(String, String)], result: Array[(Int, Int, Double)]) extends Thread {
  override def run(): Unit = {
    var waitSum = 0.0
    var popravkeSum = 0
    var odrzavanjeSum = 0
    for(i<-start until end) {
      val line = data(i)
      val tip = line._2
      var waitTime : Double = 0
      if (tip == "odrzavanje") {
        waitTime  = Math.random() * 3 + 2
        odrzavanjeSum+=1
      } else if (tip == "popravka") {
        waitTime  = Math.random() * 5 + 5
        popravkeSum+=1
      } else {
        throw new Exception("Los tip!")
      }
      waitSum += waitTime
      Thread.sleep(waitTime.toLong)
    }
    result.synchronized(
      result(id) = (odrzavanjeSum, popravkeSum, waitSum)
    )
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    val path = "/home/aleksa/Documents/PP/rokovi/2/automobili.txt"

    val fileScanner = new Scanner(new File(path))
    val inputScanner = new Scanner(System.in)

    val broj_mehanicara = inputScanner.nextInt()
    val data: ArrayBuffer[(String, String)] = new ArrayBuffer[(String, String)]()
    while (fileScanner.hasNextLine) {
      val line = fileScanner.nextLine()
      val lineContent = line.split(" ")
      data.append((lineContent(0), lineContent(1)))
    }

    val result = new Array[(Int, Int, Double)](broj_mehanicara)

    val mehanicari = new Array[Mehanicar](broj_mehanicara)

    val cars = data.length
    val step = Math.ceil(cars.toDouble / broj_mehanicara).toInt

    for (i <- 0 until broj_mehanicara)
      mehanicari(i) = new Mehanicar(i, i*step, Math.min(cars, (i+1)*step), data, result)

    for(m <- mehanicari)
      m.start()

    for(m <- mehanicari)
      m.join()

    var redovno = 0
    var popravke = 0
    var avgVreme = 0.0

    for (entry <- result) {
      redovno += entry._1
      popravke += entry._2
      avgVreme += entry._3
    }

    println(s"Redovno odrzavanje: $redovno vozila")
    println(s"Popravke: $popravke vozila")
    println(s"Prosceno vreme servisiranja : ${avgVreme/cars.toDouble}s")
  }
}
