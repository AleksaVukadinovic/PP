import java.io.File
import java.util
import java.util.Scanner
import java.util.concurrent.ConcurrentHashMap
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

class Counter(start: Int, end: Int, lines: ArrayBuffer[String], result: ConcurrentHashMap[Char, Int]) extends Thread {
  override def run(): Unit = {
    for (i <- start until end) {
      val a = lines(i).count(_ == 'a')
      val g = lines(i).count(_ == 'g')
      val c = lines(i).count(_ == 'c')
      val t = lines(i).count(_ == 't')

      result.synchronized {
        result.replace('a', result.get('a') + a)
        result.replace('g', result.get('g') + g)
        result.replace('c', result.get('c') + c)
        result.replace('t', result.get('t') + t)
      }
    }
  }

  override def toString: String = s"Brojac $start - $end"
}

object DNKMain {
  def main(args: Array[String]): Unit = {
    // 1. Load data
    val fileScanner : Scanner = new Scanner(new File("/home/aleksa/Documents/PP/9/DNK/data.txt"))
    val lines = new ArrayBuffer[String]()
    while(fileScanner.hasNextLine) {
      lines.append(fileScanner.nextLine())
    }
    val n = lines.length
    println(s"Duzina DNK sekvence [broj linija]: $n")

    // 2. Setup env
    println(s"Broj fizickih procesora na racunaru: ${Runtime.getRuntime.availableProcessors()}")
    print("Broj niti: ")
    val inputScanner = new Scanner(System.in)
    val threadCount = inputScanner.nextInt()
    val counters = new Array[Counter](threadCount)
    val results = new ConcurrentHashMap[Char, Int](4, 0.75, threadCount)
    results.put('a', 0)
    results.put('g', 0)
    results.put('c', 0)
    results.put('t', 0)

    // 3. Init
    val step = Math.ceil(n.toFloat/threadCount).toInt
    for (i <- 0 until threadCount)
      counters(i) = new Counter(i*step, Math.min((i+1)*step, n), lines, results)
    for (c <- counters)
      println(c)

    // 4. Start
    for (c <- counters)
      c.start()

    // 5. Join
    for (c <- counters)
      c.join()

    // 6. Res
    println(results)
  }
}
