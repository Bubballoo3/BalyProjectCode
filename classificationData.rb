#Normal Hashes are used for A-AQ/B01-B41. These are largely the same numbers with different prefixes
#ConvertHashNorm contains subcollections that index normally.
# we can keep everything right of the decimal point and just change
# the beginning
ConvertHashNorm={
"A" => "B01",
"B" => "B02",
"C" => "B03",
"D" => "B04",
"E" => "B05",
"F" => "B06",
"G" => "B07",
"H" => "B08",
"I" => "B09",
"J" => "B10",
"K" => "B11",
"L" => "B12",
"M" => "B13",
"N" => "B14",
"O" => "B15",
"P" => "B16",
"R" => "B17",
"S" => "B18",
"T" => "B19",
"U" => "B20",
"V" => "B21",
"W" => "B22",
"X" => "B23",
"Y" => "B24",
"Z" => "B25",
"AA" => "B26",
"AB" => "B27",
"AC" => "B28",
"AD" => "B29",
"AE" => "B30",
"AF" => "B31",
"AG" => "B32",
"AH" => "B33",
"AI" => "B34",
"AJ" => "B35",
"AK" => "B36",
"AL" => "B37",
"AM" => "B38",
"AN" => "B39",
"AO" => "B40",
"AP" => "B41",
}


#this is an exact inversion of the one above
BHashNorm={
"B1"=>"A",
"B2"=>"B",
"B3"=>"C",
"B4"=>"D",
"B5"=>"E",
"B6"=>"F", 
"B7"=>"G", 
"B8"=>"H", 
"B9"=>"I", 
"B01"=>"A",
"B02"=>"B",
"B03"=>"C",
"B04"=>"D",
"B05"=>"E",
"B06"=>"F", 
"B07"=>"G", 
"B08"=>"H", 
"B09"=>"I", 
"B10"=>"J", 
"B11"=>"K", 
"B12"=>"L", 
"B13"=>"M", 
"B14"=>"N", 
"B15"=>"O", 
"B16"=>"P", 
"B17"=>"R", 
"B18"=>"S", 
"B19"=>"T", 
"B20"=>"U", 
"B21"=>"V", 
"B22"=>"W", 
"B23"=>"X", 
"B24"=>"Y", 
"B25"=>"Z", 
"B26"=>"AA", 
"B27"=>"AB", 
"B28"=>"AC", 
"B29"=>"AD", 
"B30"=>"AE", 
"B31"=>"AF", 
"B32"=>"AG", 
"B33"=>"AH", 
"B34"=>"AI", 
"B35"=>"AJ", 
"B36"=>"AK", 
"B37"=>"AL", 
"B38"=>"AM",
"B39"=>"AN",
"B40"=>"AO",
"B41"=>"AP",
}
#for BhashRange values are what we expect to find, 
# verified ranges marked with #V
BhashRange ={
"B42.001-100" => "AQ.1-100", #V
"B42.101-200" => "CU.1-100", #V
"B42.201-300" => "CV.1-100", #V
"B42.301-400" => "CW.1-100",
"B42.401-500" => "CX.1-100",
"B42.501-600" => "CY.1-100",
"B42.601-700" => "CZ.1-100",
"B42.701-800" => "DA.1-100",
"B42.801-900" => "DB.1-100",
"B42.901-999" => "DC.1-99",
"B43.000" => "DC.100",
"B43.001-100" => "DD.1-100",
"B43.101-200" => "DE.1-100",
"B43.201-300" => "DF.1-100",
"B43.301-400" => "DG.1-100",
"B43.401-500" => "DQ.1-100",
"B43.501-600" => "DR.1-100",
"B43.601-700" => "DS.1-100",
"B43.701-800" => "EE.1-100",
"B43.801-900" => "DT.1-100",
"B43.901-999" => "None",
"B44.201-300" => "AR.1-100",
"B44.301-400" => "AS.1-100",
"B44.401-500" => "AT.1-100",
"B44.501-600" => "AU.1-100",
"B44.601-700" => "AV.1-100",
"B44.701-800" => "AW.1-100",
"B44.801-900" => "AX.1-100",
}
#the next hash picks up at B44.900s and ends at B45.1000
B44to45hash={
'B44.901-78' => 'AY.001-078',
'B44.979-95' => 'AY.080-96',
'B44.996-98' => 'AY.098-100',
'B44.999' => 'AZ.001',
'B45.000-81' => 'AZ.002-83',
'B45.082' => 'AZ.085',
'B45.083' => 'AZ.084',
'B45.084-98' => 'AZ.086-100',
'B45.099-198' => 'BB.001-100',
'B45.199-261' => 'TC.001-63',### Due to problems with BA, it will be assigned TC until it can be redefined officially
'B45.262' => 'TC.071',
'B45.263' => 'TC.069',
'B45.264' => 'TC.070',
'B45.265' => 'TC.000', #This slide is repeated here, this will have to be updated when a fix is made
'B45.266' => 'TC.073',
#####################################################################
# B45.200s become very messy and putting them into code will lead to 
# problems until an official fix is made
#####################################################################
'B45.292' => 'TC.',
}
B46hash={
"B46.000-084" => "BJ.016-100",
"B46.085-174" => "BK.001-90",
"B46.175" => "BK.092",
"B46.176" => "BK.091",
"B46.177-181" => "BK.093-97",
"B46.182-280" => "BL.001-99",
"B46.281"=>"BL.100", #this slide is also categorized BL.099, so it has been changed to 100
"B46.282-353" => "BM.001-72",
"B46.354" => "BM.074",
"B46.355" => "BM.073",
"B46.356-381" => "BM.075-100",
"B46.382-481" => "BN.001-100",
"B46.482-556" => "BQ.001-75",
#the following have no Baly numbers, so we use the invented group FL
"B46.557-561" => "FL.001-05",
#and these have been assigned the unnumbered group GB
"B46.561-656" => "GB.001-95", #These may get changed to BR, 
# since they certainly seem to be placed here with that in mind, but we'll see
"B46.657-756" => "BS.001-100",
"B46.757-856" => "BT.001-100",
"B46.857-933" => "BU.001-77", #there is doubt as to the origin of this collection
"B46.934-999" => "BV.001-66"
}
B47hash={
'B47.000-024' => 'BV.067-091',
#the next slide is totally unaccounted for, so it gets XE (does not exist)
'B47.025' => "XE.001",
'B47.026' => 'Z.056',
'B47.027' => 'Z.057',
'B47.028' => 'Z.058',
'B47.029' => 'Z.062',
'B47.030' => 'Z.063',
'B47.031' => 'Z.066',
'B47.032' => 'Z.061',
'B47.033' => 'Z.060',
'B47.034' => 'Z.059',
'B47.035' => 'Z.065',
'B47.036' => 'Z.064',
'B47.037' => 'Z.067',
'B47.038' => 'Z.068',
'B47.039-51' => "BW.001-13", 
'B47.052' => 'Z.075',
'B47.053-56' => 'Z.071-74',
'B47.057' => "BW.014",
'B47.058' => 'Z.076',
'B47.059' => 'Z.070',
'B47.060' => 'BW.015',
'B47.061' => 'Z.069',
'B47.062' => 'Z.077',
'B47.063-76' => 'BW.016-29',
'B47.077' => 'EJB.001',  # The numbers on the EJB slides are invented, 
'B47.078' => 'EJB.002',  # and may need to be changed if more are found
'B47.079' => 'Z.080',
'B47.080' => 'Z.081',
'B47.081' => 'Z.083',
'B47.082' => 'Z.084',
'B47.083' => 'Z.086',
'B47.084' => 'Z.078',
'B47.085' => 'Z.079',
'B47.086' => 'BW.30',
'B47.087' => 'Z.085',
'B47.088-91' => 'BW.031-34',
'B47.092' => 'CY.088',
'B47.093' => 'BW.035',
'B47.094' => 'BW.036',
'B47.095' => 'CY.085',
'B47.096' => 'CY.089',
'B47.097' => 'Z.089',
'B47.098' => 'CY.091',
'B47.099' => 'Z.100',
'B47.100' => 'Z.092',
'B47.101' => 'Z.093',
'B47.102' => 'Z.097',
'B47.103' => 'Z.098',
'B47.104' => 'Z.099',
'B47.105' => 'Z.092',
'B47.106-110' => 'CY.094-98',
'B47.111' => 'CY.100',
'B47.112' => 'Z.087',
'B47.113' => 'Z.088',
'B47.114' => 'Z.090',
'B47.115' => 'Z.091',
'B47.116' => 'Z.094',
'B47.117' => 'Z.095',
'B47.118' => 'Z.096',
'B47.119-200' => 'BX.001-82',
'B47.201-218' => 'BX.083-100',
'B47.219-300' => 'BY.001-82',  
'B47.301-316' => 'BY.083-98',
'B47.317' => 'BY.100',
'B47.318' => 'BY.099',
'B47.319-418' => 'BZ.001-100',
'B47.419-518' => 'CA.001-100',
'B47.519-618' => 'CB.001-100',
'B47.619-718' => 'CC.001-100',
'B47.719-811' => 'CD.001-93',
'B47.812-817' => 'CD.095-100',
'B47.818-864' => 'CE.001-47',
'B47.865' => 'CE.049',
'B47.866' => 'CE.050',
'B47.867-890' => 'CE.052-75',
'B47.891' => 'CE.077',
'B47.892-902' => 'CE.079-89',
'B47.903-912' => 'CE.091-100',

#####################################################
#The following slides have no baly numbers. I suggest
# the alphanumeric 'FL' to signal slides that have VRC
# numbers but not baly ones. If this conflicts with a
# decision down the road, fix it here.
'B47.913-1000' => 'FL.006-93',
}
=begin
'B47.0'
'B47.0'
'B47.0'
'B47.0'
'B47.0'
'B47.0'
'B47.0'
'B47.0'

}   
=end
    
    