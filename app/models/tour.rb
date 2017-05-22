class Tour < ActiveRecord::Base
  belongs_to :route
  accepts_nested_attributes_for :route
  
  validates :start_date, presence: true
  validates :days_in_tour, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :route, presence: true
  validates :add_price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :add_descr, presence: true
  
  def value_for(str1, str2)
    if !(params[str1].nil?)
      if !(params[str1][str2].nil?)
        return params[str1][str2]
      end
    end
    return nil
  end
  
  def self.search(params)
    result = [[],[]]
    result[1] = Tour.eager_load(:route, route: :city)
    if !(params["search"].nil?)
      params["search"].each do |p|
        if !(p[1].empty?)
          arr = p[0].delete("01").split(".").map{|x| x.to_s}
          str = ": "
          str = " >= "if p[0].include?("0")
          str = " <= "if p[0].include?("1")
          result[0] << ["activerecord.models.#{arr[0]}", "activerecord.attributes.#{p[0].delete("01")}", str, p[1]]
        end
      end
    
      if !(params['search']['tour.start_date0'].nil?) and !(params['search']['tour.start_date0'].empty?)
        arr = params['search']['tour.start_date0'].split('.').map{|n| n.to_s}
        result[1] = result[1].where("start_date >= '#{arr[2]}-#{arr[1]}-#{arr[0]}'")
      end
    
      if !(params['search']['tour.start_date1'].nil?) and !(params['search']['tour.start_date1'].empty?)
        arr = params['search']['tour.start_date1'].split('.').map{|n| n.to_s}
        result[1] = result[1].where("start_date <= '#{arr[2]}-#{arr[1]}-#{arr[0]}'")
      end
    
      if !(params['search']['tour.days_in_tour0'].nil?) and !(params['search']['tour.days_in_tour0'].empty?)
        arr = params['search']['tour.days_in_tour0'].split('.').map{|n| n.to_s}
        result[1] = result[1].where("days_in_tour >= '#{arr[2]}-#{arr[1]}-#{arr[0]}'")
      end
    
      if !(params['search']['tour.days_in_tour1'].nil?) and !(params['search']['tour.days_in_tour1'].empty?)
        arr = params['search']['tour.days_in_tour1'].split('.').map{|n| n.to_s}
        result[1] = result[1].where("days_in_tour <= '#{arr[2]}-#{arr[1]}-#{arr[0]}'")
      end
    
      if !(params['search']['tour.add_price0'].nil?) and !(params['search']['tour.add_price0'].empty?)
        result[1] = result[1].where("add_price >= #{params['search']['tour.add_price0']}")
      end
    
      if !(params['search']['tour.add_price1'].nil?) and !(params['search']['tour.add_price1'].empty?)
        result[1] = result[1].where("add_price <= #{params['search']['tour.add_price1']}")
      end
    
      if !(params['search']['tour.add_descr'].nil?) and !(params['search']['tour.add_descr'].empty?)
        result[1] = result[1].where("add_descr ilike '%#{params['search']['tour.add_descr']}%'")
      end
    
      if !(params['search']['route.name'].nil?) and !(params['search']['route.name'].empty?)
        result[1] = result[1].where("routes.name = '#{params['search']['route.name']}'")
      end
    
      if !(params['search']['route.descr'].nil?) and !(params['search']['route.descr'].empty?)
        result[1] = result[1].where("routes.descr ilike '%#{params['search']['route.descr']}%'")
      end
    
      if !(params['search']['route.base_price0'].nil?) and !(params['search']['route.base_price0'].empty?)
        result[1] = result[1].where("routes.base_price >= #{params['search']['route.base_price0']}")
      end
    
      if !(params['search']['route.base_price1'].nil?) and !(params['search']['route.base_price1'].empty?)
        result[1] = result[1].where("routes.base_price <= #{params['search']['route.base_price1']}")
      end
    
      if !(params['search']['city.name'].nil?) and !(params['search']['city.name'].empty?)
		q = City.where("name = '#{params['search']['city.name']}'").ids
        result[1] = result[1].where("routes.city_id in (#{q.join(',')})")
      end
    end
    return result
  end
end
