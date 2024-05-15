function Select-Folder($message='Select a folder', $path = 0) { 
    $object = New-Object -comObject Shell.Application  
     
    $folder = $object.BrowseForFolder(0, $message, 0, $path) 
    if ($folder -ne $null) { 
        $folder.self.Path 
    } 
} 

$RootDirectory = Select-Folder -mess 'Select some folder!' -path "D:\Yang\Dropbox\RES-Projects\2015-09-15 Data Entry"

cd $RootDirectory

#Collect all questionaries across a wide range of folders STARTING with 0XX_XXXX
$DestinationFolders = Get-ChildItem -Directory -Include 0* -Name

#Keep count of the collections.
$DestinationFoldersCount = $DestinationFolders | Measure-Object -Line

#Create a new folder
$DestinationFoldersTime = Get-Date -UFormat "%Y-%m-%d_T%H%M%S"

$DestinationFoldersName = $DestinationFoldersTime + "_Export_"+ $DestinationFoldersCount.Lines + "_Subjects"

#Date_Clinical_Questionaries_39Subjects_
mkdir $DestinationFoldersName

cd $DestinationFoldersName

#Create the questionnaire folders
$QuestionaireList = "BDHI", "BDI", "BISII", "FISER_GRSEB","Hayling","MCTQ","MMSE","NeuroPsych","Questionnaire","SCID_IIQ","SSI","SIS","Verbal Fluency","WHOQOL"
mkdir $QuestionaireList 

cd $RootDirectory    

#For each questionnaire type
for ($i=0; $i -le ($QuestionaireList.Count); $i++){   

    cd $RootDirectory    

    for ($FolderIndex=0; $FolderIndex -le ($DestinationFolders.Count-1);$FolderIndex++){
        
        cd $RootDirectory    
    
        #Go to the destination folder. 
        cd $DestinationFolders[$FolderIndex]

        #Process the file                
        if ($QuestionaireList[$i] -eq "Hayling"){
            Copy-Item ("0??-"+($QuestionaireList[$i])+".xlsx") ($RootDirectory.ToString()+"\"+$DestinationFoldersName+"\"+$QuestionaireList[$i])
        } else {
            Copy-Item ("0??-"+($QuestionaireList[$i])+".pdf") ($RootDirectory.ToString()+"\"+$DestinationFoldersName+"\"+$QuestionaireList[$i])
        }      

        ls -File -Include ("0??-"+($QuestionaireList[$i])+".pdf") -Name

    }
   
}


