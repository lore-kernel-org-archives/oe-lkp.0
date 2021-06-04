Content-Type: multipart/mixed; boundary="===============0658597109248841155=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Fri, 04 Jun 2021 16:37:53 +0800
Message-ID: <2a1977e1-4fd1-065a-214f-51c6b40cc3d2@linux.intel.com>
In-Reply-To: <CAHk-=whTEC_GVYu=WfvUagNvHdoTALEDg8uqK3V6aMDwg2KMRA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0658597109248841155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 5/25/2021 11:11 AM, Linus Torvalds wrote:
> On Mon, May 24, 2021 at 5:00 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
>> FYI, we noticed a -9.2% regression of will-it-scale.per_thread_ops due t=
o commit:
>> commit: 57efa1fe5957694fa541c9062de0a127f0b9acb0 ("mm/gup: prevent gup_f=
ast from racing with COW during fork")
> Hmm. This looks like one of those "random fluctuations" things.
>
> It would be good to hear if other test-cases also bisect to the same
> thing, but this report already says:
>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>>
>> +------------------+----------------------------------------------------=
-----------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.7% im=
provement                    |
> which does kind of reinforce that "this benchmark gives unstable numbers".
>
> The perf data doesn't even mention any of the GUP paths, and on the
> pure fork path the biggest impact would be:
>
>   (a) maybe "struct mm_struct" changed in size or had a different cache l=
ayout
I move "write_protect_seq" to the tail of the "struct mm_struct", the =

regression reduced to -3.6%. The regression should relate to the cache =

layout.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gover=
nor/ucode:
lkp-icl-2sp1/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/=
gcc-9/50%/thread/mmap1/performance/0xb000280

commit:
 =C2=A0 c28b1fc70390df32e29991eedd52bd86e7aba080
 =C2=A0 57efa1fe5957694fa541c9062de0a127f0b9acb0
 =C2=A0 f6a9c27882d51ff551e15522992d3725c342372d=C2=A0 (the test patch)

c28b1fc70390df32 57efa1fe5957694fa541c9062de f6a9c27882d51ff551e15522992
---------------- --------------------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=
=A0=C2=A0=C2=A0=C2=A0 %change %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
 =C2=A0=C2=A0=C2=A0 341938=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0 311218 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -3.6% 329513=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =

will-it-scale.48.threads
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7123=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6483 =
=C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -3.6% 6864=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =

will-it-scale.per_thread_ops
 =C2=A0=C2=A0=C2=A0 341938=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0 311218 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -3.6% 329513=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =

will-it-scale.workload

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 915f4f100383..34bb2a01806c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -447,13 +447,6 @@ struct mm_struct {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 atomic_t has_pinned;

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /**
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * @write_protect_seq: Locked when any thread is write
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * protecting pages mapped by this mm to enforce a later =

COW,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * for instance during page table copying for fork().
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 seqcount_t write_protect_seq;
-
 =C2=A0#ifdef CONFIG_MMU
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 atomic_long_t pgtables_bytes;=C2=A0=C2=A0 /* PTE page ta=
ble pages */
 =C2=A0#endif
@@ -564,6 +557,12 @@ struct mm_struct {
 =C2=A0#ifdef CONFIG_IOMMU_SUPPORT
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u32 pasid;
 =C2=A0#endif
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /**
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * @write_protect_seq: Locked when any thread is wr=
ite
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * protecting pages mapped by this mm to enforce a =

later COW,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * for instance during page table copying for fork(=
).
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 seqcount_t write_protect_seq;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } __randomize_layout;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*

>
>   (b) two added (nonatomic) increment operations in the fork path due
> to the seqcount
>
> and I'm not seeing what would cause that 9% change. Obviously cache
> placement has done it before.
>
> If somebody else sees something that I'm missing, please holler. But
> I'll ignore this as "noise" otherwise.
>
>              Linus
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============0658597109248841155==--

