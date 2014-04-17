require "spec_helper"

describe IssueNotifier do
  describe "resolved" do
    let(:issue) { FactoryGirl.build(:issue) }
    let(:mail) { IssueNotifier.resolved(issue) }

    it "renders the headers" do
      expect(mail.subject).to eq("Issue Ticket Resolved")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Issue")
    end
  end

end
