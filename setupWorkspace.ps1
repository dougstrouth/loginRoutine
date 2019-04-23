
#Change this to match where you unzipped the files 
$saveLocation = "c:\scripts"

#change this to where you would like your notes saved
$outputPath = "C:\Users\dstrouth001\Documents\Notes\"

#enter as many websites as you want, separated only by a space in the config file referenced below
$configFile = "dailyWebsites.txt"

cd $saveLocation

$configFile = Get-Content -Path $configFile

$configFile 


#open my email or any other sites
Start-Process "chrome.exe" $configFile

#open hangouts
Start-Process "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"  #'put any parameters you need to feed an application in quotes here. For me I had to give specific parameters to chrome to open hangouts chat'

#setup my notes file for the day
#change date format or name however you want, I prefer just the date in a dedicated notes folder
$today = Get-Date -UFormat "%m-%d-%y"

#create word object
$word = New-Object -ComObject word.application
#we wanna do this without slowing down to open word if we can
$word.Visible = $false
#this adds a document to the word process
$doc = $word.documents.add()

#setup the file naming convention
$outputPath = $outputPath + $today+ ".docx"

if ([System.IO.File]::Exists($outputPath))
 {
     #If the file already exists then we just open the file
     Invoke-Item $outputPath
    
} else {
    
    #save and exit wordprocess so there is no error in terms of editing the file later
    $doc.SaveAs($outputPath)
    $doc.Close()
    $word.Quit()

    #open up my notes
    Invoke-Item $outputPath
}

