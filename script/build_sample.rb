# These will be used to build generice pages
p_title = "Something snappy!"

p_short = "This is a short one or two sentence description for the page. It is used for pictures and links."

p_desc = "This will be a few paragraphs describing this subcontent. It should provide more detail about this type of things we do for this kind of work. The idea here is we want to capture the customer's attention if this is what they are specifically looking for.\r\n\r\nSo the more detail here the better! We should talk about some of the past projects we've supported and maybe even plans for the future.\r\n\r\nWe might want to talk about the type of tools/machinery/experience for this specific task. We also might want to provide some pictures in between this text. Will need to look into that."

# Start by building the company's high level information
c = Company.create(title: "AmeriCo Inc", logo_url: "americo_logo_ultra.png", phone: "(719) 475-2199", fax: "(719) 475-2186")

# Add the overall description of the company that will be seen on the home page
c.description = Description.create(title: "Quality Service For Over 25 Years", body: "This is a body of text that will describe how great this company is. It will include a little information on the history of the company, as well as what type of work they currently do.\r\n\r\nThere will be multiple paragraphs, so I want to add a few just to see how it looks on the page. Hopefully there will be enough detail in these few paragraphs to hook the customer into finding out more about the company.\r\n\r\nMaybe we should even invite the customer to learn more or contact us to get a quote. Actually we really should include a link under this paragraph for getting a quote!")
 
# Create a work sheet
ss = c.sheets.create(name: "services")
ss.description = Description.create(title: "Services", body: "Here we provide a very high level sentence describing the kind of work done here")

ss_names = 
  [
    {name: "fabrication", title: "Fabrication"},
    {name: "machining",   title: "Machining"},
    {name: "metal",       title: "Sheet Metal"},
    {name: "sales",       title: "Raw Material"},
    {name: "adapters",    title: "Adapters"}
  ]

pics = 
  [
    { url:   "sample_01.jpg", 
      title: "Picture Sample 1", 
      body:  "A little description of picture 1. Should be 1 or 2 sentences." },
    { url:   "sample_02.jpg", 
      title: "Picture Sample 2", 
      body:  "A little description of picture 2. Should be 1 or 2 sentences." }
  ]

ss_names.each_with_index do |p,i|
  image = p[:name] + "_big.jpg"
  p = ss.pages.create(
    name: p[:name], 
    banner_img_url: image, 
    title: p[:title], 
    reversed: (i+1).even?)
  p.description = Description.create(title: p_title, short_body: p_short, body: p_desc)
  pic = p.pictures.create(url: pics[0][:url])
  pic.description = Description.create(title: pics[0][:title], body: pics[0][:body])
  pic = p.pictures.create(url: pics[1][:url])
  pic.description = Description.create(title: pics[1][:title], body: pics[1][:body])
end

# Create a About sheet
as = c.sheets.create(name: "about")
as.description = Description.create(title: "About", body: "Here we provide a very high level sentence describing the company")

as_names = 
  [
    {name: "quality",    title: "Quality"},
    {name: "experience", title: "Experience"},
    {name: "history",    title: "History"}
  ]

as_names.each_with_index do |p,i|
  image = p[:name] + "_big.jpg"
  p = as.pages.create(
    name: p[:name], 
    banner_img_url: image, 
    title: p[:title], 
    reversed: (i+1).even?)
  p.description = Description.create(title: p_title, short_body: p_short, body: p_desc)
  pic = p.pictures.create(url: pics[0][:url])
  pic.description = Description.create(title: pics[0][:title], body: pics[0][:body])
  pic = p.pictures.create(url: pics[1][:url])
  pic.description = Description.create(title: pics[1][:title], body: pics[1][:body])

end
