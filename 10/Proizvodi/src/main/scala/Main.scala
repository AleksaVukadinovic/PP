import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

import java.io.{File, PrintWriter}

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("Proizvodi")
      .setMaster("local[4]")

    val sk = new SparkContext(config = conf)

    val path = "/home/aleksa/Documents/PP/10/Proizvodi/uredjaji.txt"
    val outPath = "/home/aleksa/Documents/PP/10/Proizvodi/uredjaji_output"

    val uredjajiRDD : RDD[String] = sk.textFile(path)
      uredjajiRDD.map(t => {
        val deviceData = t.split(" ")
        (deviceData(0), deviceData.drop(1).mkString(" "))
      })
      .groupByKey()
      .foreach(t => {
        val writer = new PrintWriter(new File(outPath + t._1.toLowerCase()))
        writer.write("------" + t._1 + "------\n")
        t._2.foreach(s => {
          writer.append(s + "\n")
        })
        writer.close()
      })

    sk.stop()
  }
}
