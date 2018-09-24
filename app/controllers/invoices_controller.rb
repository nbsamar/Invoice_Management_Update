class InvoicesController < ApplicationController


  def index
    @invoices = Invoice.all.page(params[:page]).per(15)
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
    invoices_with_due = ActiveRecord::Base.connection.execute("select * from (select inc.id, inc.amount, inc.reference, co.invoice_id as co_id, co.amount as co_amnt, co.reference as co_ref,(inc.amount - co.amount) as due from collections co, invoices inc where co.invoice_id = inc.id) z where due > 0;")
    @invoices = (invoices_with_due.to_a)
    @invoices = Kaminari.paginate_array(@invoices).page(params[:page]).per(15)
  end

  def collected
    invoices_with_due = ActiveRecord::Base.connection.execute("select * from (select inc.id, inc.amount, inc.reference, co.invoice_id as co_id, co.amount as co_amnt, co.reference as co_ref,(inc.amount - co.amount) as due from collections co, invoices inc where co.invoice_id = inc.id) z where due = 0;")
    @invoices = (invoices_with_due.to_a)
    @invoices = Kaminari.paginate_array(@invoices).page(params[:page]).per(15)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:brand_manager, :narration, :invoice_date,
                                    :amount, :customer_name, :reference)
  end
end
