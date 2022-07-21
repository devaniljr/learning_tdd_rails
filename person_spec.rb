require 'rspec/autorun'

class Person
  attr_accessor :first_name, :middle_name, :last_name

  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{"#{@middle_name} " if @middle_name}#{@last_name}"
  end

  def full_name_with_middle_initial
    "#{@first_name} #{"#{@middle_name.chr}. " if @middle_name}#{@last_name}"
  end

  def initials
    "#{@first_name.chr}. #{"#{@middle_name.chr}. " if @middle_name}#{@last_name.chr}."
  end
end

RSpec.describe Person do
  subject do
    Person.new(
      first_name: 'Devanil',
      middle_name: 'Júnior',
      last_name: 'Malta'
    )
  end

  describe '#full_name' do
    it 'concatenates first name, middle name, and last name with spaces' do
      expect(subject.full_name).to eq('Devanil Júnior Malta')
    end
    it 'does not add extra spaces if middle name is missing' do
      subject.middle_name = nil
      expect(subject.full_name).to eq('Devanil Malta')
    end
  end

  describe '#full_name_with_middle_initial' do
    it 'concatenates first name, middle name with initial, and last name with spaces' do
      expect(subject.full_name_with_middle_initial).to eq('Devanil J. Malta')
    end

    it 'does not add middle name initial if is missing' do
      subject.middle_name = nil
      expect(subject.full_name_with_middle_initial).to eq('Devanil Malta')
    end
  end

  describe '#initials' do
    it 'concatenates first name, middle name, and last name only with initials' do
      expect(subject.initials).to eq('D. J. M.')
    end

    it 'does not add middle name initial if is missing' do
      subject.middle_name = nil
      expect(subject.initials).to eq('D. M.')
    end

  end
end
