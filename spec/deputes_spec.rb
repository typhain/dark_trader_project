require_relative '../lib/deputes'

describe "get_url method" do
  it "should return an array with 576 urls" do
    expect(get_url.size).to eq(576)
  end
end

describe "get_emails method" do
  it "should return an array with emails containing @" do
    expect(get_emails[3]).to include("@")
  end
end

describe "get_first_names method" do
  it "should return an array with 576 first names" do
    expect(get_first_names.size).to eq(576)
  end
end

describe "get_last_names method" do
  it "should return an array with 576 last names" do
    expect(get_last_names.size).to eq(576)
  end

  it "should return one last name : Le Pen" do
    expect(get_last_names).to include("Le Pen")
  end
end
