class QuoteMailer < ActionMailer::Base

  def quote_email(quote)
    @quote = quote
    if quote.attachments?
      quote.attachments.each do |attachment|
        attachments["#{attachment[:ident]}"] = File.read("#{Rails.root.to_s}/public#{attachment[:url]}")
      end
    end
    mail(from: quote.email, to: Company.first.email, subject: "New Quote")
  end
end
