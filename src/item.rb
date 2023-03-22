class Item
  attr_accessor :publish_date

  def initialize(publish_date, archived)
    @id = Time.now.to_f.to_s.gsub('.', '')
    @publish_date = publish_date
    @archived = archived
  end

  def years_since(date)
    today = Time.now
    total = today.year - date.year
    total -= 1 if
         date.month > today.month or
         (date.month >= today.month and date.day > today.day)
    total
  end

  def can_be_archived?
    years_since(@publish_date) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
