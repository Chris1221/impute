#!/usr/bin/perl -w

$file = $ARGV[0];
$chr = $ARGV[1];

open(FILE,"<$file") || die;

while(<FILE>) {
    chomp($_);
    ($CHR,$SNP,$ZERO,$POS) = split;
    $ZERO = "0";
    if ($SNP =~ "---") {
        $SNP = "$chr:$POS";
        if (exists $snp_hash{$SNP}) {
            $snp_hash{$SNP}++;
            $SNP = $SNP . '.' . $snp_hash{$SNP};
        }
    } else {
         if (exists $snp_hash{$SNP}) {
             $snp_hash{$SNP}++;
             $newSNP = $SNP . '.' . $snp_hash{$SNP};
             $SNP = $newSNP;
         }
    }
    $snp_hash{$SNP}++;
    print "$chr\t$SNP\t$ZERO\t$POS\n";
}