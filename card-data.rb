require 'bundler'
require 'csv'

Bundler.require

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

pcsv = session.spreadsheet_by_key("1SNE90vRWNPtHUluWW4ORvCbJrZRazUNs1M4lboqxqJg").worksheets[0].rows

CSV.open("card-data.csv", "w") do |csv|
  pcsv.each do |info|
    csv << info.map do |col|
      col.respond_to?(:empty?) && col.empty? ? nil : col
    end
  end
end