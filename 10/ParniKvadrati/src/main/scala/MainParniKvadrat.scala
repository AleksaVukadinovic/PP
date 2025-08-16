import org.apache.spark.{SparkConf, SparkContext}

import java.util.Scanner

object MainParniKvadrat {
/*
Za proizvoljan ceo broj n, n > 2 ispisati
kvadrate svih parnih brojeva manjih od n^2
npr n = 10
out: 4, 16, 36, 64, 100
 */
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("ParniKvadrati")
      .setMaster("local[4]")
    val sk = new SparkContext(config = conf)

    val sc = new Scanner(System.in)
    val n = sc.nextInt()
    val niz = (2 to n by 2).toArray
    val nizRDD = sk.parallelize(niz)
    val nizOut = nizRDD.map(t => t * t)
      .collect()

    sk.stop()

    for (elem <- nizOut)
      print(elem + " ")
  }
}
