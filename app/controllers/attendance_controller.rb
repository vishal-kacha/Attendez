class AttendanceController < ApplicationController
  before_action :authenticate_teacher!

  def new
    return unless current_teacher

    @student = Student.where(branch_id: current_teacher.branch_id).pluck(:id)
  end

  def post
    return unless current_teacher

    @student = Student.where(branch_id: current_teacher.branch_id).pluck(:id)

    date = params[:date]
    time = params[:time]
    @student.each do |id|
      student_status = params[id.to_s] # Access status parameter for each student

      # Determine status based on student_status value
      status = (student_status == '1')

      # Create attendance record
      Attendance.create(
        subject_id: current_teacher.subject_id,
        subject_name: current_teacher.subject.subject_name,
        student_id: id,
        status: status,
        created_date: date,
        created_time: time,
        updated_date: date,
        updated_time: time
      )
    end
    redirect_to root_path, notice: 'Added attendance successfully.' and return
  end

  def edit
    return unless current_teacher

    date = params[:date]
    time = params[:time]

    @attendances = current_teacher.subject.attendances.where(created_date: date, created_time: time).select(
      :student_id, :status
    )

    redirect_to root_path, alert: 'No records available.' and return unless @attendances.present?
  end

  def edit_post
    attendance_date = params[:attendance_date]
    attendance_time = params[:attendance_time]

    @date = params[:date]
    @time = params[:time]

    @attendances = current_teacher.subject.attendances.where(created_date: @date, created_time: @time)

    @attendances.each do |attendance|
      student_status = params[attendance.student_id.to_s]

      status = (student_status == '1')

      attendance.update(
        status: status,
        updated_date: attendance_date,
        updated_time: attendance_time
      )
    end
    redirect_to root_path, notice: 'Edited attendance successfully.' and return
  end
end
