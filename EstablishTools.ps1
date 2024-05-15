#This script will ask for USER name input and then automatically generate the files by copying from template folder.
#By Yang Ding
#On 2014-10-05 

#=============================
#Configurations:
$TemplateFolder = "C:\Users\RA\Dropbox\Outils\Questionnaires\eForms"
$DestinationFolder = "C:\Users\RA\Dropbox\Study82" 
#=============================

#Get subject ID
$SubjectID = Read-Host 'Please enter Subject ID'

#Get Timestamp
$DateTimeStamp = get-date -format "yyyy-MM-dd_HH-mm"

#Combine them to form new folder name.
$FolderName =$SubjectID + "_" + $DateTimeStamp 



#Get Language Choice:
do {
	do {
	write-host ""
	write-host "Please Choose Language Version:"
	write-host "English: 1"
	write-host "French: 2"
	write-host ""
	write-host "EXIT: x"
	write-host "Type your choice and press Enter"

	$choice = read-host
	write-host ""
	$ok = $choice -match '^[12x]+$' 
	if (-not $ok){write-host "Invalid selection"}
	}
	until($ok)


	
	switch -Regex($choice){
		"1"
        {
			#Make DIR at destination folder
            cd $DestinationFolder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName"

            write-host "ENGLISH"
            #Make a list of all PDF at source folder
            
            #Note which language
            $strLanguage = "Anglais" 
            
			#########################################################
            #Note which type of questionnaires           
            $strQuestionaire = "2.Questionnaires"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strQuestionaire
            
            #List all PDF files
            $SourceQPDFs = ls $Template -filter *.pdf

            #Make new direcotry:
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strQuestionaire"
            
            
            #Copy them all 
            foreach ($TargetFile in $SourceQPDFs){
                copy $TemplateFolder\$strLanguage\$strQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strQuestionaire\$SubjectID-$TargetFile
            }
            
			#########################################################
            #Note which type of questionnaires 
			$strSelfQuestionaire = "3.SelfQuestionnaires"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strSelfQuestionaire

            #List all PDF files
            $SourceSQPDFs = ls $Template -filter *.pdf
            
            #Create the new folder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strSelfQuestionaire"
            
            foreach ($TargetFile in $SourceSQPDFs){
                copy $TemplateFolder\$strLanguage\$strSelfQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strSelfQuestionaire\$SubjectID-$TargetFile
            }
			
			#########################################################
			#Note which type of questionnaires           
            $strQuestionaire = "4.MRI"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strQuestionaire
            
            #List all PDF files
            $SourceQPDFs = ls $Template -filter *.pdf

            #Make new direcotry:
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strQuestionaire"
            
            
            #Copy them all 
            foreach ($TargetFile in $SourceQPDFs){
                copy $TemplateFolder\$strLanguage\$strQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strQuestionaire\$SubjectID-$TargetFile
            }
			
			#########################################################
			#Note which type of questionnaires           
            $strQuestionaire = "1.Neuropsyc"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strQuestionaire
            
            #List all PDF files
            $SourceQPDFs = ls $Template -filter *.pdf

            #Make new direcotry:
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strQuestionaire"
            
            
            #Copy them all 
            foreach ($TargetFile in $SourceQPDFs){
                copy $TemplateFolder\$strLanguage\$strQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strQuestionaire\$SubjectID-$TargetFile
            }

            #Set the exit flag. 
            $choice = "x"
                               
		}
		"2"
        {
			#Make DIR at destination folder
            cd $DestinationFolder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName"

			write-host "French"
            #Note which language
            $strLanguage = "Francais" 
            
			#########################################################
            #Note which type of questionnaires           
            $strQuestionaire = "2.Heteroquestionnaires"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strQuestionaire
            
            #List all PDF files
            $SourceQPDFs = ls $Template -filter *.pdf
            
            #Create the new folder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strQuestionaire"

            #Copy them all 
            foreach ($TargetFile in $SourceQPDFs){
                copy $TemplateFolder\$strLanguage\$strQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strQuestionaire\$SubjectID-$TargetFile
            }
            
			#########################################################
			#Note which type of questionnaires 
            $strSelfQuestionaire = "3.Autoquestionnaires"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strSelfQuestionaire

                        #List all PDF files
            $SourceSQPDFs = ls $Template -filter *.pdf
            
            #Create the new folder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strSelfQuestionaire"

            foreach ($TargetFile in $SourceSQPDFs){
                copy $TemplateFolder\$strLanguage\$strSelfQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strSelfQuestionaire\$SubjectID-$TargetFile
            }    
			
			#########################################################
			#Note which type of questionnaires 
            $strSelfQuestionaire = "4.IRM"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strSelfQuestionaire

			#List all PDF files
            $SourceSQPDFs = ls $Template -filter *.pdf
            
            #Create the new folder
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strSelfQuestionaire"

            foreach ($TargetFile in $SourceSQPDFs){
                copy $TemplateFolder\$strLanguage\$strSelfQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strSelfQuestionaire\$SubjectID-$TargetFile
            }    
			
			#########################################################
			#Note which type of questionnaires           
            $strQuestionaire = "1.Neuropsyc"

            #Enter into proper type
            cd $TemplateFolder\$strLanguage\$strQuestionaire
            
            #List all PDF files
            $SourceQPDFs = ls $Template -filter *.pdf

            #Make new direcotry:
            New-Item -ItemType Directory "$DestinationFolder\$FolderName\$strQuestionaire"
            
            
            #Copy them all 
            foreach ($TargetFile in $SourceQPDFs){
                copy $TemplateFolder\$strLanguage\$strQuestionaire\$TargetFile $DestinationFolder\$FolderName\$strQuestionaire\$SubjectID-$TargetFile
            }

                       
            #Set the exit flag. 
            $choice = "x"
		}
	}
}until($choice -eq "x") 


#Invoke Explorer to show user the current locations:
ii $DestinationFolder\$FolderName