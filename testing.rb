
## This file will test all the functions from the bottom up to determine what causes an error.
# This is especially important when we move to a new ruby version, or make changes to base files.
# We typically work from the bottom up for each file, starting with the standalone functions
# We start by creating a special error class for this file
# 
# For each function, we start with a expect function that will allow us to easily test the method with feedback
class TestingError<StandardError
end
class FileTester
  def testAll()
    puts "No testAll function has been defined"
  end
end



# prettyCommonFunctions.rb
load 'prettyCommonFunctions.rb'
#   We start with the base functions and move to larger ones
class PrettyCommonFunctionsTester < FileTester
  # Summarize tests for each Function
  def testAll()
    testGetCatType
    testParseSlideRange
    return true
  end

# getCatType() 
#   IN: a classification of a slide
#   OUT: the system of this classification, either "VRC" or "Baly" or "N/A" (if not parseable)
  def catTypeExpect(inp,exp)
    type=getCatType(inp)
    raise TestingError.new "getCatType failed to classify #{inp}. Instead returned #{type}." unless type == exp
  end
  def testGetCatType()
    expectations={
      #"B45.555" => "VRC",
      "A.004" => "Baly",
      "BA.042" => "Baly",
      "BG.100" => "Baly",
      "BG.200" => "N/A",
      "BFSDFE" => "N/A"
    }
    expectations.each do |inp,outp|
      catTypeExpect(inp,outp)
    end
  end

# getUniqueFilename()
#   IN: A string filetype ending (default xls)

# parseSlideRange()
#   IN: a series of comma separated ranges similar to A.001-002.
#   OUT: An array of individual classifications contained in the ranges, as well as the max and min of the range.

  def slideRangeExpect(range,arr)
    out=parseSlideRange(range)[0]
    raise TestingError.new "parseSlideRange failed to parse #{range}. Instead returned #{out}." unless out==arr 
  end
  def testParseSlideRange()
    expectations={
      #Simple Case
      "A.001-05" => ["A.001","A.002","A.003","A.004","A.005"],
      #Multiple simple case
      "A.01,B.002-4,C.2" => ["A.001","B.002","B.003","B.004","C.002"],
      #VRC classification case
      "B45.321-30" => ["B45.321","B45.322","B45.323","B45.324","B45.325","B45.326","B45.327","B45.328","B45.329","B45.330"]
    }
    expectations.each do |inp,res|
      slideRangeExpect(inp,res)
    end
  end
end

p=PrettyCommonFunctionsTester.new
p.testAll

puts "Testing Successfull as all modules have passed"