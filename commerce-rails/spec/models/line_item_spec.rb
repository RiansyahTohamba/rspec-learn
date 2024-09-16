require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:item_sholat) { create(:item, :sholat)}
  let(:item_pressman) { create(:item, :pressman)}
  let(:single_item_line) { create(:line_item, :line_sholat) }
  let(:three_items_line) { create(:line_item, :line_pressman) }
  
  it "creates a line item with quantity 1" do
    expect(single_item_line.quantity).to eq(1)
  end
  
  it "creates a line item with quantity 3" do
    expect(three_items_line.quantity).to eq(3)
  end

  
end

