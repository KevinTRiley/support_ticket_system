class IssueNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.issue_notifier.resolved.subject
  #
  def resolved(issue)
    @issue = issue

    mail to: issue.email, subject: "Issue Ticket Resolved"
  end
end
