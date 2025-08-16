import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Maven Log")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/11/MavenLog/mavenLog.txt"
    val data : RDD[String] = sk.textFile(path)

    val lines = data
      .filter(l => l.startsWith("Downloaded: ") || l.startsWith("Downloading: "))

    val downloaded : Long =  lines
      .filter(t => t.startsWith("Downloaded: "))
      .count()

    val downloading : Long =  lines
      .filter(t => t.startsWith("Downloading: "))
      .count()

    sk.stop()
    println("Success percentage: %.2f%%".format(100.0*downloaded/downloading))
  }
}
