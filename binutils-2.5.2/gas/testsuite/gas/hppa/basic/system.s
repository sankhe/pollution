	.SPACE $PRIVATE$
	.SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=31
	.SUBSPA $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
	.SPACE $TEXT$
	.SUBSPA $LIT$,QUAD=0,ALIGN=8,ACCESS=44
	.SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY

	.SPACE $TEXT$
	.SUBSPA $CODE$

	.align 4
; Basic immediate instruction tests.  
;
; We could/should test some of the corner cases for register and 
; immediate fields.  We should also check the assorted field
; selectors to make sure they're handled correctly.
	break 5,12
	rfi
	rfir
	ssm 5,%r4
	rsm 5,%r4
	mtsm %r4
	ldsid (%sr0,%r5),%r4
	mtsp %r4,%sr0
	mtctl %r4,%cr10
	mfsp %sr0,%r4
	mfctl %cr10,%r4
	sync
	diag 1234

	prober (%sr0,%r5),%r6,%r7
	proberi (%sr0,%r5),1,%r7
	probew (%sr0,%r5),%r6,%r7
	probewi (%sr0,%r5),1,%r7
	
	lpa %r4(%sr0,%r5),%r6
	lpa,m %r4(%sr0,%r5),%r6
	lha %r4(%sr0,%r5),%r6
	lha,m %r4(%sr0,%r5),%r6

	idtlba %r4,(%sr0,%r5)
	iitlba %r4,(%sr0,%r5)
	idtlbp %r4,(%sr0,%r5)
	iitlbp %r4,(%sr0,%r5)
