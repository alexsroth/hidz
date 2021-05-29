require 'squib'

data = Squib.csv file: 'card-data.csv'

Squib::Deck.new cards: data['name'].size, layout: 'fantasy.yml' do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['name'], layout: 'title'
  text str: data['desc'], layout: 'description'
  text str: Time.now, layout: 'credits'

  save_png dir: './tutorial' # prefix: '01_hello_rb'
  save_pdf trim: 37.5, dir: './tutorial', file: 'deck.pdf'

end