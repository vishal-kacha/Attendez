class AttendanceController < ApplicationController
  before_action :authenticate_teacher!

  def new
    if current_teacher
      @student = Student.where(branch_id: current_teacher.branch_id).pluck(:id)
    end
  end

  def post
    if current_teacher
      @student = Student.where(branch_id: current_teacher.branch_id).pluck(:id)
      
      @student.each do |id|
        student_status = params[:"#{id}"]
        if student_status == '1'
          Attendance.create(subject_id: current_teacher.subject_id, subject_name: current_teacher.subject.subject_name, student_id: id, status: true)
        else
          Attendance.create(subject_id: current_teacher.subject_id, subject_name: current_teacher.subject.subject_name, student_id: id, status: false)
        end
        redirect_to root_path, notice: "Added attendance successfully." and return 
      end
    end
  end
end
