require 'spec_helper'

describe EventsHelper do
  let(:event) { create(:event) }
  let(:participant) { create(:participant, user: event.user) }
  let(:participation_event) { create(:event, participants: [participant]) }

  context "signed_out user" do
    before(:each) do
      helper.stub(signed_in?: false, current_user: nil)
    end

    context "#participation_link" do
      it "should have a login message attached" do
        helper.participation_link(event).should match("Bitte logge dich zuerst ein")
      end
    end
  end

  context "signed_in user" do
    before(:each) do
      helper.stub(signed_in?: true, current_user: event.user)
    end

    context "#participation_link" do
      it "should render a paritcipate button" do
        helper.participation_link(event).should match("Teilnehmen")
      end

      it "should render a cancel button" do
        helper.participation_link(participation_event).should match("Absagen")
      end
    end
  end
end
