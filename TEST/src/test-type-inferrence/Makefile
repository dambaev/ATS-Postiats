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
ATSCCFLAGS=-O2 -DATS_MEMALLOC_LIBC -fPIC -I "../src/" -IATS "../src" ${CFLAGS}
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
		test-type-inferrence-workaround \
		test-type-inferrence2 \
		test-type-inferrence3 \
		test-type-inferrence4 \
		test-type-inferrence5 \
		test-type-inferrence


test-result_vb-dummy: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence-workaround: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence2: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence3: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence4: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence5: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence6: $(ATS_OBJS)
	$(ATSCC) $(ATSCCFLAGS) -o $@ ./DATS/$@.dats $(ATSLIBS) 2>&1 | sed  's/ [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)) -- [0-9]*(line=\([0-9]*\), offs=\([0-9]*\)):/\1:\2:\3:\4/'
	./$@

test-type-inferrence: $(ATS_OBJS)
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
