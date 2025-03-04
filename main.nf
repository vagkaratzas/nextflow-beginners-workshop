include { GUNZIP       } from './modules/nf-core/gunzip/main'
include { FILTER_FASTA } from './modules/local/filter_fasta/main' 

workflow {

    ch_archive = channel.fromPath( params.input, checkIfExists: true  )
        .map { filepath ->
            [ [id:"input"], filepath ]
        }
    GUNZIP( ch_archive )

    ch_fasta_chunk = GUNZIP.out.gunzip
        .map { meta, filepath ->
            filepath.splitFasta( by: params.fasta_chunk_size, file: true )
        }
        .flatten()

    ch_filtered_fasta_chunks = FILTER_FASTA( ch_fasta_chunk, params.length_threshold )
    ch_filtered_fasta_chunks.view()

    ch_filtered_fasta = ch_filtered_fasta_chunks.collectFile(name: 'proteins_50K_filtered.fasta')
    ch_filtered_fasta.view()

}