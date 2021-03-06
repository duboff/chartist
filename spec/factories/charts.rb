# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pie_chart, class: 'Chart' do
    name "Pie chart"
    chart_type 0
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end
  factory :line_chart, class: 'Chart' do
    name "Line chart"
    chart_type 1
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test4.csv'), 'text/csv' }
  end
  factory :col_chart, class: 'Chart' do
    name "jobs for undergrads"
    chart_type 2
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end
  factory :bar_chart, class: 'Chart' do
    name "Mortality rates in Australia"
    chart_type 3
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end

  factory :chart_with_dashboards, class: 'Chart' do
    name "US chart"
    chart_type 1
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test3.csv'), 'text/csv' }
    dashboard_titles "miami texas"
  end

  factory :mult_chart, class: 'Chart' do
    name "Multiple Series Chart"
    chart_type 1
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test5.csv'), 'text/csv' }
  end
end
