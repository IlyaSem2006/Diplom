@echo off
set DITA_DIR=..\tools\dita-ot.ktk\
set ANT_OPTS=-Xmx2g %ANT_OPTS%
set ANT_OPTS=%ANT_OPTS% -Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl
set ANT_OPTS=%ANT_OPTS% -Dfile.encoding=UTF-8
set ANT_HOME=%DITA_DIR%
set PATH=%DITA_DIR%bin;%PATH%
call %DITA_DIR%set_classpath.bat 
set CLASSPATH=%DITA_DIR%lib\org.apache.xml.resolver_1.2.0.v20230928-1222.jar;%CLASSPATH%

rem set classpath
rem call ant -l ../tmp/log.txt %1
call ant %1
