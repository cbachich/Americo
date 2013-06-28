# These will be used to build generice pages
p_subtitle = "Something Snappy"

p_short = "This is a short one or two sentence description for the page. It is used for pictures and links."

p_desc = "This will be a few paragraphs describing this subcontent. It should provide more detail about this type of things we do for this kind of work. The idea here is we want to capture the customer's attention if this is what they are specifically looking for.\r\n\r\nSo the more detail here the better! We should talk about some of the past projects we've supported and maybe even plans for the future.\r\n\r\nWe might want to talk about the type of tools/machinery/experience for this specific task. We also might want to provide some pictures in between this text. Will need to look into that."

# Start by building the company's high level information
c = Company.create(
  title:    "AmeriCo Inc", 
  logo_url: "americo_logo_ultra.png", 
  phone:    "(719) 475-2199", 
  fax:      "(719) 475-2186",
  subtitle: "Quality Service For Over 25 Years", 
  summary:  "This is a body of text that will describe how great this company is. It will include a little information on the history of the company, as well as what type of work they currently do.\r\n\r\nThere will be multiple paragraphs, so I want to add a few just to see how it looks on the page. Hopefully there will be enough detail in these few paragraphs to hook the customer into finding out more about the company.\r\n\r\nMaybe we should even invite the customer to learn more or contact us to get a quote. Actually we really should include a link under this paragraph for getting a quote!")
 
# Create a work sheet
ss = c.sheets.create(
  name:     "services",
  title:    "Services",
  subtitle: "Here we provide a very high level sentence describing the kind of work done here")

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
    { title: "Picture Sample 1", 
      details:  "A little description of picture 1. Should be 1 or 2 sentences." },
    { title: "Picture Sample 2", 
      details:  "A little description of picture 2. Should be 1 or 2 sentences." }
  ]

bullets = ["Highlight #1", "Highlight #2", "Highlight #3"]

ss_names.each_with_index do |p,i|
  image = p[:name] + "_big.jpg"
  p = ss.pages.create(
    name: p[:name], 
    banner_img_url: image, 
    title: p[:title], 
    bullet_1: bullets[0],
    bullet_2: bullets[1],
    bullet_3: bullets[2],
    subtitle: p_subtitle,
    short_description: p_short,
    description: p_desc,
    reversed: (i+1).even?)

  for i in 0..1
    p.pictures.create(title: pics[i][:title], details: pics[i][:details])
  end
end

# Create a About sheet
as = c.sheets.create(
  name:     "about",
  title:    "About", 
  subtitle: "Here we provide a very high level sentence describing the company")

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
    bullet_1: bullets[0],
    bullet_2: bullets[1],
    bullet_3: bullets[2],
    subtitle: p_subtitle,
    short_description: p_short,
    description: p_desc,
    reversed: (i+1).even?)

  for i in 0..1
    p.pictures.create(title: pics[i][:title], details: pics[i][:details])
  end
end
