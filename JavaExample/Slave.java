class Slave extends Thread {

  private Resource sharedResource;
  private boolean done = false;

  public void halt() {
    done = true;
  }

  public Slave(Resource rcs) {
    sharedResource = rcs;
  }

  protected boolean task() {
    // access sharedResource here
    // for example:
    int status = sharedResource.incStatus();
    return 20 <= status;
  }

    public void run() {
      while(!done) {
         done = task();
     // be cooperative:
         try {
       Thread.sleep(1000);
     } // sleep for 1 sec.
         catch(Exception e) {}
      }
   }
}
