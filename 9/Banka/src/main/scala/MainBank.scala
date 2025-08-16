import java.io.File
import java.util.Scanner
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicInteger

class Worker(capital: AtomicInteger, interest: Int, clients: ConcurrentLinkedQueue[Client], indebtedClients: ConcurrentLinkedQueue[Client]) extends Thread {
  override def run(): Unit = {
    while (true) {
      val client = clients.poll()
      if (client == null)
        return

      println(s"Klijent ${client.getName} razgovara sa sluzbenicom")

      capital.synchronized {
        if (client.getMoney > capital.get())
          println(s"Klijent ${client.getName} ne dobija pozajmicu od banke")
        else {
          println(s"Klijent ${client.getName} dobija pozajmicu od banke")
//          Thread.sleep(5000)

          val newCapital = capital.get() - client.getMoney

          indebtedClients.add(client)
          client.setDebt(client.getMoney * (100 + interest) / 100.toFloat)

          indebtedClients.add(client)
          println(s"Klijent ${client.getName} dobio pozajmicu od banke")
        }
      }
    }
  }
}

class Client(name: String, money: Int) {
  private var debt: Float = 0
  def getName: String = name
  def getMoney: Int = money
  def getDebt: Float = debt
  def setDebt(debt: Float): Unit = {
    this.debt = debt
  }

  override def toString: String = s"$name - ($money) [$debt]"
}

object MainBank {
  def main(args: Array[String]): Unit = {
    val fileScanner = new Scanner(File("/home/aleksa/Documents/PP/9/Banka/clients.txt"))
    val clients = ConcurrentLinkedQueue[Client]()
    val indebtedClients = ConcurrentLinkedQueue[Client]()
    while(fileScanner.hasNextLine) {
      clients.add(new Client(fileScanner.next(), fileScanner.nextInt()))
    }

    val inputScanner = new Scanner(System.in)
    print("Kapital: ")
    val capital = new AtomicInteger(inputScanner.nextInt())
    print("Kamata: ")
    val interest = inputScanner.nextInt()
    print("Broj sluzbenica: ")
    val workers = inputScanner.nextInt()

    val bank = new Array[Worker](workers)
    for ( i <- 0 until workers)
      bank(i) = new Worker(capital, interest, clients, indebtedClients)

    for(worker <- bank)
      worker.start()

    for(worker <- bank)
      worker.join()

    println("Rezultat: ")
    println(clients)
    println(indebtedClients)
  }
}
