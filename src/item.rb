class Item
  attr_accessor :publish_date

  def initialize(publish_date, archived)
    @id = Time.now.to_f.to_s.gsub('.', '')
    @publish_date = publish_date
    @archived = archived
  end
end
