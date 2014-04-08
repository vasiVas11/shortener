class ShortersController < ApplicationController


  # GET /shorters
  # GET /shorters.json
  def index
    @shorters = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @shorters }
    end
  end

  # GET /shorters/1
  # GET /shorters/1.json
  def show
    @shorter = Shorter.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @shorter }
    end
  end

  # GET /shorters/new
  # GET /shorters/new.json
  def new
    @shorter = Shorter.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @shorter }
    end
  end

  # GET /shorters/1/edit
  def edit
    @shorter = Shorter.find(params[:id])
  end

  # POST /shorters
  # POST /shorters.json
  def create
    @shorter = Shorter.new(params[:shorter])

    unique_url = (Digest::MD5.hexdigest "#{SecureRandom.hex(2)}-#{DateTime.now.to_s}")

    @shorter.identifier = unique_url

    if user_signed_in?
      @shorter.user_id = current_user.id
    end

    respond_to do |format|
      if @shorter.save
        format.html { redirect_to @shorter, notice: 'Shorter was successfully created.' }
        format.json { render :json => {message: "Created successfully", url: short_link_url(@shorter.identifier) } }
      else
        format.html { render action: "new" }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shorters/1
  # PUT /shorters/1.json
  def update

    @shorter = Shorter.find(params[:id])

    authorize! :update, @shorter

    respond_to do |format|
      if @shorter.update_attributes(params[:shorter])
        format.html { redirect_to @shorter, notice: 'Shorter was successfully updated.'}
        format.json { render :json => {message: "Updated successfully", url: short_link_url(@shorter.identifier) } }
      else
        format.html { render action: "edit" }
        format.json { render :json => {message: "Updated failed", url: short_link_url(@shorter.identifier) } }
      end
    end
  end

  # DELETE /shorters/1
  # DELETE /shorters/1.json
  def destroy
    @shorter = Shorter.find(params[:id])

    authorize! :destroy, @shorter

    @shorter.destroy

    respond_to do |format|
      format.html { redirect_to shorters_url }
      format.json { head :no_content }
    end
  end

  def redirect
    @shorter = Shorter.find_by_identifier params[:identifier]
    if @shorter
      redirect_to @shorter.url
    end
  end

  def expire

  end

end
