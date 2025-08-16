import java.io.File
import java.util.Scanner

object MainMatrixMul {
  def main(args: Array[String]): Unit = {
    println("Parallel Matrix Multiplication")

    // 1. Load data
    // (n1, m1) x (n2, m2)
    val sc1 : Scanner = new Scanner(new File("/home/aleksa/Documents/PP/8/MnozenjeMatrica/matrica1.txt"))
    val sc2 : Scanner = new Scanner(new File("/home/aleksa/Documents/PP/8/MnozenjeMatrica/matrica2.txt"))
    val n1 : Int = sc1.nextInt()
    val m1 : Int = sc1.nextInt()
    val n2: Int = sc2.nextInt()
    val m2: Int = sc2.nextInt()
    if (m1 != n2)
      throw new RuntimeException("Invalid matrix dimensions. Cannot multiply")

    val matrix1 : Array[Array[Int]] = Array.ofDim(n1, m1)
    val matrix2 : Array[Array[Int]] = Array.ofDim(n2, m2)

    for (i <- 0 until n1)
      for (j <- 0 until m1)
          matrix1(i)(j) = sc1.nextInt()

    for (i <- 0 until n2)
      for (j <- 0 until m2)
        matrix2(i)(j) = sc2.nextInt()

    // 2. Verify Data
    println("Task: ")
    for (i <- 0 until n1) {
      for (j <- 0 until m1)
        print(matrix1(i)(j) + " ")
      println()
    }
    println("x")
    for (i <- 0 until n2) {
      for (j <- 0 until m2)
        print(matrix2(i)(j) + " ")
      println()
    }
    println()

    // 3. Multiplication
    val results : Array[Array[Int]] = Array.ofDim(n1, m2)
    val mnozioci : Array[Mnozilac] = new Array[Mnozilac](n1)
    for (i <- 0 until n1)
      mnozioci(i) = new Mnozilac(matrix1(i), matrix2, results(i))

    for (i <- 0 until n1)
      mnozioci(i).start()
    for (i <- 0 until n1)
      mnozioci(i).join()

    println("=")
    for (i <-0 until n1)
      for (j <- 0 until m2)
        print(results(i)(j) + " ")
      println()
  }
}

class Mnozilac(row: Array[Int], matrix: Array[Array[Int]], resultRow: Array[Int]) extends Thread{

  override def run(): Unit = {
    println("Run: " + row)
    for (i<-resultRow.indices)
      resultRow(i) = scalarProduct(i)
  }

  private def scalarProduct(col: Int): Int = {
    var res : Int  = 0
    for(j <- row.indices)
      res += row(j) * matrix(j)(col)
    return res
  }
}