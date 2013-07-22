class ContactsController < ApplicationController
  def show
    @title   = "Contact Us"
    @summary = "Get a hold of us!"
  end

  def send_quote
    quote = Quote.new
    quote.name = params[:name]
    quote.email = params[:email]
    quote.phone = params[:phone]
    quote.company = params[:company]
    quote.comments = params[:comments]
    quote.attachment_1 = params[:attachment_1] unless params[:attachment_1].nil? 
    quote.attachment_2 = params[:attachment_2] unless params[:attachment_2].nil? 
    quote.attachment_3 = params[:attachment_3] unless params[:attachment_3].nil? 
    quote.attachment_4 = params[:attachment_4] unless params[:attachment_4].nil? 
    quote.attachment_5 = params[:attachment_5] unless params[:attachment_5].nil? 
    
    if quote.save
      QuoteMailer.quote_email(quote).deliver
      redirect_to :back, notice: "Quote sent. Thanks for your inquiry."
    else
      redirect_to :back, notice: "Problem sending quote. Please try again."
    end
  end
end
