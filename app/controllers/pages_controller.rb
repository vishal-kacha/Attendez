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
    elsif current_teacher
      @attendance_details = current_teacher.subject.attendances.group(:created_date, :created_time)
    end
  end

  def attendance_by_subject
    if current_student
      student = Student.find(current_student.id)
      subject_name = params[:subject_name]
      if student.subjects.exists?(subject_name: subject_name)
        @attendances = student.attendances.where(subject_name: subject_name)
      else
        redirect_to root_path, alert: 'Not available.' and return
      end
    elsif current_teacher
      redirect_to root_path, alert: 'Not available.' and return
    elsif current_admin
      redirect_to root_path, alert: 'Not available.' and return
    end
  end
end
