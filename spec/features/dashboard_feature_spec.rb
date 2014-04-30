require 'spec_helper'

describe "Dashboards" do

	let(:user) { create(:user, email: "foo@bar.com") }
	
	before do
		login_as user
	end

	context "when creating a chart" do
		
		it "can add to a dashboard" do 
			visit "/charts/new"
			expect(page).to have_content "Dashboard"
		end

		it "adds dashboards to that chart" do
			visit "/charts/new"
			add_pie_chart('Pie chart', 'uk london')
			expect(Chart.last.dashboards.count).to eq 2
		end
	end

	context "Looking for dashboards" do

		before do
			create(:chart_with_dashboards, user: user)
			create(:chart_with_dashboards, user: user, dashboard_titles: "foobar")
		end

		it "shows the boards that it has" do
			visit "/charts"
			expect(page).to have_link('miami')
		end
	end
end
