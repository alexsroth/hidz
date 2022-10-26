require 'squib'

data = Squib.csv file: 'card-data.csv'
out = './deck/prod'


Squib::Deck.new cards: data['name'].size, layout: 'hidz.yml' do
  background color: 'white'
  rect layout: 'cut' 
  rect layout: data['category']
  rect layout: 'art-back', fill_color: 'black'
  text str: data['name'], layout: 'name', color: 'white'
  rect layout: 'art', fill_color: 'white'
  text str: data['card-type'], layout: 'card-type', color: 'white'
  rect layout: 'desc-back', fill_color: '#C5C5C5', stroke_width: 0 
  # text str: data['desc'], layout: 'desc-text'
  text str: data['effect'], layout: 'desc-text'
  text str: data['flavor'], layout: 'flav-text'
  svg layout: data['point-back']
  text str: data['points'], layout: 'e-num', color: 'white'
  # rect layout: 'e-num', fill_color: 'white'
  
  save_png dir: out # prefix: '01_hello_rb'
  save_pdf dir: out, file: 'prod-deck.pdf', trim: 37.5, gap: 2

end