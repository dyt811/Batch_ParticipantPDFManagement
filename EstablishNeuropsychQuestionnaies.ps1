#This script will ask for USER name input and then automatically generate the files by copying from template folder.
#By Yang Ding
#On 2014-10-05 


#=============================
#Configurations:
$TemplateFolder = "C:\Users\RA\Dropbox\Recherche_Neuropsychologie"
$DestinationFolder = "C:\Users\RA\Dropbox\Study54-NeuroPsych" 
#=============================

#Get subject ID
$SubjectID = Read-Host 'Please enter Subject ID'

#Get Timestampe
$DateTimeStamp = get-date -format "yyyy-MM-dd_HH-mm"

#Combine them to form new folder name.
$FolderName =$SubjectID + "_" + $DateTimeStamp 

#Make DIR at destination folder
cd $DestinationFolder
New-Item -ItemType Directory "$DestinationFolder\$FolderName"

#Make a list of all PDF at source folder
cd $TemplateFolder
$SourcePDFs = ls $Template -filter *.pdf

#Copy all PDFs from the source folder.
foreach ($TargetFile in $SourcePDFs){
    copy $TemplateFolder\$TargetFile $DestinationFolder\$FolderName\$SubjectID-$TargetFile
    }

#Invoke Explorer to show user the current locations:
ii $DestinationFolder\$FolderName