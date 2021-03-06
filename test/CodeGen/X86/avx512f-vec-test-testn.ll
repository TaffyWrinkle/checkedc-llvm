; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512f | FileCheck %s

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm512_test_epi64_mask(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_test_epi64_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp ne <8 x i64> %and.i.i, zeroinitializer
  %1 = bitcast <8 x i1> %0 to i8
  ret i8 %1
}

; Similar to the above, but the compare is reversed to have the zeros on the LHS
define zeroext i8 @TEST_mm512_test_epi64_mask_2(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_test_epi64_mask_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp ne <8 x i64> zeroinitializer, %and.i.i
  %1 = bitcast <8 x i1> %0 to i8
  ret i8 %1
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm512_test_epi32_mask(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_test_epi32_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestmd %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = bitcast <8 x i64> %and.i.i to <16 x i32>
  %1 = icmp ne <16 x i32> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm512_mask_test_epi64_mask(i8 %__U, <8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_mask_test_epi64_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    andb %dil, %al
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp ne <8 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = and <8 x i1> %0, %1
  %3 = bitcast <8 x i1> %2 to i8
  ret i8 %3
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm512_mask_test_epi32_mask(i16 %__U, <8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_mask_test_epi32_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestmd %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    andl %edi, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = bitcast <8 x i64> %and.i.i to <16 x i32>
  %1 = icmp ne <16 x i32> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm512_testn_epi64_mask(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_testn_epi64_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestnmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp eq <8 x i64> %and.i.i, zeroinitializer
  %1 = bitcast <8 x i1> %0 to i8
  ret i8 %1
}

; Similar to the above, but the compare is reversed to have the zeros on the LHS
define zeroext i8 @TEST_mm512_testn_epi64_mask_2(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_testn_epi64_mask_2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestnmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp eq <8 x i64> zeroinitializer, %and.i.i
  %1 = bitcast <8 x i1> %0 to i8
  ret i8 %1
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm512_testn_epi32_mask(<8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_testn_epi32_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestnmd %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = bitcast <8 x i64> %and.i.i to <16 x i32>
  %1 = icmp eq <16 x i32> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm512_mask_testn_epi64_mask(i8 %__U, <8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_mask_testn_epi64_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestnmq %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    andb %dil, %al
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = icmp eq <8 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = and <8 x i1> %0, %1
  %3 = bitcast <8 x i1> %2 to i8
  ret i8 %3
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm512_mask_testn_epi32_mask(i16 %__U, <8 x i64> %__A, <8 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm512_mask_testn_epi32_mask:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vptestnmd %zmm0, %zmm1, %k0
; CHECK-NEXT:    kmovw %k0, %eax
; CHECK-NEXT:    andl %edi, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <8 x i64> %__B, %__A
  %0 = bitcast <8 x i64> %and.i.i to <16 x i32>
  %1 = icmp eq <16 x i32> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

