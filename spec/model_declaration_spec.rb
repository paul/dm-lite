require File.dirname(__FILE__) + '/spec_helper.rb'

describe 'declaring models' do

  it 'should work' do
    class Person
      include DMLite::Model

      property :id, Integer
      property :name, String
    end

  end
end
