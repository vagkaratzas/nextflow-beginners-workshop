process FILTER_FASTA {
    input:
    path fasta
    val length_threshold

    output:
    path "${output_name}"

    script:
    output_name = fasta.getBaseName() + '_filtered.' + fasta.getExtension()
    """
    filter_fasta.py \\
        --input_fasta ${fasta} \\
        --output_fasta ${output_name} \\
        --min_length ${length_threshold}
    """
}
