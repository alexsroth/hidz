require 'squib'

data = Squib.csv file: 'card-data.csv'
out = './deck-0.1'

Squib::Deck.new cards: data['name'].size, layout: 'hidz.yml' do
  background color: 'white'
  rect layout: 'cut', fill_color: '#230602' # cut line as defined by TheGameCrafter
  rect layout: 'safe', fill_color: 'white' # safe zone as defined by TheGameCrafter
  rect layout: 'art-back', fill_color: 'black'
  text str: data['name'], layout: 'name', color: 'white'
  rect layout: 'art', fill_color: 'white'
  text str: data['card-type'], layout: 'card-type', color: 'white'
  rect layout: 'desc-back', fill_color: '#C5C5C5', stroke_width: 0 
  # text str: data['name'], layout: 'title'
  text str: data['desc'], layout: 'desc-text'
  # ext str: Time.now, layout: 'credits'

  save_png dir: out # prefix: '01_hello_rb'
  save_pdf trim: 37.5, dir: out, file: 'deck.pdf'

end