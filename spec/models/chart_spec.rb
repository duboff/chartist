require 'spec_helper'
require 'chronic'

describe Chart do

  let!(:user) {create(:user)}
  let(:chart) {create(:pie_chart, user: user)}
  let(:line_chart) {create(:line_chart, user: user)}

  it "creates datapoints in the database correctly" do
    expect(chart.datapoints.count).to eq(2)
    expect(chart.datapoints.last.x).to eq 'GB'
    expect(chart.datapoints.last.y).to eq 25
  end

  it "formats dates correctly" do
    date = Chronic.parse(line_chart.datapoints.last.x)
    expect(date).not_to be_false
  end

  context 'Validations' do

    let(:wrong_chart1) { build(:line_chart, user: user, name: nil, description: 'bla')}

    it "content type" do
      should validate_attachment_content_type(:csv).
        allowing("text/csv").
        rejecting('text/plain', 'text/xml', 'image/jpg')
    end

    it "size" do
      should validate_attachment_size(:csv).
        less_than(2.megabytes)
    end


    it "can't be created without a title" do
      expect(wrong_chart1).to have(1).errors_on(:name)
    end

  end
  context 'Enumeration' do

    let(:line_chart) {create(:line_chart, user: user)}
    let(:pie_chart) {create(:pie_chart, user: user)}

    it 'knows the type of the chart' do
      expect(line_chart.line_chart?).to be_true
      expect(pie_chart.pie_chart?).to be_true
      expect(line_chart.pie_chart?).not_to be_true
    end
  end

  context 'multi-series chart' do

    let(:mult_chart) {create(:mult_chart, user: user)}

    it 'creates datapoints with correct series id' do
      expect(mult_chart.series.count).to eq 2
      expect(mult_chart.datapoints.count).to eq 8
      expect(mult_chart.series.first.datapoints.first.y).to eq 5
      expect(mult_chart.series.last.datapoints.last.y).to eq 140
    end

    it 'assigns correct names to series' do
      expect(mult_chart.series.first.name).to eq 'Product B'
    end
  end

  context 'different colorts' do

    let(:color_chart) {create(:pie_chart, colorscheme: 0, user: user )}
    let(:hockey_chart) {create(:pie_chart, colorscheme: 1, user: user )}

    it 'color is correctly processed' do
      expect(color_chart.spring?).to be_true
      expect(hockey_chart.summer?).to be_true
      expect(hockey_chart.spring?).to be_false
    end

    let(:color_chart2) {create(:pie_chart, user: user)}

    it 'if colorscheme not selected default is applied' do
      expect(color_chart2.spring?).to be_true
    end
  end
end
