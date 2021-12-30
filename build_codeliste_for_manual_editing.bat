powershell -command "iwr -OutFile .\src\ICD-3.xml -Uri https://www.xrepository.de/api/xrepository/urn:xoev-de:kosit:codeliste:icd_3:technischerBestandteilGenericode:datei:ICD-3.xml"

java -jar .\lib\saxon-he-10.6.jar -s:.\src\ICD-3.xml -xsl:.\src\genericode2xsltemplate_param.xsl -o:.\src\6523.xsl code=code name=scheme-name

powershell -command "iwr -OutFile .\src\UNECE-RE-21-2.xml -Uri https://www.xrepository.de/api/xrepository/urn:xoev-de:kosit:codeliste:rec21_2:technischerBestandteilGenericode:datei:UN_ECE_Recommendation_N_21-2.xml"

java -jar .\lib\saxon-he-10.6.jar -s:.\src\UNECE-RE-21-2.xml -xsl:.\src\genericode2xsltemplate_param.xsl -o:.\src\UNECE-RE-21.xsl code=code name=name

