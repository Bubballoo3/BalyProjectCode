load 'bIndexOps.rb'
class JsonSample
  # A class to simulate the JSON output of Digital Kenyon. 
  # Once created, this JSON file can be passed to the updater#update
  # method in balyInterface/methodTesting/updater.rb
 private
  RequiredJSON={
    "context_key"=>"9847662",
    "url"=>"http://digital.kenyon.edu/baly/744",
    "peer_reviewed"=>false,
    "parent_key"=>"5047491",
    "parent_link"=>"http://digital.kenyon.edu/baly",
    "site_key"=>"4580553",
    "site_link"=>"http://digital.kenyon.edu",
    "is_digital_commons"=>true,
    "institution_title"=>"Kenyon College",
    "fulltext_url"=>"https://digital.kenyon.edu/context/baly/article/1748/viewcontent",
    "download_format"=>"picture",
    "download_link"=>"https://digital.kenyon.edu/context/baly/article/1748/type/native/viewcontent",
    "publication_key"=>"5047491",
    "publication_title"=>"Denis Baly Image Collection",
    "publication_link"=>"http://digital.kenyon.edu/baly",
    "dc_or_paid_sw"=>true,
    "include_in_network"=>false,
    "embargo_date"=>"1970-01-01T00:00:01Z",
    "mtime"=>"2024-07-23T21:05:17Z",
    "exclude_from_oai"=>false,
    "fields_digest"=>"4f75f61fc87b5b86e647ef93d9877f6ae476bcba",
    "discipline_terminal_key"=>[510],
    "document_type"=>["35mm_slide", "35 mm slide", "35 mm slides"],
    "author"=>["Denis Baly"],
    "ancestor_key"=>["9847662", "5047491", "4580553", "1"],
    "virtual_ancestor_link"=>
    ["http://digitalcommons.bepress.com",
    "http://researchnow.bepress.com",
    "http://digital.kenyon.edu",
    "http://digital.kenyon.edu/depts",
    "http://digital.kenyon.edu/arthistory",
    "http://digital.kenyon.edu/baly",
    "http://teachingcommons.us",
    "http://teachingcommons.us/arts_humanities",
    "http://ohio.researchcommons.org",
    "http://liberalarts.researchcommons.org"],
    "configured_field_t_rights_statements"=>["In Copyright - Non-Commercial Use Permitted", "http://rightsstatements.org/vocab/InC-NC/1.0/"],
    "author_display_lname"=>["Baly"],
    "discipline"=>["Arts and Humanities", "History of Art, Architecture, and Archaeology"],
    "author_display"=>["Denis Baly"],
    "configured_field_t_dpla_type"=>["Image", "Images", "image"],
    "discipline_key_1"=>[510],
    "discipline_key_0"=>[438],
    "virtual_ancestor_key"=>["81989", "82034", "5025010", "7148337", "4580553", "7639796", "7561783", "5047491", "7127169", "5025132"],
    "discipline_1"=>["History of Art, Architecture, and Archaeology"],
    "discipline_0"=>["Arts and Humanities"],
    "ancestor_link"=>["http://digital.kenyon.edu/baly/744", "http://digital.kenyon.edu/baly", "http://digital.kenyon.edu", "http:/"]
  }
  OptAPIfields={ #This hash is the order the info displays, not how it is delivered by the api.
    "title"=>["Title"], ####### This is also a good reference for filling out batch spreadsheets
    "publication_date"=>["Creation Year"],
    "configured_field_t_documented_date" => ["Creation Date"],
    "configured_field_t_sorting_number"=>["Sorting Number"],
    "configured_field_t_identifier"=>["Image ID"],
    "configured_field_t_alternate_identifier"=>["VRC slide number"],
    "configured_field_t_subcollection"=>["Baly Subcollection"],
    "configured_field_t_alt_subcollection"=>["VRC (Alternate) Subcollection"],
    "configured_field_t_batch_stamp"=>["Batch Stamp"],
    "abstract"=>["Abstract"],
    "configured_field_t_description"=>["Description"],
    "configured_field_t_references"=>["References"],
    "configured_field_t_image_notes"=>["Image Notes"],
    "configured_field_t_city"=>["City"],
    "configured_field_t_region"=>["Region"],
    "configured_field_t_country"=>["Country"],
    "configured_field_t_coverage_spatial"=>["Geographic Reference"],
    "configured_field_t_curator_notes"=>["Curator Notes"],
    "configured_field_t_object_notation"=>["JSON"]
  }
  def generateAPIoutput(indexfile)
    fields=parseNestedEndpoints(OptAPIfields,StandardError.new)
    data=readIndexData(indexfile,0,fields,"Hash","casesensitive")
    puts data
    newdata=Array.new
    data.each do |row|
      optHash=generateOptHash(row,true,OptAPIfields)
      puts "Custom Hash=#{optHash}"
      finalHash=RequiredJSON.merge optHash
      unless finalHash["title"] == ["Title"]
        newdata.push(fixApiDiscrepancies(finalHash))
      end
    end
    finaloutput=Hash.new
    finaloutput["results"]=newdata
    return finaloutput
  end
  def fixApiDiscrepancies(apiHash)
    keystopullout=["title","abstract","publication_date"]
    keystopullout.each do |key|
      if apiHash[key].to_s.length > 0
        #puts apiHash[key]
        apiHash[key]=apiHash[key][0]
        #puts apiHash[key]
      end
      #puts apiHash[key]
    end
    pubDate=apiHash["publication_date"]
    if pubDate.class==String
      if pubDate.fullstrip.is_integer?
        newDate=pubDate+"-01-01T08:00:00Z"
        apiHash["publication_date"]=newDate
      end
    end
    return apiHash
  end
 public
  def saveAPIsample(inputfile,outputfile= "none")
    if outputfile== "none"
      outputfile=generateUniqueFilename("sampleAPIdata","json")
    end
    apidata=generateAPIoutput(inputfile)
    IO.write(outputfile,apidata.to_json)
    puts "Generated API data written to #{outputfile}"
    return apidata[0]
  end
end