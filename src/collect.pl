# collects all files specified
# syntax: perl collect.pl <folder> <reg.expression of files> <dest.file>

$dir=shift(@ARGV);
$reg=shift(@ARGV);
$dest=shift(@ARGV);
opendir(dirhandle,$dir);
@files=readdir(dirhandle);
closedir(dirhandle);
open(desthandle,'>'.$dir.'\\'.$dest);
print "Collecting to $dest:\n";
foreach $file (@files) {
 if ($file=~m/$reg/) {
  print "$file + ";
  open(filehandle,$dir.'\\'.$file);
  $contenu='';
  while (not eof(filehandle)) {
   $contenu.=getc(filehandle);
  }
  close(filehandle);
  print desthandle $contenu;
 }
}
close(desthandle);