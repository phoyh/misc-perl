sub verify {
 local($w)=@_;
 $flag=($word=~/[u-z]/);
 return $flag;
}

open(filehandle,'c:\unbenannt.txt');
while ($line=<filehandle>) {
 @words=split(/\W*\s+\W*/,$line);
 for $word (@words) {
  if (verify($word)) {
   $list{$word}++;
  }
 }
}
close(filehandle);
$i=0;
foreach $word (sort %list) {
 print "$list{$word} $word\n";
 $i++;
 if ($i==20) {
  $in=<stdin>;
  $i=0;
 }
}