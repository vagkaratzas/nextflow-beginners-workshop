#!/usr/bin/env python3
import argparse

def filter_fasta(input_fasta, output_fasta, min_length=100):
    with open(input_fasta, "r") as in_fh, open(output_fasta, "w") as out_fh:
        keep = False
        seq = ""
        header = ""
        
        for line in in_fh:
            if line.startswith(">"):
                if keep and len(seq) >= min_length:
                    out_fh.write(header + seq + "\n")
                header = line
                seq = ""
                keep = True
            else:
                seq += line.strip()
        
        if keep and len(seq) >= min_length:
            out_fh.write(header + seq + "\n")

def main():
    parser = argparse.ArgumentParser(description="Filter FASTA sequences by length.")
    parser.add_argument("--input_fasta", help="Input FASTA file")
    parser.add_argument("--output_fasta", help="Output FASTA file")
    parser.add_argument("--min_length", type=int, default=100, help="Minimum sequence length (default: 100)")
    
    args = parser.parse_args()
    filter_fasta(args.input_fasta, args.output_fasta, args.min_length)

if __name__ == "__main__":
    main()
