include { GUNZIP       } from './modules/local/gunzip/main' 
include { FILTER_FASTA } from './modules/local/filter_fasta/main' 

workflow {

    ch_archive = channel.fromPath( params.input, checkIfExists: true  )

    GUNZIP( ch_archive )

    ch_fasta_chunk = GUNZIP.out.splitFasta( by: params.fasta_chunk_size, file: true )
    ch_filtered_fasta_chunks = FILTER_FASTA( ch_fasta_chunk, params.length_threshold )
    ch_filtered_fasta_chunks.view()

    ch_filtered_fasta = ch_filtered_fasta_chunks.collectFile(name: 'proteins_50K_filtered.fasta')
    ch_filtered_fasta.view()

}