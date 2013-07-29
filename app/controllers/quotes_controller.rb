class QuotesController < ApplicationController

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      QuoteMailer.quote_email(@quote).deliver
      redirect_to :back, notice: "Quote sent. Thanks for your inquiry."
    else
      error_text = "The quote could not be sent due to the following errors:"
      @quote.errors.full_messages.each do |error|
        error_text << "\n #{error}"
      end
      redirect_to :back, alert: error_text
    end
  end
end
