require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Hello
  attr_accessor :name

  def hello
    puts "Hello, #{self.name}"
  end
end

class Goodbye
  def bye name
    puts "Goodbye"
  end
end

class AnotherRunner
  include SanUltari::Command

  #, desc: 'goodbye command'
  map :bye, Goodbye
  param :bye, :name, type: :parameter
end

class Runner
  include SanUltari::Command

  map :hello, Hello, desc: 'hello command'
  # type: :attribute is default
  param :hello, :name, require: false, default: 'World'
  # second parameter is optional. second parameter can remove for importing all commands
  import AnotherRunner, :bye
  # another importing method. imported commands has group. commands having same name can be distinguish
  # last optional parameter is same functionally with above method
  group :say, AnotherRunner
end