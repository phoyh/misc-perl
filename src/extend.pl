$dir=shift(@ARGV);
$dest=shift(@ARGV);
$destbatch=shift(@ARGV);
opendir(dirhandle,$dir);
@files=readdir(dirhandle);
closedir(dirhandle);
open(desthandle,'>'.$destbatch);
foreach $file (@files) {
 if (($file ne '.') && ($file ne '..')) {print desthandle "copy ".$dir."\\".$file." ".$dest."\\".$file.".prg\n";}
}
close(desthandle);
