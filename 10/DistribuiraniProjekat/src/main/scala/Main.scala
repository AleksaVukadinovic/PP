import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Main")
      .setMaster("local[4]")
    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/10/DistribuiraniProjekat/knjiga.txt"
    val outPath = "/home/aleksa/Documents/PP/10/DistribuiraniProjekat/knjiga_output"
    val knjigaRDD : RDD[String] = sk.textFile(path = path)  // RDD[String]
    knjigaRDD.flatMap(t => t.split(" "))                    // RDD[String]
      .map(t => (t, 1))
      .reduceByKey((count1, count2) => count1 + count2 )
      .sortByKey()
      .saveAsTextFile(outPath)

    sk.stop()
  }
}
