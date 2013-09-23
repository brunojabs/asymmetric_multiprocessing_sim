public class Resource {

  private int status = 0;

  public synchronized int incStatus() {
    int local = status;
    System.out.println("\nstatus = " + local);
    local++;
    try {
      Thread.sleep(50);
    } catch(Exception e) {

    }
    status = local;
    System.out.println("now status = " + local);
    return status;
  }

}
