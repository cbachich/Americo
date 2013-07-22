class QuoteMailer < ActionMailer::Base
  default to: "cbachich@gmail.com", subject: "New Quote"

  def quote_email(quote)
    @quote = quote
    if !quote.attachment_1_url.nil?
      attachments["file1"] = File.read("#{Rails.root.to_s}/public#{quote.attachment_1_url}")
    end
    mail(from: quote.email)
  end
end
