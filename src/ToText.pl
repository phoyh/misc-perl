$dir=@ARGV[0];
$destdir=@ARGV[1];
mkdir($destdir,755);
opendir(dirhandle,$dir);
@files=readdir(dirhandle);
closedir(dirhandle);
foreach $file (@files) {
 if ($file=~'.htm') {
  print "$file";
  open(filehandle,$dir.'\\'.$file);
  $contenu='';
  while (not eof(filehandle)) {
   $contenu.=getc(filehandle);
  }
  close(filehandle);
  $_=$contenu;
  @field=split;
  $contenu="";
  foreach $line (@field) {
   $line=~s/<br>//g;
   if (($line!~'\w') && ($line!~'>') && ($line!~'<') && ($line!~"=") && ($line!~'"') && ($line!~'{') && ($line!~":") && ($line!~'}') && ($line!~'#')) {
    $contenu.=$line;
   }
  }
  $text=$file;
  for ($i=0;$i<4;$i++) {
   chop($text);
  }
  $text.='.txt';
  open(filehandle,'>'.$destdir.'\\'.$text);
  print filehandle $contenu;
  close(filehandle);
  print " - converted to $text\n";
 }
}
