Content-Type: multipart/mixed; boundary="===============3924122138343659146=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [pcpu] BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x1e3b/0x29e2
Date: Tue, 28 Nov 2017 20:45:34 +0800
Message-ID: <20171128124534.3jvuala525wvn64r@wfg-t540p.sh.intel.com>
In-Reply-To: <20171127210301.GA55812@localhost.corp.microsoft.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3924122138343659146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Dennis,

On Mon, Nov 27, 2017 at 03:03:01PM -0600, Dennis Zhou wrote:
>Hi Fangguang,
>
>On Sun, Nov 26, 2017 at 02:31:17PM +0800, Fengguang Wu wrote:
>> Hello,
>>
>> FYI this happens in mainline kernel 4.14.0-13151-g5a78775.
>> This looks like a new regression after 4.14.
>
>I have reproduced this with the commit and scripts attached. The
>offending line is the INIT_LIST_HEAD call in the for loop below. Both
>pcpu_nr_slots and pcpu_slot are global variables.
>
>pcpu_nr_slots =3D __pcpu_size_to_slot(pcpu_unit_size) + 2;
>pcpu_slot =3D memblock_virt_alloc(
>		pcpu_nr_slots * sizeof(pcpu_slot[0]), 0);
>for (i =3D 0; i < pcpu_nr_slots; i++)
>	INIT_LIST_HEAD(&pcpu_slot[i]);
>
>The management of the percpu slots was not changed with the bitmap
>allocator in v4.14. That line actually is from Tejun's rewrite in 2009,
>commit fbf59bc9d.
>
>Just to be safe, I did revert my commits and reproduced the same error.
>
>GCC version: gcc-7 (Ubuntu 7.2.0-1ubuntu1~16.04) 7.2.0
>
>> [    0.000000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    0.000000] BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x1=
e3b/0x29e2:
>> 						pcpu_setup_first_chunk at mm/percpu.c:2118 (discriminator 3)
>> [    0.000000] Write of size 8 at addr ffffffff83c07d38 by task swapper/0
>> [    0.000000]
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-13151-g5a7=
8775 #2
>> [    0.000000] Call Trace:
>> [    0.000000]  print_address_description+0x2d/0x3d0:
>> 						print_address_description at mm/kasan/report.c:253
>> [    0.000000]  ? pcpu_setup_first_chunk+0x1e3b/0x29e2:
>> 						pcpu_setup_first_chunk at mm/percpu.c:2118 (discriminator 3)
>> [    0.000000]  kasan_report+0x1f4/0x3b0:
>> 						kasan_report_error at mm/kasan/report.c:352
>> 						 (inlined by) kasan_report at mm/kasan/report.c:409
>> [    0.000000]  pcpu_setup_first_chunk+0x1e3b/0x29e2:
>> 						pcpu_setup_first_chunk at mm/percpu.c:2118 (discriminator 3)
>
>Interestingly, while the INIT_LIST_HEAD call is what is causing
>problems, I manually unrolled the loop and the location of the bug
>changed. This happens both inside and outside of the for loop as long as
>it only has 1 iteration.
>
>[    0.000000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[    0.000000] BUG: KASAN: use-after-scope in pageset_init (/users/dennisz=
/linux-linus//include/linux/listh:28 /users/dennisz/linux-linus/mm/page_all=
occ:5509)
>[    0.000000] Write of size 8 at addr ffffffff83c07dc8 by task swapper/0
>[    0.000000]
>[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-13151-g5a787=
75-dirty #53
>[    0.000000] Call Trace:
>[    0.000000] print_address_description (/users/dennisz/linux-linus/mm/ka=
san/reportc:253)
>[    0.000000] ? pageset_init (/users/dennisz/linux-linus//include/linux/l=
isth:28 /users/dennisz/linux-linus/mm/page_allocc:5509)
>[    0.000000] kasan_report (/users/dennisz/linux-linus/mm/kasan/reportc:3=
52 /users/dennisz/linux-linus/mm/kasan/reportc:409)
>[    0.000000] pageset_init (/users/dennisz/linux-linus//include/linux/lis=
th:28 /users/dennisz/linux-linus/mm/page_allocc:5509)
>[    0.000000] ? is_free_buddy_page (/users/dennisz/linux-linus/mm/page_al=
locc:5500)
>[    0.000000] build_all_zonelists_init (/users/dennisz/linux-linus/mm/pag=
e_allocc:5483 /users/dennisz/linux-linus/mm/page_allocc:5496 /users/dennisz=
/linux-linus/mm/page_allocc:5515 /users/dennisz/linux-linus/mm/page_allocc:=
5262)
>[    0.000000] build_all_zonelists (/users/dennisz/linux-linus/mm/page_all=
occ:5277)
>[    0.000000] start_kernel (/users/dennisz/linux-linus/init/mainc:546)
>[    0.000000] ? thread_stack_cache_init+0x2e/0x2e
>[    0.000000] ? memcpy_orig (/users/dennisz/linux-linus/arch/x86/lib/memc=
py_64S:106)
>[    0.000000] secondary_startup_64 (/users/dennisz/linux-linus/arch/x86/k=
ernel/head_64S:237)
>[    0.000000]
>[    0.000000]
>[    0.000000] Memory state around the buggy address:
>[    0.000000]  ffffffff83c07c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00
>[    0.000000]  ffffffff83c07d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00
>[    0.000000] >ffffffff83c07d80: 00 00 00 00 00 f1 f1 f1 f1 f8 f2 f2 f2 0=
0 00 00
>[    0.000000]                                               ^
>[    0.000000]  ffffffff83c07e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00
>[    0.000000]  ffffffff83c07e80: 00 00 00 00 00 00 00 00 00 00 00 00 f8 0=
0 00 00
>[    0.000000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Next, I did a partial unroll where the loop went through 2 iterations
>and then manually called INIT_LIST_HEAD for the remainder, the bug
>returns. I've left this trace out as it is the same as reported by
>Fangguang.
>
>I'm not familiar with the details of KASAN, but it seems that there is a
>weird interaction with KASAN use-after-scope and subsequent invocations
>of inlined functions called from inside a for loop.
>
>I don't think I have enough background to continue debugging this
>myself, who would be a good person to loop in for help?

CC KASAN people. I managed to bisect it to commit f7dd2507893cc3
("gcc-plugins: structleak: add option to init all vars used as byref args")

Thanks,
Fengguang

--===============3924122138343659146==--

