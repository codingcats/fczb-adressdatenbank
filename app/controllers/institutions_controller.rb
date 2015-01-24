class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :edit, :update, :destroy]

  def index
    @institutions = Institution.all
  end

  def new
  	@institution = Institution.new
  end

  def edit
  	@institution = Institution.find(params[:id])
  end

  def show
  	@institution = Institution.find(params[:id])
  end

  def create
  	@institution = Institution.new(institution_params)
  	
  	if @institution.save
  		redirect_to @institution, notice: 'Institution wurde angelegt.'
  	else
  		render :new
  	end	
  end

  def update
  	@institution = Institution.find(params[:id])
  	
  	if @institution.update(institution_params)
  		redirect_to @institution, notice: 'Institution wurde geändert.'
  	else
  		render :edit
  	end
 	end

# DELETE /institution/1
  # DELETE /institution/1.json
  def destroy
    @institution.destroy
    respond_to do |format|
      format.html { redirect_to institutions_url, notice: 'Institution wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
    def institution_params
      params.require(:institution).permit(:name, :street, :postcode, :city, :website, :comment)
    end

  def set_institution
    @institution = Institution.find(params[:id])
  end

end
