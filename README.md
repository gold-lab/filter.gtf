# filter.gtf

# You give it a set of TRANSCRIPT IDs and a GTF and it pulls all matching transcripts out of the GTF

#VERSION2: works for any type of transcript and gene IDs, even not Gencode. They need to be in format(including the ""):
# gene_id "GENE-ID"; transcript_id "TRANSCRIPT-ID";

#VERSION3: remove the requirement for the lines to just be transcript lines; they can be gene and exon lines too

# Give the file a list of IDs (Either gene or transcript) and a GTF, and it returns all transcript entries from GTF from either the gene or the trx

# Be careful: output GTF may have redundant lines
