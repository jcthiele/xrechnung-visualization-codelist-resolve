powershell -command "iwr -OutFile .\src\ICD-5.xml -Uri https://www.xrepository.de/api/xrepository/urn:xoev-de:kosit:codeliste:icd_5:technischerBestandteilGenericode"

java -jar .\lib\saxon-he-11.4.jar -s:.\src\ICD-5.xml -xsl:.\src\genericode2xsltemplate_param.xsl -o:.\src\6523.xsl code=code name=scheme-name

powershell -command "iwr -OutFile .\src\UNECE-RE-21-3.xml -Uri https://www.xrepository.de/api/xrepository/urn:xoev-de:kosit:codeliste:rec21_3:technischerBestandteilGenericode"

java -jar .\lib\saxon-he-11.4.jar -s:.\src\UNECE-RE-21-3.xml -xsl:.\src\genericode2xsltemplate_param.xsl -o:.\src\UNECE-RE-21.xsl code=code name=name

