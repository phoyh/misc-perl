for ($i=0;$i<3;$i++) {print "\n";}
print "Welcome to the XiaoShuo-Script!\n\n";
print "Files' directory (if not specified, it will be h:\\xs):\n   ";
$dir=<stdin>;
if ($dir eq "\n") {$dir='h:\\xs';}
$dir=~s/\n//;
$tempdir=$dir.'BUF';
print "\nFont size (14 by default): ";
$fontsize=int(<stdin>);
if ($fontsize==0) {$fontsize=14;}
print "\nDestination file (h:\\xiaoshuo.ps by default):\n   ";
$dest=<stdin>;
if ($dest eq "\n") {$dest='h:\\xiaoshuo.ps';}
$dest=~s/\n//;
@coms[0]='prompt';
@coms[1]="perl totext.pl $dir $tempdir";
@coms[2]="perl toCnW.pl $fontsize $tempdir";
@coms[3]="perl collect.pl $tempdir \\w.gb collect.gb";
@coms[4]="cd Viewer\\CnPrint";
@coms[5]="cnprint -m -w -gb -h20 -o=$dest -f=cnf56.hbf $tempdir\\collect.gb";
@coms[6]="del $tempdir";
@coms[7]="rmdir $tempdir";
open(bathandle,'>c:\\windows\\temp\\rmrb.bat');
foreach $line (@coms) {
 print bathandle "$line\n";
}
close bathandle;
exec('c:\\windows\\temp\\rmrb.bat');
