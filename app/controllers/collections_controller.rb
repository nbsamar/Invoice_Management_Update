class CollectionsController < ApplicationController

  def index

  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @invoice.collections.create!(collection_params)
    redirect_to invoices_path()
  end

  private

  def collection_params
    params.require(:collection).permit(:amount, :reference, :collection_date)
  end

end
