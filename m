Content-Type: multipart/mixed; boundary="===============3545612179453930503=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Thu, 18 Aug 2016 06:11:39 +0200
Message-ID: <20160818041139.GA22101@nazgul.tnic>
In-Reply-To: <877fbespek.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3545612179453930503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 08:54:11PM -0700, Huang, Ying wrote:
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx=
 pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopolo=
gy nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx =
smx est tm2 ssse3 cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic
> popcnt tsc_deadline_timer aes xsave avx lahf_lm tpr_shadow vnmi flexprior=
ity ept vpid xsaveopt dtherm ida arat pln pts
  ^^^^^^

There it is.

So if there's no bug, alternatives should replace all "call
__sw_hweightXX" calls with POPCNT. So you shouldn't be even calling
these functions and hitting that path.

Can you boot the kernel with "debug-alternative" and put that dmesg
somewhere along with vmlinux for me to stare at? Privately is fine too.

I'd like to make sure the alternatives application actually happens.

Thanks.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--

--===============3545612179453930503==--

