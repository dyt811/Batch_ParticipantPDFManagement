#This script will ask for USER name input and then automatically generate the files by copying from template folder.
#By Yang Ding
#On 2014-10-05 


#=============================
#Configurations:
$TemplateFolder = "D:\Yang\Dropbox\RES-Projects\2015-09-15 Data Entry\Clinical Questionnaires"
$DestinationFolder = "D:\Yang\Dropbox\RES-Projects\2015-09-15 Data Entry\" 
#=============================

#Get subject ID
$SubjectID = Read-Host 'Please enter Subject ID'

#Get Timestampe
$DateTimeStamp = Read-Host 'Please Enter Consent Date'

#Combine them to form new folder name.
$FolderName =$SubjectID + "_" + $DateTimeStamp 

#Make DIR at destination folder
cd $DestinationFolder
New-Item -ItemType Directory "$DestinationFolder\$FolderName"

#Make a list of all PDF at source folder
cd $TemplateFolder
$SourcePDFs = ls $Template

#Copy all PDFs from the source folder.
foreach ($TargetFile in $SourcePDFs){
    #copy $TemplateFolder\$TargetFile $DestinationFolder\$FolderName\$SubjectID-$TargetFile
    Copy-Item $TemplateFolder\$TargetFile $DestinationFolder\$FolderName\$SubjectID-$TargetFile -PassThru | Set-ItemProperty -name isreadonly -Value $false
    }

#Invoke Explorer to show user the current locations:
ii $DestinationFolder\$FolderName