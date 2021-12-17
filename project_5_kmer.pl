#!/usr/bin/perl
#Project 5

open FILE, "intron_IME_data.fasta" or die "error $!";
open OUT, "> project5_output.txt" or die "error $!";
chomp(my @intron=<FILE>);
my $seq=join("", @intron);
my @seq = split(">", $seq);
shift(@seq);

for($i=0;$i<=scalar(@seq);$i++)
{
if (@seq[$i]=~m/i1_/){push(@early, @seq[$i]);}
elsif (@seq[$i]=~m/i2_/){push(@late, @seq[$i]);}
}

#For early intron
for($i=0;$i<=scalar(@early);$i++)
{
  @sequence = split('CDS|5UTR|3UTR',$early[$i]);
 push(@tog,$sequence[1]);
}

$nuc=join("",@tog);
for ($n=0;$n<=length($nuc)-3;$n++)
{
$str=substr($nuc,$n,3);
push (@str,$str);
}

#For late intron
for($i=0;$i<=scalar(@late);$i++)
{
@Lt = split('CDS|5UTR|3UTR',$late[$i]);
push(@toglt,$Lt[1]);
}

$nuclt=join("",@toglt);
for ($n=0;$n<=length($nuclt)-3;$n++)
{
$string=substr($nuclt,$n,3);
push (@strings,$string);
}

foreach $str(@str){$count1{$str}++;}
foreach $str(@strings){$count2{$str}++;}
print OUT "k-mer"."  \t"."i1"." \t "."Not_i1"." \t "."Odds"."  \t"."Log odds"."\n";
foreach $str(sort keys %count1,sort keys %count2){print OUT $str ." \t ". $count1{$str}."  \t". $count2{$str}."  \t",sprintf ("%.3f",($count1{$str}/$count2{$str})). "  \t",
sprintf ("%.3f", log($count1{$str}/$count2{$str})/log(2))."\n";}


close (FILE);
close (OUT);
