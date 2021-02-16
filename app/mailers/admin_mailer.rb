class AdminMailer < ApplicationMailer
    default from: 'fredseguier@gmail.com'
 
    def attendance_notif_email(attendance)
        @event = attendance.event
        @admin = @event.admin

        mail(to: @admin.email, subject: "Il y a un nouveau participant à votre évènement #{@event.title}")
    end
  
end
