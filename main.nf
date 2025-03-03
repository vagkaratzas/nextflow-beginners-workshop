include { GUNZIP } from './modules/local/gunzip/main' 

workflow {

    ch_archive = channel.fromPath( params.input, checkIfExists: true  )

    GUNZIP( ch_archive )

    ch_fasta_chunk = GUNZIP.out.splitFasta( by: params.fasta_chunk_size, file: true )
    ch_fasta_chunk.view()

}