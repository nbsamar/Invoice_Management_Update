class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.page(10)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    Invoice.create!(invoice_params)
    redirect_to invoices_path
    flash[:success] = 'Invoice Added'
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def pending
    @invoices = Invoice.includes(:collections).where("amount > ?", 0).page(5)
  end

  def collected
    @invoices = Invoice.includes(:collections).where("amount < ?", 0).page(2)
    # @invoices = Invoice.includes(:collections)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:brand_manager, :narration, :invoice_date,
                                    :amount, :customer_name, :reference)
  end
end
