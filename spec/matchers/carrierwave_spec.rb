require 'carrierwave/test/matchers'

describe PictureUploader do
  include CarrierWave::Test::Matchers

  before do
    PictureUploader.enable_processing = true
    @uploader = PictureUploader.new(@user, :avatar)
    @uploader.store!(File.open("#{Rails.root}/spec/support/text-file-icon.png"))
  end

  after do
    PictureUploader.enable_processing = false
    @uploader.remove!
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end

describe AttachmentUploader do
  include CarrierWave::Test::Matchers

  before do
    AttachmentUploader.enable_processing = true
    @uploader = AttachmentUploader.new(@user, :avatar)
    @uploader.store!(File.open("#{Rails.root}/spec/support/text-file-icon.png"))
  end

  after do
    AttachmentUploader.enable_processing = false
    @uploader.remove!
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end