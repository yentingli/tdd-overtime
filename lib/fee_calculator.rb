class Fee_calculator
  attr_reader :overtime_fee

  def initialize(employee)
    @worktime = employee.worktime
    fee_per_hour = employee.fee_per_hour

    # 平日加班
    if @worktime[:norm_day] and @worktime[:norm_day] >= 8 and       @worktime[:norm_day] <= 12
      overtime = @worktime[:norm_day] - 8
      if overtime <= 2
        @overtime_fee = ((overtime * 1.34 ) * fee_per_hour).round()
      else
        @overtime_fee = ((2 * 1.34 + (overtime - 2) * 1.67) * fee_per_hour).round()
      end

    # 休息日  
    elsif @worktime[:rest_day] and @worktime[:rest_day] <= 12
      overtime = @worktime[:rest_day]
      if overtime <= 2
        @overtime_fee = (overtime * 1.34 * fee_per_hour).round()
      elsif overtime > 2 and overtime <= 8
        @overtime_fee = (((2 * 1.34) + (overtime - 2) * 1.67 )* fee_per_hour).round()
      else
        @overtime_fee = (((2 * 1.34) + 6 * 1.67 + (overtime - 8) * 2.67)* fee_per_hour).round()
      end

    # 休假日  
    elsif @worktime[:leave_day] and @worktime[:leave_day] <= 12
      overtime = @worktime[:leave_day]
      if overtime <= 8
        @overtime_fee = (8 * fee_per_hour).round()
      elsif overtime > 8 and overtime <= 10
        @overtime_fee = ((8 + (overtime - 8) * 2.34 )* fee_per_hour).round()
      else
        @overtime_fee = ((8 + 2 * 2.34 + (overtime - 10) * 2.67)* fee_per_hour).round()
      end

    # 國定假日  
    elsif @worktime[:holiday] and @worktime[:holiday] <= 12
      overtime = @worktime[:holiday]
      if overtime <= 8
        @overtime_fee = (overtime * fee_per_hour * 2).round()
      elsif overtime > 8 and overtime <= 10
        @overtime_fee = ((8 * 2 + (overtime - 8) * 2.34 )* fee_per_hour).round()
      else
        @overtime_fee = ((8 * 2 + 2 * 2.34 + (overtime - 10) * 2.67)* fee_per_hour).round()
      end
    
    #無加班
    else
      @overtime_fee = 0
    end
    
  end

end
