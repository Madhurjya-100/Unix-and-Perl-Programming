#!/usr/bin/perl
#Madhurjya Kakoti_MBI18001
#16th Nov 2021
#printing the name of sequence where the pattern "III" is situated in the given amino acid sequence saved in a fasta file.

#opening the fasta file of amino acid sequence
open FILE, "uniprot-proteome_UP000001016.fasta" or die "error $!";
#creating a output file
open FI, "> pb_p4_out.txt" or die "error $!";
chomp(my @protein=<FILE>);
my $amino_acid = join("", @protein);
my @sequence = split('>', $amino_acid);
shift (@sequence);
for($i=0;$i<=scalar(@sequence);$i++)
{
  my @codon = split('SV=1',$sequence[$i]);
  if ($codon[1]=~m/III/){print FI "Name of the sequence: $codon[0]\n";}
}

close (FI);
