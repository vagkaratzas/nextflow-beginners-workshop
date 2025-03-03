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
