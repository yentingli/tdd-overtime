# 時薪
# {工作日:工時}
## 平日、休息日、休假日、假日
require 'employee'
require 'timecop'

RSpec.describe Employee do
  let(:employee) {Employee.new(1000)}

  context "時薪" do
    it "時薪 1000 元" do
      expect(employee.fee_per_hour).to be 1000
    end
  end

  context "工時" do
    it "平日" do
      Timecop.freeze(Time.local(2021,4,9,10,00,0)) do
        employee.onbord
        Timecop.travel 9.3*60*60 do #  9.3hrs
          employee.leave
          expect(employee.worktime).to eq({:norm_day => 9.3})  # in hrs
        end
      end
    end

    it "休息日" do
      Timecop.freeze(Time.local(2021,4,10,10,00,0)) do
        employee.onbord
        Timecop.travel 2.3*60*60 do #  2.3hrs
          employee.leave
          expect(employee.worktime).to eq({:rest_day => 2.3})  # in hrs
        end
      end
    end

    it "休假日" do
      Timecop.freeze(Time.local(2021,4,11,10,00,0)) do
        employee.onbord
        Timecop.travel 5.3*60*60 do #  5.3hrs
          employee.leave
          expect(employee.worktime).to eq({:leave_day => 5.3})  # in hrs
        end
      end
    end

    it "假日" do
      Timecop.freeze(Time.local(2021,01,01,10,00,0)) do
        employee.onbord
        Timecop.travel 6.3*60*60 do #  6.3hrs * 60mins * 60sec 
          employee.leave
          expect(employee.worktime).to eq({:holiday => 6.3})  # in hrs
        end
      end
    end
    
  end
end