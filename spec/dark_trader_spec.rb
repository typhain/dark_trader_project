require_relative '../lib/trader'

describe "get_symbols method" do
  it "should return an array with more than 2000 elements" do
    expect(get_symbols.size).to eq(2276)
  end

  it "should return an array that includes BTC, ETH and GRAT" do
    expect(get_symbols).to include("BTC")
    expect(get_symbols).to include("ETH")
    expect(get_symbols).to include("GRAT")
  end

end

describe "get_prices method" do
  it "should return an array with more than 2000 elements" do
    expect(get_prices.size).to eq(2276)
  end
end


describe "combine method" do
  it "should return a hash and NOT nil" do
    expect(combination.split_into(2276)).not_to be_nil
  end
end
