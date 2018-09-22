class InvoicesController < ApplicationController

  before_action :set_invoices

  def index

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
    # @invoices = Invoice.includes(:collections).where("amount > ?", 0).page(5)
  end

  def collected
    # @invoices = Invoice.includes(:collections).where("amount < ?", 0).page(2)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:brand_manager, :narration, :invoice_date,
                                    :amount, :customer_name, :reference)
  end

  def set_invoices
    @invoices = Invoice.all.page(10)
  end
end
