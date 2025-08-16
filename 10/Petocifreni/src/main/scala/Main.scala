import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

import java.io.File
import java.util.Scanner
import scala.collection.mutable.ArrayBuffer

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Petocifreni")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/10/Petocifreni/brojevi.txt";
    val dataRDD : RDD[String] = sk.textFile(path)     // RDD[String]
    val n = dataRDD.map(t => t.length)                // RDD[Int]
      .filter(t => t==5)
      .count()
    println(n)

    sk.stop()
  }
}
