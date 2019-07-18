require_relative '../lib/mairie'

describe "get_url method" do
  it "should return an array with 185 urls" do
    expect(get_url.size).to eq(185)
  end

  it "should return an array with urls containing /95/" do
    expect(get_url).to include("/95/")
  end

end

describe "get_emails method" do
  it "should return an array with elements containing @" do
    expect(get_emails).to include("@")
  end
end

describe "get_city method" do
  it "should return an array 185 city names" do
    expect(get_url.size).to eq(185)
    expect(get_url).to include("Montmorency")
  end


describe "combine method" do
  it "should return a hash and NOT nil" do
    expect(combine).not_to be_nil
  end
end
