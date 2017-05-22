module ToursHelper

  def value_for(str1, str2)
    if !(params[str1].nil?)
      if !(params[str1][str2].nil?)
        return params[str1][str2]
      end
    end
    return nil
  end

end
