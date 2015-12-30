class ClearanceBatchesController < ApplicationController
  before_action :set_batch, only: [:report, :report_pdf]

  def index
    @clearance_batches  = ClearanceBatch.all
  end

  def create
    process_batch(params[:csv_batch_file].tempfile)
  end

  def report
  end

  def report_pdf
    html = render_to_string "clearance_batches/report", :layout => 'layouts/pdf', encoding: "UTF-8"
    html.gsub!('<a class="pdf-hide" href="/report_pdf/1">Create PDF</a>', '')

    report = WickedPdf.new.pdf_from_string(html)

    send_data(report, :filename => "Batch ID#{@batch.id}.pdf", :type => 'application/pdf')
  end

  def manual_input

  end

  def process_manual
    ids = params['ids']
    id_array = ids.split(',')

    valid = id_array.all? {|i| is_number?(i) }

    if valid && !ids.empty?
      process_batch(id_array)
    else
      flash.now[:error] = 'Invalid input. Please only put item IDs and commas.'
      render :manual_input
    end
  end

  private

  def process_batch(batch)
    clearancing_status = ClearancingService.new.process_file(batch)
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

  def set_batch
    @batch = ClearanceBatch.includes(items: [:style]).find(params[:id])
  end

  def is_number?(object)
    true if Integer(object) rescue false
  end
end
