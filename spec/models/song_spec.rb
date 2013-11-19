require 'spec_helper'

describe Song do
  subject {   Song.create(name: 'Golden Age', description: "The artist is Beck", url: 'http://www.youtube.com/watch?v=Y6zAT15vaFk') }

  its(:name) {should == "Golden Age" }
end
