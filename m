Content-Type: multipart/mixed; boundary="===============0775707140380156091=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4% regression
Date: Wed, 25 Mar 2020 11:32:06 +0100
Message-ID: <87zhc4ybbt.fsf@nanos.tec.linutronix.de>
In-Reply-To: <43a4189a-7153-18e8-4657-4a4400002c05@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0775707140380156091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong Chen <rong.a.chen@intel.com> writes:
> On 3/24/20 6:24 PM, Andy Shevchenko wrote:
>> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.c=
om> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops du=
e to commit:
>>> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufre=
q: Convert to new X86 CPU match macros")
>>> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devic=
etable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
>>> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git =
linux-next
>>>
>>> in testcase: will-it-scale
>>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with=
 8G memory
>>> with following parameters:
>>
>> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
>> perhaps it's a culprit, because I don't believe removing dups and
>> reordering lines may affect this.
>> Can you restore terminator there and re-test?
>>
>
> I have retested with the change, but it has no effect on the performance.

Bah. The binary equivalence testing detected this, but I obvioulsy
missed it. Delta fix below.

Thanks,

        tglx

8<--------------
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -2727,7 +2727,7 @@ static inline void intel_pstate_request_
 =

 #define X86_MATCH_HWP(model, hwp_mode)					\
 	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
-					   X86_FEATURE_APERFMPERF, hwp_mode)
+					   X86_FEATURE_HWP, hwp_mode)
 =

 static const struct x86_cpu_id hwp_support_ids[] __initconst =3D {
 	X86_MATCH_HWP(BROADWELL_X,	INTEL_PSTATE_HWP_BROADWELL),
--===============0775707140380156091==--

