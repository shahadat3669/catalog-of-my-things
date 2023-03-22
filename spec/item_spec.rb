require_relative '../src/item'

describe Item do
  it 'creates a new item with the given publish date and archived status' do
    publish_date = Time.now
    archived = false
    item = Item.new(publish_date, archived)
    expect(item.publish_date).to eq(publish_date)
    expect(item.instance_variable_get(:@archived)).to eq(archived)
  end

  it 'sets a unique id for each new item' do
    item1 = Item.new(Time.now, false)
    item2 = Item.new(Time.now, false)

    expect(item1.instance_variable_get(:@id)).not_to eq(item2.instance_variable_get(:@id))
  end

  it 'sets the publish date of the item' do
    item = Item.new(Time.now, false)
    new_publish_date = Time.now - 3600

    item.publish_date = new_publish_date

    expect(item.publish_date).to eq(new_publish_date)
  end

  it 'returns the publish date of the item' do
    publish_date = Time.now
    item = Item.new(publish_date, false)

    expect(item.publish_date).to eq(publish_date)
  end
end
