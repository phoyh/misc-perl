$fontsize=@ARGV[0];
$dir=@ARGV[1];
opendir(dirhandle,$dir);
@files=readdir(dirhandle);
closedir(dirhandle);
foreach $file (@files) {
 if ($file=~'.txt') {
  print "$file";
  open(filehandle,$dir.'\\'.$file);
  $contenu='';
  while (not eof(filehandle)) {
   $contenu.=getc(filehandle);
  }
  close(filehandle);
  $_=$contenu;
  @field=split;
  $contenu="@[$fontsize]";
  $maxlen=0;
  foreach $seg (@field) {
   if ($maxlen<length($seg)) {$maxlen=length($seg);}
  }
  foreach $seg (@field) {
   $seg=~s/¡¡//g;
   $contenu.=$seg;
   if (length($seg)<$maxlen-4) {$contenu.="\t\n";}
  }
  $text=$file;
  for ($i=0;$i<4;$i++) {
   chop($text);
  }
  $text.='.gb';
  open(filehandle,'>'.$dir.'\\'.$text);
  print filehandle $contenu;
  close(filehandle);
  print " - converted to $text\n";
 }
}
