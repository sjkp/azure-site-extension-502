WHERE msbuild 
IF %ERRORLEVEL% NEQ 0 SET PATH=%PATH%;"C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\"

WHERE msbuild 
IF %ERRORLEVEL% NEQ 0 SET PATH=%PATH%;"C:\Program Files (x86)\MSBuild\14.0\bin\"
 


msbuild /version


nuget restore WebApplication3.sln

RMDIR /S /Q artifacts
md artifacts

msbuild WebApplication3\WebApplication3.csproj /t:pipelinePreDeployCopyAllFilesToOneFolder /p:_PackageTempDir="..\artifacts";AutoParameterizationWebConfigConnectionStrings=false;Configuration=Release;SolutionDir="."


nuget pack letsencrypt.nuspec
