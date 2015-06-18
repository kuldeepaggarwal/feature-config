require 'spec_helper'

RSpec.describe Feature::Properties do
  subject { Feature::Properties }
  let(:enabled_feature) { 'first_feature' }

  context '.initialize' do
    after { subject.new(FeatureConfig::Setup.properties[enabled_feature]) }
    it { expect_any_instance_of(subject).to receive(:bind_properties!) }
  end

  context 'create a methods for each properties keys' do
    subject do
      Feature::Properties.new(FeatureConfig::Setup.properties[enabled_feature])
    end
    it do
      expect(subject.instance_variable_get(:@properties)
        .keys.all? { |method| subject.respond_to?(method) }).to be_truthy
    end
  end
end
