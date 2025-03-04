/*
    SEQUENCE CLUSTERING
*/

include { MMSEQS_CREATEDB  } from '../../../modules/nf-core/mmseqs/createdb/main'
include { MMSEQS_LINCLUST  } from '../../../modules/nf-core/mmseqs/linclust/main'
include { MMSEQS_CREATETSV } from '../../../modules/nf-core/mmseqs/createtsv/main'

workflow EXECUTE_CLUSTERING {
    take:
    sequences

    main:
    MMSEQS_CREATEDB( sequences )
    MMSEQS_LINCLUST( MMSEQS_CREATEDB.out.db )
    MMSEQS_CREATETSV( MMSEQS_LINCLUST.out.db_cluster, MMSEQS_CREATEDB.out.db, MMSEQS_CREATEDB.out.db )

    emit:
    clusters = MMSEQS_CREATETSV.out.tsv
}
