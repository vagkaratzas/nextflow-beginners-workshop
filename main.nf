include { GUNZIP             } from './modules/nf-core/gunzip/main'
include { FILTER_FASTA       } from './modules/local/filter_fasta/main'
include { EXECUTE_CLUSTERING } from './subworkflows/local/execute_clustering'

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

    ch_filtered_fasta = FILTER_FASTA( ch_fasta_chunk, params.length_threshold )
        .collectFile(name: 'proteins_50K_filtered.fasta')
        .map { filepath ->
            [ [id:"filtered"], filepath ]
        }

    EXECUTE_CLUSTERING( ch_filtered_fasta )
    EXECUTE_CLUSTERING.out.clusters.view()

}
