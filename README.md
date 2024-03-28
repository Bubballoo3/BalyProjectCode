# Baly Project Code
##### A collection of ready-to-use tools and classes for the Denis Baly Slide Collection
***
## How to Open and Run in a Terminal
* ****Navigate to Folder****

    Open a terminal window and navigate to the BalyProjectCode folder using the Change Directory (`cd`) command. For example, a terminal on startup will usually start at your user, and on a windows terminal, the prompt may look something like 
    ```sh
    C: Users/GenericUsername>
    ```
   Suppose the BalyProjectCode folder is in your downloads. Then you would type the following command into the terminal:
   ```sh
   cd Downloads/BalyProjectCode
   ```
   to see something like 
   ```sh
   C: Users/GenericUsername/Downloads/BalyProjectCode>
   ```
   The terminal will always display the current folder in the prompt, so once you see BalyProjectCode as in the example above you know you are finished.

* ****Start Session and Load****
  
   Once you are in the right folder, start an inline Ruby session by typing `irb` into the command line and press enter. If your computer has ruby pre-installed, your command prompt should read `irb(main):001:0>`. If you attempt this but encounter an error, you may not have ruby correctly installed, and you can find the directions at [Kenyon College CompSci Dept](https://cs.kenyon.edu/index.php/comp-318-software-development-s24/) in the schedule item for January 18th. 

    Once you're in the Ruby session, load the methods file by typing this command
    ```sh
    load('autoMethods.rb')
    ```
    When you press enter, it should display some warning dialog, which is completely fine as long as the last line it displays is 
    ```sh
    => true
    ```
    Now you are ready to use any of the available methods below
***

## Current Methods
#### mapKMLtoXLS
Reads a kml file downloaded from a Google MyMaps Project (such as Baly Locations), sorts the location data by slide, and produces a xls file with all the info.

#### addSortingNumbers
Reads a column containing Baly Classifications from an xls file and generates a column with the corresponding sorting numbers for each row.
***

## How to Use mapKMLtoXLS
* ****Download kml file from MyMaps****

    Open a Google MyMaps project in your browser and click the three dots at the top right of the side panel. From this menu, select **Export to KML/KMZ**. In the selector showing "Entire Map," change the selection to a single layer that you are trying to transform. Then click the checkbox titled **Export as KML instead of KMZ** and press the "Download" button. Then move the kml file to the BalyProjectCode folder (where this `README` file is located).
* ****Use the Method****
  
    Make sure you have a terminal window prepared using the instructions at the top of this page. Then type the following code into the command line 
    ```sh
    mapKMLtoXLS('yourkmlfilename')
    ```
    where yourkmlfilename is the name of the kml file you downloaded above, making sure it ends in '.kml' (add it if not). This will generate an xls file with a name based on the kml file name. This xls file will appear in the BalyProjectCode folder, and you can open it using excel.
    
* **Options**
  
    If you would like to specify the name of the xls file, you can instead type 
    ```sh
    mapKMLtoXLS('yourkmlfilename','newxlsfilename')
    ```
    as long as newxlsfilename is a sequence of characters ending in '.xls'
    
    If you would not like to get a spreadsheet organized by slide, but instead want a direct transcription of the kml file (organized by location entry), type 
    ```sh
    mapKMLtoXLS('yourkmlfilename','newxlsfilename',"straight")
    ```
    using the same filenames from the previous steps.
***
## How to Use addSortingNumbers
* ****Create Input Spreadsheet****

    To start, we will need to open our spreadsheet table containing a column of Baly (alphanumeric) classifications. Then start a new spreadsheet, give it a name, and save it in BalyProjectCode as an 'Excel 97-2003 Workbook (.xls)" file. *You should check the file in your system to make sure it is not a .xlsx*. If you are working off a cloud spreadsheet (such as the Baly Slide Index, export it to a .xls file.
    Then copy the entire row of baly classifications and paste it into the new .xls spreadsheet, in the second row (leaving a row for the sorting numbers to the left). Then clear everything that is not a Baly Classification from the top of the column, and delete those rows from the spreadsheet to shift the remainder of the column upwards, before saving the file *and closing it*.
* ****Use the Method****

    Open a terminal window and Ruby session using the instructions above, and then type the following code into the command line
    ```sh
    require_relative "autoMethods.rb"
    addSortingNumbers('inputfilename')
    ```
    The program will create a new file titled NewSpreadsheet, with a random sequence of numbers following this and ending in .xls. The new spreadsheet will contain the sorting numbers in the first column and the classifications used in the second. There are options for the method as well, but these will be discussed at the end.
    Open the new spreadsheet, and do a quick check to make sure the sorting numbers look alright. You should mostly be checking that the numbers line up, and any blank rows in the classifications row have blank entries in the Sorting Number row. If everything looks good, you can copy the column of sorting numbers and paste it into your original spreadsheet, lining up the first number with the first classification that was used.
* ****Method Options****

    The first method option is to select a new filename for the automatically generated spreadsheet. This has to be a collection of characters ending in .xls, and you would type
  ```sh
  addSortingNumbers('inputfilename','resultfilename')
  ```
  Sometimes it is more convenient to read from an original document than to copy-paste into a new input spreadsheet, although it is much more time consuming for the program to read a large spreadsheet compared to one with the one column it needs. If you are doing this, you need to find what worksheet the column you need is in, and the column number (starting from 0) that is the one you need. You then type this code into the command line
  ```sh
  addSortingNumbers('inputfilename','resultfilename',worksheetNumber,columnNumber)
  ```
  where worksheetNumber and columnNumber are both integer values, with the first worksheet being number 1, and the first column being number 0.
