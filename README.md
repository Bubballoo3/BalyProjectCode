# Baly Project Code
##### A collection of ready-to-use tools and classes for the Denis Baly Slide Collection
***
## How to Open and Run in a terminal
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
