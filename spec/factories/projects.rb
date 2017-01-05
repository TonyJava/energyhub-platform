FactoryGirl.define do
  factory :project do
    name "Roof Solar Project"
    project_status "active"
    intake_path "web"
    project_type "solar"
    estimated_annual_production 1.5
    estimated_annual_savings 1.5
    total_project_cost 100001.00
    fee_invoice_sent "2016-12-29"
    fee_received "2016-12-29"
    notes ""
  end
end
