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

  Charge.find(params[:id]).to_json

end

post '/api/charges' do

  Charge.create({
    :accountid => params[:accountid],
    :name => params[:name],
    :vendor => params[:vendor],
    :transdate => params[:transdate],
    :amount => params[:amount],
    }).to_json

end

patch '/api/charges/:id' do
  charge_args = {
    :accountid => params[:accountid],
    :name => params[:name],
    :vendor => params[:vendor],
    :transdate => params[:transdate],
    :amount => params[:amount]
    }

    @charge = Charge.find(params[:id])
    @charge.update(charge_args)
    @charge.to_json
end

delete '/api/charges/:id' do
  Charge.destroy(params[:id]).to_json
end
