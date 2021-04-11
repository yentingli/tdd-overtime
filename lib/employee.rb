class Employee
  attr_accessor :fee_per_hour

  def initialize(fee_per_hour)
    @fee_per_hour = fee_per_hour
  end
  
  def onbord
    @onbord_time = Time.now
  end

  def leave
    @leave_time = Time.now
  end 

  def worktime
    worktime = (@leave_time - @onbord_time)/ (60 *60) #to hrs
    worktime = worktime.round(2)
    if @leave_time.wday == @onbord_time.wday 
      if public_holiday?(@leave_time)
        {:holiday => worktime }
      elsif @leave_time.wday == 6 #Saturday
        {:rest_day => worktime} 
      elsif @leave_time.wday == 0 #Sunday
        {:leave_day => worktime} 
      else
        {:norm_day => worktime} 
      end
    end
  end

  private
    def public_holiday?(time)
      public_holiday = [
        '20210101', '20210228', '20210301', 
        '20210402', '20210404', '20210405',
      ]
      public_holiday.include?(time.strftime('%Y%m%d'))
    end

end
