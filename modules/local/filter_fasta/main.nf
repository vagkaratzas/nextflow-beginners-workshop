process FILTER_FASTA {
    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://community-cr-prod.seqera.io/docker/registry/v2/blobs/sha256/31/313e1c18a344323886cf97a151ab66d81c1a146fb129558cb9382b69a72d5532/data' :
        'community.wave.seqera.io/library/python:b1b4b1f458c605bb' }"
        
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
