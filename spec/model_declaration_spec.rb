require File.dirname(__FILE__) + '/spec_helper.rb'

describe 'declaring models' do

  before do
    class Person
      include DMLite::Model

      property :id, Integer
      property :name, String
    end
  end

  it 'should set attributes' do
    p = Person.new(:name => 'Paul')
    p.name.should == "Paul"
  end

end
