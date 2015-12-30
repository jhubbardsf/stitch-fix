class ClearanceBatchesController < ApplicationController
  before_action :set_batch, only: [:report, :report_pdf]

  def index
    @clearance_batches  = ClearanceBatch.all
  end

  def create
    clearancing_status = ClearancingService.new.process_file(params[:csv_batch_file].tempfile)
    clearance_batch    = clearancing_status.clearance_batch
    alert_messages     = []
    if clearance_batch.persisted?
      flash[:notice]  = "#{clearance_batch.items.count} items clearanced in batch #{clearance_batch.id}"
    else
      alert_messages << "No new clearance batch was added"
    end
    if clearancing_status.errors.any?
      alert_messages << "#{clearancing_status.errors.count} item ids raised errors and were not clearanced"
      clearancing_status.errors.each {|error| alert_messages << error }
    end
    flash[:alert] = alert_messages.join("<br/>") if alert_messages.any?
    redirect_to action: :index
  end

  def report
  end

  def report_pdf
    html = render_to_string "clearance_batches/report", :layout => 'layouts/pdf', encoding: "UTF-8"
    html.gsub!('<a class="pdf-hide" href="/report_pdf/1">Create PDF</a>', '')

    report = WickedPdf.new.pdf_from_string(html)

    send_data(report, :filename => "Batch ID#{@batch.id}.pdf", :type => 'application/pdf')
  end

  private

  def set_batch
    @batch = ClearanceBatch.includes(items: [:style]).find(params[:id])
  end
end
