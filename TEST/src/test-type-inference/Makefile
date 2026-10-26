######
#
# Note that
# certain installations require the following changes:
#
# atscc -> patscc
# atsopt -> patsopt
# ATSHOME -> PATSHOME
#
######
#
#
######
#
ATSHOME=$(shell dirname $(shell dirname $(shell readlink $(shell which patscc))))
ATSCC=patscc
ATSOPT=patsopt
#
ATSCCFLAGS=--optflag --chainlam -O2 -DATS_MEMALLOC_LIBC -fPIC -I "../src/" -IATS "../src" ${CFLAGS}
ATSLIBS=
# ATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
# ATSCCFLAGS=-O2 -flto
#
#
######
#

.PHONY: all clean

all: test

cleanall::
#
######
#
# Please uncomment the following three lines and replace the name [foo]
# with the name of the file you want to compile
#

ATS_DATS :=
ATS_DATS += ./DATS/result_vb.dats

ATS_SATS :=
ATS_SATS += ./SATS/result_vb.sats
######
#

ATS_CATS= $(ATS_SATS:.sats=_sats.c) $(ATS_DATS:.dats=_dats.c)
ATS_OBJS= $(ATS_SATS:.sats=_sats.o) $(ATS_DATS:.dats=_dats.o)


test: \
		test-result_vb-dummy \
		test-type-inference-workaround \
		test-type-inference2 \
		test-type-inference3 \
		test-type-inference4 \
		test-type-inference5 \
		test-type-inference6 \
		test-type-inference7 \
		test-type-inference8 \
		test-type-inference9 \
		test-type-inference10 \
		test-type-inference11 \
		test-type-inference12 \
		test-type-inference13 \
		test-type-inference14 \
		test-type-inference15 \
		test-type-inference16 \
		test-type-inference17 \
		test-type-inference18 \
		test-type-inference19 \
		test-type-inference


test-result_vb-dummy: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference-workaround: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference2: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference3: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference4: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference5: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference6: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference7: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference8: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference9: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference10: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference11: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference12: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference13: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference14: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference15: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference16: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference17: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference18: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference19: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inference: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@


#
######
#
# You may find these rules useful
#
%_sats.o: %.sats ; $(ATSCC) $(ATSCCFLAGS) -c -o $@ $< 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
%_dats.o: %.dats ; $(ATSCC) $(ATSCCFLAGS) -c -o $@ $< 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
#
######
#
RMF=rm -f
#
######
#
clean:: ; $(RMF) test*
clean:: ; $(RMF) *~
clean:: ; find -name '*_?ats.o' -exec $(RMF) {} \;
clean:: ; find -name '*_?ats.c' -exec $(RMF) {} \;
clean:: ; find -name '*.a' -exec $(RMF) {} \;
#
cleanall:: clean
#
###### end of [Makefile] ######
