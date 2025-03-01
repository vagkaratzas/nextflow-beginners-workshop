process GUNZIP {
    input:
    path archive

    output:
    path "${uncompressed_name}"

    script:
    uncompressed_name = archive.toString() - '.gz'
    """
    gunzip -c ${archive} > ${uncompressed_name}
    """
}

workflow {

    ch_archive = channel.fromPath( 'proteins_50K.fasta.gz', checkIfExists: true  )
    ch_archive.view()

    GUNZIP( ch_archive )
    GUNZIP.out.view()

}