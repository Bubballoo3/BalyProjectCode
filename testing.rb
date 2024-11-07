
## This file will test all the functions from the bottom up to determine what causes an error.
# This is especially important when we move to a new ruby version, or make changes to base files.
# We typically work from the bottom up for each file, starting with the standalone functions
# We start by creating a special error class for this file
# 
# For each function, we start with a expect function that will allow us to easily test the method with feedback
# 


class TestingError<StandardError
end
class FileTester
  def testAll()
    puts "No testAll function has been defined"
  end
end

#balyClasses.rb
load 'balyClasses.rb'
class BalyClassesTester < FileTester
  def testAll()
    testClassExtensions
    testClassificationClass
    testSlideClass
    return true
  end

  def testClassExtensions()
    # These methods should always work, 
    # so we define a universal error for all of them
    serr=TestingError.new "A string class method test has failed"
    # Test the is_integer? method
    raise serr unless "1".is_integer?
    raise serr unless "89".is_integer?
    raise serr unless "-152".is_integer?
    raise serr if "123.45".is_integer?
    raise serr if "hi".is_integer?
    
    # Test the is_float? method
    raise serr unless "1.23".is_float?
    raise serr unless "89.123".is_float?
    raise serr unless "-152.456".is_float?
    raise serr if "123".is_float?
    raise serr if "omega".is_float?

    # Test the lfullstrip method
    raise serr unless "   hi".lfullstrip == "hi"

    # Test the rfullstrip method
    raise serr unless "hi   ".rfullstrip == "hi"

    # Test the fullstrip method
    raise serr unless "   hi   ".fullstrip == "hi"

    # Test the alphValue method
    raise serr unless "A".alphValue == 1
    raise serr unless "BA".alphValue == 53
    raise serr unless "DD".alphValue == 108
    raise serr unless "ABC".alphValue == 731

    # Test the cleanSpaces method
    raise serr unless "   hi   ".cleanSpaces == "   hi   "
    raise serr unless " hi   ".cleanSpaces == " hi   "
          
    aerr=TestingError.new "An array method test has failed"
    # Test the includesAtIndex method
      # Test basic functionality
    raise aerr unless ["1","2","3","4","5"].includesAtIndex("2") == [1]
    raise aerr unless ["1","2","3","4","5"].includesAtIndex("4") == [3]
    raise aerr unless ["1","2","3","4","5"].includesAtIndex("6") == []
    raise aerr unless ["1","2","3","1","1"].includesAtIndex("1") == [0,3,4]
      # Test case insensitivity
    raise aerr unless ["M","N","O","P","Q"].includesAtIndex("p") == [3]
    raise aerr unless ["M","N","O","P","Q"].includesAtIndex("q") == [4]
      # Test partial finds
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesAtIndex("d") == [2,3]
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesAtIndex("He") == [0,3]
    
    # Test the includesCaseAtIndex method
    raise aerr unless ["M","N","O","P","Q"].includesCaseAtIndex("p") == []
    raise aerr unless ["M","N","O","P","Q"].includesCaseAtIndex("P") == [3]
      # Test partial finds
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesCaseAtIndex("D") == [2,3]
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesCaseAtIndex("he") == [0,3]
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesCaseAtIndex("d") == [3]
    raise aerr unless ["The","Lazy","DOG sat alone","Didn't he"].includesCaseAtIndex("t") == [2,3]
    
    herr=TestingError.new "A hash method test has failed"
    # Test invertible? method
    raise herr unless {"A"=>1,"B"=>2,"C"=>3}.invertible?
    raise herr unless {"A"=>1,"B"=>2,"C"=>2}.invertible? == false
  end
  
  def classificationExpect(value,expectation)
    err=TestingError.new "A classification method test has failed. Expected #{expectation} but got #{value}."
    raise err unless value == expectation
  end

  def testClassificationClass()
    # Test initialization
      # Standard syntax
    c=Classification.new("B.005")
    classificationExpect(c.to_s,"B.005")
    d=Classification.new("CD.055")
    classificationExpect(d.to_s,"CD.055")
      # Nonstandard syntax
    e=Classification.new("B34.3")
    classificationExpect(e.to_s,"B34.003")
    f=Classification.new("F. 42")
    classificationExpect(f.to_s,"F.042")
  end
  def slideExpect(value,expectation)
    err=TestingError.new "A slide method expected #{expectation} but got #{value}"
    raise err unless value == expectation
  end
  def testSlideClass()
  # we start with basic methods and get more complicated
    # Simple Case testing getindex and groups
    bSlide=Slide.new("A.001")
    slideExpect(bSlide.balyGroup,"A")
    slideExpect(bSlide.getindex.to_s,"A.001")
    slideExpect(bSlide.getindex("Baly").to_s, "A.001")
    slideExpect(bSlide.getindex("VRC"),0)
    vSlide=Slide.new("B43.1000")
    slideExpect(vSlide.VRCGroup,"B43")
    slideExpect(vSlide.getindex.to_s,"B43.1000")
    slideExpect(vSlide.getindex("Baly"),0)
    slideExpect(vSlide.getindex("VRC").to_s, "B43.1000")
    # Test the addAltID method
      # String in
    bSlide.addAltID("B01.001")
    vSlide.addAltID("CD.21")
    # Confirm results
    slideExpect(bSlide.getindex.to_s,"A.001") # getIndex should always return the Baly id
    slideExpect(vSlide.getindex.to_s,"CD.021")
    slideExpect(bSlide.getindex("VRC").to_s, "B01.001")
    slideExpect(vSlide.getindex("Baly").to_s, "CD.021")
      # Classification in
    bclass=Classification.new("B.005")
    vclass=Classification.new("B42.421")
    # Refresh examples
    bSlide=Slide.new("H.100")
    vSlide=Slide.new("B21.052")
    # Add ids
    bSlide.addAltID(vclass)
    vSlide.addAltID(bclass)
    # Confirm results
    slideExpect(bSlide.getindex.to_s,"H.100") # getIndex should always return the Baly id
    slideExpect(vSlide.getindex.to_s,"B.005")
    slideExpect(bSlide.getindex("VRC").to_s, "B42.421")
    slideExpect(vSlide.getindex("VRC").to_s, "B21.052")
    
    # Test addTitle
    bSlide.addTitle "This is a test title"
    slideExpect(bSlide.title,"This is a test title")

    # Test addLocation
    # General Locations
      # Smallest example 
    sgenlocArray=[[0,0],"A place"]
    bSlide.addLocation(sgenlocArray)
      # get coordinates
    slideExpect(bSlide.getCoordinates,[0,0])
      # get full location
    samplegenloc=GeneralLocation.new(sgenlocArray)
    slideExpect(bSlide.generalLocation.name,samplegenloc.name)
    slideExpect(bSlide.generalLocation.coords,samplegenloc.coords)
    slideExpect(bSlide.generalLocation.notes,samplegenloc.notes)
      # Larger example
    mgenlocArray=[[10,20],"Place Name","Some notes"]
      #replace location
    bSlide.addLocation(mgenlocArray,false,true)
    slideExpect(bSlide.getCoordinates,[10,20])
      # get full location
    mamplegenloc=GeneralLocation.new(mgenlocArray)
    slideExpect(bSlide.generalLocation.name,mamplegenloc.name)
    slideExpect(bSlide.generalLocation.coords,mamplegenloc.coords)
    slideExpect(bSlide.generalLocation.notes,mamplegenloc.notes)

    # Specific Locations
      # Smallest example
    sspeclocArray=[[1,1],"possible location at 35 degrees NE"]
    bSlide.addLocation(sspeclocArray,true) # add specific location
    slideExpect(bSlide.getCoordinates,[1,1])
      # get full location
    samplespecloc=SpecificLocation.new(sspeclocArray)
    slideExpect(bSlide.specificLocation.title,samplespecloc.title)
    slideExpect(bSlide.specificLocation.coords,samplespecloc.coords)
    slideExpect(bSlide.specificLocation.notes,samplespecloc.notes)
    slideExpect(bSlide.specificLocation.precision,samplespecloc.precision)
    slideExpect(bSlide.specificLocation.angle.degrees,samplespecloc.angle.degrees)
    slideExpect(bSlide.specificLocation.angle.direction,samplespecloc.angle.direction)
    slideExpect(bSlide.specificLocation.angle.to_s,samplespecloc.angle.to_s)
      # Larger example
    mspeclocArray=[[2,2],"possible location at 0 degrees N","Some medium notes","Some medium title"]
    bSlide.addLocation(mspeclocArray,true,true) # add specific location
    slideExpect(bSlide.getCoordinates,[2,2])
      # get full location
    mamplespecloc=SpecificLocation.new(mspeclocArray)
    slideExpect(bSlide.specificLocation.title,mamplespecloc.title)
    slideExpect(bSlide.specificLocation.coords,mamplespecloc.coords)
    slideExpect(bSlide.specificLocation.notes,mamplespecloc.notes)
    slideExpect(bSlide.specificLocation.precision,mamplespecloc.precision)
    slideExpect(bSlide.specificLocation.angle.degrees,mamplespecloc.angle.degrees)
    slideExpect(bSlide.specificLocation.angle.direction,mamplespecloc.angle.direction)
    slideExpect(bSlide.specificLocation.angle.to_s,mamplespecloc.angle.to_s)
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

classes=[BalyClassesTester.new,PrettyCommonFunctionsTester.new]
classes.each do |tester|
    puts "Testing #{tester.class}..."
    tester.testAll
end
puts "Testing Successfull as all modules have passed"