require 'spec_helper'
require 'rails_helper'

describe Cereal do
  it { should have_valid(:name).when("Rick") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:description).when("Rick and Morty are based on Back to the Future") }
  it { should_not have_valid(:name).when(nil, "") }
end
