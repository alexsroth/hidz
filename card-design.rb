require 'squib'

data = Squib.csv file: 'card-data.csv'
out = './deck-0.1'


Squib::Deck.new cards: data['name'].size, layout: 'hidz.yml' do
  background color: 'white'
  rect layout: 'cut' 
  rect layout: data['category']
  rect layout: 'art-back', fill_color: 'black'
  text str: data['name'], layout: 'name', color: 'white'
  rect layout: 'art', fill_color: 'white'
  text str: data['card-type'], layout: 'card-type', color: 'white'
  rect layout: 'desc-back', fill_color: '#C5C5C5', stroke_width: 0 
  text str: data['desc'], layout: 'desc-text'
  svg layout: data['point-back']
  svg file: 'place.svg', x: 650, y: 971, width: 65, height: 65
  text str: data['points'], layout: 'e-num', color: 'white'
  
  save_png dir: out # prefix: '01_hello_rb'
  save_pdf dir: out, file: 'deck.pdf', trim: 37.5, gap: 2

end