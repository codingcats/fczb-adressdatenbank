class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_institution_and_occasion, only: [:new, :edit, :create, :index, :search, :update]
  helper_method :sort_column, :sort_direction

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = ordered_contacts
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"Kontaktliste.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.emails.build
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Kontakt wurde erfolgreich angelegt.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Kontakt wurde erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Kontakt wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def search
    @occasion_ids = params[:contact][:occasion_ids]
    @occasion_ids.find_all{|str| str.to_i.to_s == str}.map(&:to_i)
    @contacts = ordered_contacts.filter_occasions(@occasion_ids)
    respond_to do |format|
      format.html { render 'index' }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"Kontaktliste.csv\""
        headers['Content-Type'] ||= 'text/csv'
        render 'index'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :form_of_address, :position, :landline, :mobile, :fax, :institution_id, :occasion_ids => [], emails_attributes: [:value, :id, :_destroy])
    end

    def set_institution_and_occasion
      @institutions = Institution.all
      @occasions = Occasion.all
    end

    def sortable_attributes
      ['last_name', 'institution', 'postcode']
    end

    def sort_column
      sortable_attributes.include?(params[:sort]) ? params[:sort] : 'last_name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def ordered_contacts
      case sort_column
      when "institution"
        Contact.order_institution(sort_direction)
      when "postcode"
        Contact.order_postcode(sort_direction)
      else
        Contact.order("LOWER(#{sort_column}) #{sort_direction}")
      end
    end
end
