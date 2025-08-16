import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Temperature Boston")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/11/TemperatureBoston/temperatureBoston.txt"
    val data : RDD[String] = sk.textFile(path)

    val result = data
      .map(l => {
        val lData = l.split(" ")
        (lData(3).toInt, lData(4).toFloat)
      })
      .groupByKey()
      .sortByKey()
      .map(g => (g._1, g._2.sum / g._2.size))
      .collect()

    sk.stop()
    println(result.mkString("Array(", ", ", ")"))
  }
}
