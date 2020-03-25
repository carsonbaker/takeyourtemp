require 'rails_helper'

describe Contacting, type: :mode do
  it { should respond_to :message }
  it { should respond_to :from }
end
