class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name  # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    define_method attr_name+"=" do |*args|
      @history ||= {}
      @history[attr_name] ||= [nil]
      @history[attr_name] << args[0] unless attr_name.nil?
    end
    define_method attr_name+"_history" do
      @history[attr_name]
    end
  end
end

class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :foo
end

f = Foo.new
f.bar = 1
f.bar = 2
print f.bar_history,"\n" # => if your code works, should be [nil,1,2]
f = Foo.new
f.bar = 4
print f.bar_history,"\n" # => if your code works, should be [nil,1,2]

f.foo = 1
print f.foo_history,"\n"
