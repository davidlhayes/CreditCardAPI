class Charge < ActiveRecord::Base

  def to_s
    "Credit account #{self.id}  used at #{self.id}  was charged ${self.id}"
  end
end

get '/' do
  @charge = Charge.new
  @charge.accountid = '99922'
  @charge.name = 'Joe Martin'
  @charge.vendor = 'Walmart'
  @charge.transdate = '2015-7-15'
  @charge.amount = 12.14
  @charge.save
  Charge.all.to_json
end

get '/api/charges' do

  Charge.all.to_json

end

get '/api/charges/:id' do

  Charge.find(params[:id].to_json)

end

post '/api/charges' do
  
end
