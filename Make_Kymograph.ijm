macro "MakeKymograph [g]" {
	
nRoiCount = roiManager("count");
if(nRoiCount==0) {
     exit("OPPs, Empty ROI Manager");
}

//You can change the default vedio name by changing the line below
StackName=getString("Type in your vedio name","Experiment-2429.czi");

//You can change the default saving path by changing the line below
SavingPath=getString("Type in your saving path","C:\\Users\\gaoyuan\\Desktop\\Yuan QB 1265 Gliding");

Bool=getString("Do you need PNG files as well?(Type in 'Y' or 'N')",'Y');

//Without the following line, this program will report an error for some unknown reasons
newImage("K.tif", "8-bit black", 400, 400, 1);
	
	for(i=0;i<nRoiCount;i++){
	selectWindow(StackName);
	roiManager("Select", i);
	selectWindow(StackName);
	run("Reslice [/]...", "output=1.000 start=Top avoid");
	run("Save", "save=["+SavingPath+"\\"+'('+StackName+')'+'k'+(i+1)+".tif]");
	if(Bool=='Y')
		saveAs("PNG", SavingPath+"\\"+'('+StackName+')'+'k'+(i+1)+".png]");
	close();
}
	selectWindow("K.tif");
    close();
OutPutTIF=" "+nRoiCount+" TIF Files are Generated";
OutPutPNG=" "+nRoiCount+" PNG Files are Generated";
if(Bool=='Y')
	exit(OutPutTIF+'\n'+OutPutPNG);
exit(OutPutTIF);
}
