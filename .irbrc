#!/usr/bin/env irb -W0
# JCWR's IRBRC
at_exit { puts "\nGoodbye" }
$VERBOSE = nil

# Monkey patches
class String

  COLOR_CLEAR = "\033[0m"
  COLOR_START = "\033["
  COLOR_MAP = {
    :black     => 30,
    :red       => 31,
    :green     => 32,
    :yellow    => 33,
    :blue      => 34,
    :magenta   => 35,
    :cyan      => 36,
    :white     => 37
  }

  def bold
    colorize(1)
  end

  def underline
    colorize(4)
  end

  COLOR_MAP.each do |color,value|
    define_method color do
      colorize(value)
    end
    define_method (color.to_s+'bg').to_sym do 
      colorize(value+10)
    end
  end

  private

  def colorize(i)
    COLOR_START+i.to_s+"m"+self+COLOR_CLEAR
  end

end

def cd(x)
  Dir.chdir(x.to_s)
end

def up(n=1)
  n.times do
    cd('..')
  end
  0
end

class Array

  def sum
    self.inject(0) { |x,y| x+y }
  end

  def mean
    self.sum/self.size.to_f
  end

  def median
    if self.size % 2 == 0
      self.sort[self.size/2]
    else
      self.sort[self.size/2]/2.0+self.sort[self.size/2+1]/2.0
    end
  end

  def variance
    self.collect { |x|
      (x-self.mean)**2
    }.sum/self.size
  end

  def stddev
    self.variance**0.5
  end

  def product
    self.inject(1) { |x,y| x*y }
  end
end

class Symbol
  def /(other)
    (self.to_s + '/' + other.to_s).to_sym
  end
end


#Monkey Patch IRB
module IRB
  class Irb
    def prompt(prompt, ltype, indent, line_no)
      p = prompt.dup
      p.gsub!(/%([0-9]+)?([a-zA-Z])/) do
      case $2
      when "t"
        Time.now.strftime(IRB.conf[:PROMPT][IRB.conf[:PROMPT_MODE]][:TIME_FLAGS]).strip
      when "u"
        ENV['USER']
      when "h"
        ENV['HOST']
      when "p"
        %x{pwd}.strip
      when "N"
        @context.irb_name
      when "m"
        @context.main.to_s
      when "M"
        @context.main.inspect
      when "l"
        ltype
      when "i"
        if $1 
          format("%" + $1 + "d", indent)
        else
          indent.to_s
        end
      when "n"
        if $1 
          format("%" + $1 + "d", line_no)
        else
          line_no.to_s
        end
      when "%"
        "%"
      end
      end
      p
    end
  end
end

IRB.conf[:MATH_MODE] = true

IRB.conf[:PROMPT][:JCWR] = {
  :PROMPT_I => "[%t]".bold.white+" "+"%u@%h".underline+" %p"+" irb %n > ".blue,
  :PROMPT_S => "[%t]".bold.white+" "+"%u@%h".underline+" %p"+" irb %n > ".blue,
  :PROMPT_C => "[%t]".bold.white+" "+"%u@%h".underline+" %p"+" irb %n > ".blue,
  :RETURN => " => %s\n",
  :TIME_FLAGS => "%l:%M%P"
}

#IRB.conf[:PROMPT_MODE] = :JCWR

