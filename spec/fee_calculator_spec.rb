require 'employee'
require 'fee_calculator'
require 'timecop'

RSpec.describe Fee_calculator do

  context "平日" do
    it "無加班" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,9,10,00,0)) do
        employee.onbord
        Timecop.travel 7.9*60*60 do #  7.9 hrs * 60mins * 60sec 
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 0  
        end
      end
    end
    
    it "加班 1.6 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,9,10,00,0)) do
        employee.onbord
        Timecop.travel 9.6*60*60 do #  9.6 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 2144  
        end
      end
    end
    
    it "加班 3.8 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,9,10,00,0)) do
        employee.onbord
        Timecop.travel 11.8*60*60 do #  11.8 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 5686  
        end
      end
    end

  end 
    
  context "休息日" do
    it "加班 1.5 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,10,10,00,0)) do
        employee.onbord
        Timecop.travel 1.5*60*60 do #  1.5 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 2010  
        end
      end
    end

    it "加班 7.8 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,10,10,00,0)) do
        employee.onbord
        Timecop.travel 7.8*60*60 do #  7.8 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 12366  
        end
      end
    end

    it "加班 11.8 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,10,10,00,0)) do
        employee.onbord
        Timecop.travel 11.8*60*60 do # 11.8 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 22846  
        end
      end
    end

  end

  context "休假日" do
    it "加班 1.2 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,11,10,00,0)) do
        employee.onbord
        Timecop.travel 1.2*60*60 do # 11.8 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 8000  
        end
      end
    end

    it "加班 9.5 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,11,10,00,0)) do
        employee.onbord
        Timecop.travel 9.5*60*60 do # 9.5 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 11510  
        end
      end
    end

    it "加班 12 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,11,10,00,0)) do
        employee.onbord
        Timecop.travel 12*60*60 do # 12 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 18020  
        end
      end
    end

  end

  context "國定假日" do
    it "加班 1.2 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,02,10,00,0)) do
        employee.onbord
        Timecop.travel 1.2*60*60 do # 11.8 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 2400  
        end
      end
    end

    it "加班 9.5 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,02,10,00,0)) do
        employee.onbord
        Timecop.travel 9.5*60*60 do # 9.5 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 19510  
        end
      end
    end

    it "加班 12 hrs" do
      employee = Employee.new(1000)
      Timecop.freeze(Time.local(2021,4,02,10,00,0)) do
        employee.onbord
        Timecop.travel 12*60*60 do # 12 hrs
          employee.leave
          fee_calculator = Fee_calculator.new(employee)
          expect(fee_calculator.overtime_fee).to eq 26020  
        end
      end
    end

  end
  
end
