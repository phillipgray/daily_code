require 'title_case'

describe 'String#title_case' do
  
  it "capitalizes the first word of a single word" do
    expect("beowulf".title_case()).to eq('Beowulf')
  end

  it "capitalizes the first letter of a multiple-word string" do
    expect('the color purple'.title_case()).to eq("The Color Purple")
  end

  it "doesn't capitalize certain designated words" do
    expect('silence of the lambs'.title_case).to eq("Silence of the Lambs")
  end

  it "capitalizes designated words if they are the first word" do
    expect('the order of the phoenix'.title_case).to eq("The Order of the Phoenix")
  end

  it "handles non-letter characters" do
    expect('the grapes!'.title_case).to eq('The Grapes!')
  end

  it "manages all uppercase entries" do
    expect('I LOVE LUCY THE MOVIE'.title_case).to eq('I Love Lucy the Movie')
  end

  it "manages mixed case entries" do
    expect('THE philosopher\'s STONE'.title_case).to eq('The Philosopher\'s Stone')
  end

  it "manages unique case entries" do
    expect('ThE CaTCher iN The RYe'.title_case).to eq('The Catcher in the Rye')
  end
end