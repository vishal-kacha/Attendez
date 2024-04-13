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
end
