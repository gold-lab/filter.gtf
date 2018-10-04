

#!/usr/bin/perl -w
#use strict;
#use warnings;

# You give it a set of TRANSCRIPT IDs and a GTF and it pulls all matching transcripts out of the GTF

#VERSION2: works for any type of transcript and gene IDs, even not Gencode. They need to be in format(including the ""):
# gene_id "GENE-ID"; transcript_id "TRANSCRIPT-ID";

#VERSION3: remove the requirement for the lines to just be transcript lines; they can be gene and exon lines too

# Give the file a list of IDs (Either gene or transcript) and a GTF, and it returns all transcript entries from GTF from either the gene or the trx

# Be careful: output GTF may have redundant lines

my ($USAGE) = "$0 Input_ID_list_file Input_GTF_file";

unless(scalar @ARGV > 1) {
	print "Usage: $USAGE\n\n";
	exit;	
	}

#Input files

my $filename_ids = $ARGV[0];			
my $filename_gtf = $ARGV[1];

##################################################################################
# Read ID list into array @data

open IDS, "$filename_ids" ; 
my @data = <IDS> ; 
close IDS ;

my $no_ids=scalar(@data);

#print "\n I have $no_ids IDs\n";

##################################################################################
# Read the GTF into array @gtfs

open GTF, "$filename_gtf"; 
my @gtfs = <GTF> ; 
close GTF ;

for my $line (@gtfs){
	chomp $line;

	unless ($line =~/^#/) {

		my @line=split("\t",$line);
#		if ($line[2] eq "transcript"){
			#my ($this_ensg)=$line=~/gene_id \"(ENS.*?\d+)/;
			#my ($this_enst)=$line=~/transcript_id \"(ENS.*?\d+)/;
			my ($this_ensg)=$line=~/gene_id \"(.*?)\"/;
			my ($this_enst)=$line=~/transcript_id \"(.*?)\"/;
			#print "$this_ensg\t$this_enst\t$line\n"; # To check the identificaiton of IDs is correct
			if (grep( /^$this_ensg/, @data ) || grep( /^$this_enst/, @data ) ){
			print "$line\n";}

#}
}
}














