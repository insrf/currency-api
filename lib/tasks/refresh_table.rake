namespace :refresh_table do
  task currency: :environment do
    URL = "http://www.cbr.ru/scripts/XML_daily.asp".freeze
    doc = Nokogiri::XML(open(URL))

    doc.css('Valute').each do |node|
      children = node.children
      name = children.css('Name').inner_text
      rate = children.css('Value').inner_text

      curency = Curency.find_by(name: name)
      curency ? curency.update(rate: rate ) : Curency.create(name: name, rate: rate)
    end
  end
end
