for ($i=0;$i<3;$i++) {print "\n";}
print "Welcome to the BaoZhi-Script!\n\n";
print "Files' directory (if not specified, it will be desktop\\rmrb):\n   ";
$dir=<stdin>;
if ($dir eq "\n") {$dir='rmrb';}
$tempdir=$dir.'BUF';
print "\nFont size (13 by default): ";
$fontsize=int(<stdin>);
if ($fontsize==0) {$fontsize=13;}
print "\nDestination file (desktop\\baozhi.ps by default):\n   ";
$dest=<stdin>;
if ($dest eq "\n") {$dest='baozhi.ps';}
@coms[0]='prompt';
@coms[1]="perl totext.pl $dir $tempdir";
@coms[2]="perl toCn.pl $fontsize $tempdir";
@coms[3]="perl collect.pl $tempdir \\w.gb collect.gb";
@coms[4]="cd Viewer\\CnPrint";
@coms[5]="cnprint -m -w -gb -h20 -o=$dest -f=cnk48.hbf $tempdir\\collect.gb";
@coms[6]="del $tempdir";
@coms[7]="rmdir $tempdir";
open(bathandle,'>c:\\windows\\temp\\rmrb.bat');
foreach $line (@coms) {
 print bathandle "$line\n";
}
close bathandle;
exec('c:\\windows\\temp\\rmrb.bat');
