class FakeProcessesController < ApplicationController
  before_action :set_fake_process, only: [:show, :edit, :update, :destroy]

  # GET /fake_processes
  # GET /fake_processes.json
  def index
    @fake_processes = FakeProcess.all
  end

  # GET /fake_processes/1
  # GET /fake_processes/1.json
  def show
  end

  # GET /fake_processes/new
  def new
    @fake_process = FakeProcess.new(name: "teste1")
  end

  # GET /fake_processes/1/edit
  def edit
  end

  # POST /fake_processes
  # POST /fake_processes.json
  def create

    if params.has_key?(:default_name)
      create_multiple
    else
      Master.create(@fake_process)
    end

    respond_to do |format|
      if @fake_process.save || params;has_key?(:default_name)
        format.html { redirect_to '/fake_processes', notice: 'Fake process was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fake_process }
      else
        format.html { render action: 'new' }
        format.json { render json: @fake_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fake_processes/1
  # PATCH/PUT /fake_processes/1.json
  def update
    respond_to do |format|
      if @fake_process.update(fake_process_params)
        format.html { redirect_to @fake_process, notice: 'Fake process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fake_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fake_processes/1
  # DELETE /fake_processes/1.json
  def destroy
    @fake_process.destroy
    respond_to do |format|
      format.html { redirect_to fake_processes_url }
      format.json { head :no_content }
    end
  end


  def create_multiple
    if quantity = params[:quantity].try(:to_i)
      quantity.times do |i| 
        fp = FakeProcess.create(name: "#{params[:default_name]} #{i}", done: false)
        Master.enqueue(fp)
      end
    end
    redirect_to '/fake_processes', notice: 'Criados com sucesso' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_process
      @fake_process = FakeProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fake_process_params
      params.permit(:fake_process).permit(:name, :done)
      params.permit(:quantity, :default_name)
    end
end
