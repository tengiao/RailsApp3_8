require 'rails_helper'

# describe User do
#   let(:user) { User.create!(email: "tengiao@gmail.com") }
# end

describe Product do
  let(:product) { Product.create!(name: "race bike") }
  let(:user) { User.create!(email: "tengiao@gmail.com", password: "yadayada") }

  before do
    product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq(3.0)
  end

  it "is not valid without a name" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end
end