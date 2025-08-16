import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

import scala.compat.Platform

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Zaposleni")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/11/Zaposleni/zaposleni.txt"
    val data : RDD[String] = sk.textFile(path)
    val results = data
      .filter(t => t.contains("IT PROG"))
      .map(t => {
        val lData : Array[String] = t.split(" ")
        (lData(0), lData(1), lData(3).toLowerCase() + "@company.com")
      })
      .takeSample(withReplacement = false, num = 3, seed = Platform.currentTime)

    sk.stop()
    results.foreach(t => println(t))
  }
}
