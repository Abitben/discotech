# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ulrichvoitier@yahoo.fr'
  layout 'mailer'
end
