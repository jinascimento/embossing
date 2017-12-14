require 'spec_helper'

RSpec.describe 'Embossing::Name' do

  before(:each) do
    @embossing_name = Embossing::EmbossingName
  end

  it 'has a version number' do
    expect(Embossing::VERSION).not_to be nil
  end

  it '#normalize_name_to_embossing' do
    normalize_name = @embossing_name.normalize_name_to_embossing('Wickaninnish Muscowequan Aputsiaq Goyathlay')
    expect(normalize_name).to eql('WICKANINNISH M A GOY')

  end

  it '#reduct_name' do
    reduct_name = @embossing_name.reduct_name('Nanook Quidel Kaneonuskatew Qillaq')
    expect(reduct_name.size).to be < 21
  end

  it '#remove_abbreviate' do
    name = @embossing_name.remove_abbreviate('Jhonatan I. do Nascimento')
    name_without_abbreviate = name.split

    expect(name_without_abbreviate).to satisfy('does not have abbreviated name') do |x|
      x != %w[da do das dos]
    end
  end

  it '#remove_accents' do
    name = @embossing_name.remove_accents('Nanóók Quídél Kaneonuskatew Qillaq')

    expect(name.match(/[ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöùúûüýþÿ]/)).
      to be_nil
  end
end
