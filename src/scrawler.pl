sub prompt {
 print "Checking @_[0]\n";
}
sub match {
 local($potato,$patt)=@_;
 $upPot=$potato;
 $upPot=~tr/A-Z/a-z/;
 if ($upPot=~/$patt/) {
  push(@names,$potato);
  return 1;
 }
 else {return 0;}
}
sub search {
 local($found)=0;
 local($dName,$patt)=@_;
 opendir(dirHandle,$dName);
 local(@list)=readdir(dirHandle);
 closedir(dirHandle);
 if ($#list==-1) {
  chop($dName);
  return match($dName,$patt);
 }
 prompt($dName);
 foreach $eintrag (@list) {
  if (($eintrag ne '.') && ($eintrag ne '..')) {
   $found+=search($dName.$eintrag.'\\',$patt);
  }
 }
 return $found;
}
($rootDir,$pattern)=@ARGV;
if (length($rootDir)>3) {$rootDir.='\\';}
$total=search($rootDir,$pattern);
print "\n$total Results:\n";
$ypos=0;
foreach $name (@names) {
 if ($ypos==24) {
  $ypos=0;
  $wait=<stdin>;
 }
 $ypos++;
 print "$name\n";
}
