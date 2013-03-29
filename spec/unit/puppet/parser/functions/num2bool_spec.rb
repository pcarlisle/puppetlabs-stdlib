#! /usr/bin/env ruby -S rspec
require 'spec_helper'

describe "the num2bool function" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it "should exist" do
    Puppet::Parser::Functions.function("num2bool").should == "function_num2bool"
  end

  it "should raise a ParseError if there are no arguments" do
    lambda { scope.function_num2bool([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if there are more than 1 arguments" do
    lambda { scope.function_num2bool(["foo","bar"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if passed something non-numeric" do
    lambda { scope.function_num2bool(["xyzzy"]) }.should( raise_error(Puppet::ParseError))
  end

  it "should return true if passed string 1" do
    result = scope.function_num2bool(["1"])
    result.should(be_true)
  end

  it "should return true if passed number 1" do
    result = scope.function_num2bool([1])
    result.should(be_true)
  end

  it "should return true if passed array with string 1" do
    result = scope.function_num2bool([["1"]])
    result.should(be_true)
  end

  it "should return true if passed array with number 1" do
    result = scope.function_num2bool([[1]])
    result.should(be_true)
  end

  it "should return false if passed string 0" do
    result = scope.function_num2bool(["0"])
    result.should(be_false)
  end

  it "should return false if passed number 0" do
    result = scope.function_num2bool([0])
    result.should(be_false)
  end

  it "should return false if passed array with string 0" do
    result = scope.function_num2bool([["0"]])
    result.should(be_false)
  end

  it "should return false if passed array with number 0" do
    result = scope.function_num2bool([[0]])
    result.should(be_false)
  end

  it "should return false if passed string -1" do
    result = scope.function_num2bool(["-1"])
    result.should(be_false)
  end

  it "should return false if passed number -1" do
    result = scope.function_num2bool([-1])
    result.should(be_false)
  end

  it "should return false if passed array with string -1" do
    result = scope.function_num2bool([["-1"]])
    result.should(be_false)
  end

  it "should return false if passed array with number -1" do
    result = scope.function_num2bool([[-1]])
    result.should(be_false)
  end

end
