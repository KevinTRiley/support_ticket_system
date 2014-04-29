class IssueNotifier < ActionMailer::Base
  default to: Proc.new { Recipient.pluck(:email) }
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.issue_notifier.resolved.subject
  #
  def new_issue(issue)
    @issue = issue

    mail subject: "New Issue Ticket"
  end
  def resolved(issue)
    @issue = issue

    mail to: issue.email, subject: "Issue Ticket Resolved"
  end
end
