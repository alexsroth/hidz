require 'squib'

data = Squib.csv file: 'card-data.csv'
out = './deck/dev'


Squib::Deck.new cards: data['name'].size, layout: 'hidz.yml' do
  background color: 'white'
  rect layout: 'cut', fill_color: 'white', stroke_width: 1 
  rect layout: data['category'], fill_color: 'white'
  rect layout: 'art-back'
  text str: data['name'], layout: 'name', color: 'black'
  rect layout: 'art'
  text str: data['card-type'], layout: 'card-type', color: 'black'
  rect layout: 'desc-back', fill_color: 'white', stroke_width: 1 
  text str: data['desc'], layout: 'desc-text'
  svg layout: data['point-back']
  text str: data['points'], layout: 'e-num', color: 'white'
  # rect layout: 'e-num', fill_color: 'white'
  
  save_png dir: out, prefix: 'dev-'
  save_pdf dir: out, file: 'dev-deck.pdf', trim: 37.5, gap: 2

end