workflow {
    ch_proteins = channel.fromPath( 'proteins_50K.fasta', checkIfExists: true  )
    ch_proteins.view()
}