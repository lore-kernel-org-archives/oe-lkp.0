Content-Type: multipart/mixed; boundary="===============2836005049089662014=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf x86] b77491648e: will-it-scale.per_process_ops -2.1% regression
Date: Wed, 12 Feb 2020 18:56:50 +0800
Message-ID: <782f409a-ff90-831c-56a0-abb3c31ab8d8@intel.com>
In-Reply-To: <87tv44danp.fsf@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2836005049089662014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/6/2020 4:47 AM, Andi Kleen wrote:
> kernel test robot <rong.a.chen@intel.com> writes:
>
>> Greeting,
>>
>> FYI, we noticed a -2.1% regression of will-it-scale.per_process_ops due =
to commit:
>>
>>
>> commit: b77491648e6eb2f26b6edf5eaea859adc17f4dcc ("perf x86: Infrastruct=
ure for exposing an Uncore unit to PMON mapping")
>> https://github.com/0day-ci/linux/commits/roman-sudarikov-linux-intel-com=
/perf-x86-Exposing-IO-stack-to-IO-PMON-mapping-through-sysfs/20200118-075508
> Seems to be spurious bisect. I don't think that commit could change
> anything performance related.

Hi Andi,

I commented out some lines in arch/x86/events/intel/uncore.c and =

will-it-scale.per_process_ops increased.

commit:
   v5.4
   b77491648e ("perf x86: Infrastructure for exposing an Uncore unit to PMO=
N mapping")
   f33fe1b258 ("test")


 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v5.4=C2=
=A0 b77491648e6eb2f26b6edf5eae =

f33fe1b258b2a4b2fc97600b2b=C2=A0 testcase/testparams/testbox
----------------=C2=A0 -------------------------- -------------------------=
-=C2=A0 =

---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
 =C2=A0=C2=A0=C2=A0=C2=A0 47983=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 47004 47647 =

will-it-scale/performance-process-100%-signal1-ucode=3D0xb000038/lkp-bdw-ep6
 =C2=A0=C2=A0=C2=A0=C2=A0 47983=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 47004 47647=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-M=
EAN =

will-it-scale.per_process_ops

diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index 55201bfde2c84c..0dc9c455423d99 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -887,7 +887,7 @@ static int uncore_pmu_register(struct =

intel_uncore_pmu *pmu)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pmu->pmu.attr_groups =3D pmu->type->attr_groups;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu->pmu.attr_update =3D attr_update;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // pmu->pmu.attr_update =3D attr_upda=
te;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pmu->type->num_boxes =3D=3D=
 1) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (strlen(pmu->type->name) > 0)
@@ -903,7 +903,7 @@ static int uncore_pmu_register(struct =

intel_uncore_pmu *pmu)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Exposing mapping of Unc=
ore units to corresponding Uncore PMUs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * through /sys/devices/un=
core_<type>_<idx>/mapping
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uncore_platform_mapping(pmu->type);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // uncore_platform_mapping(pmu->type);

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D perf_pmu_register(&pmu-=
>pmu, pmu->name, -1);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)

Best Regards,
Rong Chen

>
> -Andi
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============2836005049089662014==--

