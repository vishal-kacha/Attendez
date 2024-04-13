class PagesController < ApplicationController
 
  def home
    if current_student
      student = Student.find(current_student.id)
      attendances = student.attendances

      total_attendance_by_subject = attendances.group(:subject_name).count

      present_attendance_by_subject = attendances.where(status: true).group(:subject_name).count

      @attendance_summary = {}

      total_attendance_by_subject.each do |subject_name, total_count|
        present_count = present_attendance_by_subject[subject_name].to_i
        @attendance_summary[subject_name] = { present: present_count, total: total_count }
      end
    end
  end

  def attendance_by_subject
    if current_student
      student = Student.find(current_student.id)
      subject_name = params[:subject_name]

      # Fetch all attendance records for the current student and selected subject
      @attendances = student.attendances.where(subject_name: subject_name)
    end
  end
end
