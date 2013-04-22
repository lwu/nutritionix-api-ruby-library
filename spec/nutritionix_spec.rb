require 'spec_helper'

describe 'Nutritionix API' do
  let(:agent){ Nutritionix::API.new(APP_ID,APP_KEY)}
  subject(:search_params){{:results => "0:10",
                    :cal_min => nil,
                    :cal_max => nil,
                    :fields => nil,
                    :brand_id => nil}}
  it 'should return serialized parameters from hash' do
    serialized = agent.get_serialized_params(search_params)
    serialized.should == "results=0%3A10&appId=#{agent.app_id}&appKey=#{agent.app_key}"
  end

  it 'should search for a food nutrition' do
    results = JSON.parse(agent.search('tacos', 0, 5, 0, 0, '*'))
    results.should_not be_nil
  end

  it 'should return an item object that contains data on all its nutritional content' do
    pending
  end

  it 'should return a brand object that contains data on all its nutritional content' do
    pending
  end
end