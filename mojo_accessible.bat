cd\
d:
cd mojo
set /p Number="Please enter Number: "
set "FileName=D:\Mozilla\accessible\output\MoJo\Mozilla_accessible_NAHCD_%Number%.rsf"

java mojo.MoJo %FileName%  D:\Mozilla\accessible\output\MoJo\Mozilla_accessible.rsf 
java mojo.MoJo %FileName%  D:\Mozilla\accessible\output\MoJo\Mozilla_accessible.rsf -fm
java mojo.MoJo %FileName%  D:\Mozilla\accessible\output\MoJo\Mozilla_accessible.rsf -m+


pause