$templateFilePath = "armTemplateWinSIG.json"

Invoke-WebRequest `
   -Uri "https://raw.githubusercontent.com/azure/azvmimagebuilder/master/quickquickstarts/1_Creating_a_Custom_Win_Shared_Image_Gallery_Image/armTemplateWinSIG.json" `
   -OutFile $templateFilePath `
   -UseBasicParsing
