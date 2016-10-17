Content-Type: multipart/mixed; boundary="===============7307087217743408214=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] 811565123a: BUG: kernel hang in early-boot stage, last printk: Probing EDD (edd=off to disable)... ok
Date: Mon, 17 Oct 2016 09:55:40 +0800
Message-ID: <20161017015540.GC22605@yexl-desktop>
In-Reply-To: <20161014205429.GL26852@two.firstfloor.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7307087217743408214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14, Andi Kleen wrote:
>On Fri, Oct 14, 2016 at 12:56:00PM +0800, Ye Xiaolong wrote:
>> On 10/14, Ye Xiaolong wrote:
>> >On 10/13, Andi Kleen wrote:
>> >>Andi Kleen <andi@firstfloor.org> writes:
>> >>
>> >>Any comments on this?
>> >>
>> >>I still cannot reproduce the failure unfortunately.
>> >>
>> >
>> >Btw, you can try below commands to reproduce the error on your local
>> >host, they will download the necessary images and run QEMU:
>> >
>> >       git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>> >       cd lkp-tests
>> >       bin/lkp qemu -k KERNEL job-script  # job-script is attached in t=
he original report email
>> =

>> Results show this hang may be related to gcc version, with gcc version
>> 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.3), kernel could boot without early
>> hang, but if kernel was built with gcc version 6.2.0 20160901 (Debian
>> 6.2.0-3), it will stuck in the early stage:
>
>I built a mainline gcc 6.2, unfortunately still doesn't reproduce. The ker=
nel
>with your config boots to root.
>
>My guess is that something is broken with paravirt ops on 32bit
>on that compiler.
>
>I created a new patch with the probing code moved to a separate
>function. Can you test if that works?
>

Kernel can boot to root with this new version patch.

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>


Thanks,
Xiaolong


>-Andi
>
>
>commit 65c92de6678f04ce14b237d7073e164b98d9a8be
>Author: Andi Kleen <ak@linux.intel.com>
>Date:   Wed May 4 06:07:44 2016 -0700
>
>    x86: Report Intel platform_id in /proc/cpuinfo
>    =

>    We have a need to distinguish systems based on their platform ID.
>    For example this is useful to distinguish systems with L4 cache
>    versus ones without.
>    =

>    There is a 3 bit identifier (also called processor flags) in
>    the IA32_PLATFORM_ID MSR that can give a more fine grained
>    identification of the CPU than just the model number/stepping.
>    =

>    IA32_PLATFORM_ID is architectural.
>    =

>    The MSR can be also accessed through /dev/cpu/*/msr, but that
>    requires root and is awkward.
>    =

>    The patch moves the reading of PLATFORM_INFO from the
>    (late) microcode driver code into the main intel CPU initialization
>    path and then also prints it in /proc/cpuinfo
>    =

>    v2: Handle 0 platform_id. Fix commit message.
>    v3: Move some code to cpu/intel.c
>    v4: Update description too.
>    v5: Move msr probe code out of line to w/a potential gcc 6 bug
>    Cc: hmh(a)hmh.eng.br
>    Signed-off-by: Andi Kleen <ak@linux.intel.com>
>
>diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proce=
ssor.h
>index 63def9537a2d..c1313b3f3e59 100644
>--- a/arch/x86/include/asm/processor.h
>+++ b/arch/x86/include/asm/processor.h
>@@ -135,6 +135,8 @@ struct cpuinfo_x86 {
> 	/* Index into per_cpu list: */
> 	u16			cpu_index;
> 	u32			microcode;
>+	u32			platform_id;
>+	u8			has_platform_id;
> };
> =

> #define X86_VENDOR_INTEL	0
>diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
>index fcd484d2bb03..7da7f008cee0 100644
>--- a/arch/x86/kernel/cpu/intel.c
>+++ b/arch/x86/kernel/cpu/intel.c
>@@ -61,6 +61,19 @@ void check_mpx_erratum(struct cpuinfo_x86 *c)
> 	}
> }
> =

>+/* noinline to work around problem with gcc 6.2 */
>+static noinline void probe_platformid(struct cpuinfo_x86 *c)
>+{
>+	if ((c->x86_model >=3D 5) || (c->x86 > 6)) {
>+		unsigned val[2];
>+
>+		/* get processor flags from MSR 0x17 */
>+		rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
>+		c->platform_id =3D (val[1] >> 18) & 7;
>+		c->has_platform_id =3D true;
>+	}
>+}
>+
> static void early_init_intel(struct cpuinfo_x86 *c)
> {
> 	u64 misc_enable;
>@@ -211,6 +224,8 @@ static void early_init_intel(struct cpuinfo_x86 *c)
> 	}
> =

> 	check_mpx_erratum(c);
>+
>+	probe_platformid(c);
> }
> =

> #ifdef CONFIG_X86_32
>diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/m=
icrocode/intel.c
>index cdc0deab00c9..fab07e49192e 100644
>--- a/arch/x86/kernel/cpu/microcode/intel.c
>+++ b/arch/x86/kernel/cpu/microcode/intel.c
>@@ -855,17 +855,13 @@ static int collect_cpu_info(int cpu_num, struct cpu_=
signature *csig)
> {
> 	static struct cpu_signature prev;
> 	struct cpuinfo_x86 *c =3D &cpu_data(cpu_num);
>-	unsigned int val[2];
> =

> 	memset(csig, 0, sizeof(*csig));
> =

> 	csig->sig =3D cpuid_eax(0x00000001);
> =

>-	if ((c->x86_model >=3D 5) || (c->x86 > 6)) {
>-		/* get processor flags from MSR 0x17 */
>-		rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
>-		csig->pf =3D 1 << ((val[1] >> 18) & 7);
>-	}
>+	if (c->has_platform_id)
>+		csig->pf =3D 1 << c->platform_id;
> =

> 	csig->rev =3D c->microcode;
> =

>diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
>index 18ca99f2798b..5345d50ed709 100644
>--- a/arch/x86/kernel/cpu/proc.c
>+++ b/arch/x86/kernel/cpu/proc.c
>@@ -76,6 +76,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> 		seq_puts(m, "stepping\t: unknown\n");
> 	if (c->microcode)
> 		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
>+	if (c->has_platform_id)
>+		seq_printf(m, "platform_id\t: %d\n", c->platform_id);
> =

> 	if (cpu_has(c, X86_FEATURE_TSC)) {
> 		unsigned int freq =3D cpufreq_quick_get(cpu);

--===============7307087217743408214==--

