import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Skalarni Proizvod")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)
    val path1 = "/home/aleksa/Documents/PP/10/SkalarniProizvod/vektor1.txt"
    val path2 = "/home/aleksa/Documents/PP/10/SkalarniProizvod/vektor2.txt"

    val v1RDD : RDD[Int] = sk.textFile(path1)
      .flatMap(t => t.split(", "))
      .map(t => t.toInt)
    val v2RDD : RDD[Int] = sk.textFile(path2)
      .flatMap(t => t.split(", "))
      .map(t => t.toInt)
    val sp = v1RDD.zip(v2RDD)
      .map(t => t._1 * t._2)
      .sum()
    println(sp)

    sk.stop()
  }
}
