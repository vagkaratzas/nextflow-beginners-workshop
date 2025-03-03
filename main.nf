include { GUNZIP } from './modules/local/gunzip/main' 

workflow {

    ch_archive = channel.fromPath( params.input, checkIfExists: true  )
    ch_archive.view()

    GUNZIP( ch_archive )
    GUNZIP.out.view()

}