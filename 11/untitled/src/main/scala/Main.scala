import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("zadatak")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/10/untitled/log.txt"

    val data : RDD[String] = sk.textFile(path)
    val result : Array[(String, Int)] = data
      .filter(t => t.startsWith("[error] ") || t.startsWith("[info] ") || t.startsWith("[warn] "))
      .filter(t => t.contains("java"))
      .map(t => (t.split(" ")(0), t))
      .groupByKey()
      .map (t => (t._1, t._2.size))
      .collect()

    sk.stop()

    result.foreach(x => println(x))
  }
}
