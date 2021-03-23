Content-Type: multipart/mixed; boundary="===============0798147568210451665=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [selftests] e48d82b67a: BUG_TestSlub_RZ_alloc(Not_tainted):Redzone_overwritten
Date: Tue, 23 Mar 2021 01:02:36 +0100
Message-ID: <7789b386-bddd-37ba-fccd-370f1340e698@suse.cz>
In-Reply-To: <a3f6261b-22b-89f1-ec24-7516f0fa1d4c@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0798147568210451665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/21 7:53 PM, David Rientjes wrote:
> On Wed, 17 Mar 2021, Vlastimil Babka wrote:
>> > =

>> > [   22.154049] random: get_random_u32 called from __kmem_cache_create+=
0x23/0x3e0 with crng_init=3D0 =

>> > [   22.154070] random: get_random_u32 called from cache_random_seq_cre=
ate+0x7c/0x140 with crng_init=3D0 =

>> > [   22.154167] random: get_random_u32 called from allocate_slab+0x155/=
0x5e0 with crng_init=3D0 =

>> > [   22.154690] test_slub: 1. kmem_cache: Clobber Redzone 0x12->0x(ptrv=
al)
>> > [   22.164499] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > [   22.166629] BUG TestSlub_RZ_alloc (Not tainted): Redzone overwritten
>> > [   22.168179] -------------------------------------------------------=
----------------------
>> > [   22.168179]
>> > [   22.168372] Disabling lock debugging due to kernel taint
>> > [   22.168372] INFO: 0x(ptrval)-0x(ptrval) @offset=3D1064. First byte =
0x12 instead of 0xcc
>> > [   22.168372] INFO: Allocated in resiliency_test+0x47/0x1be age=3D3 c=
pu=3D0 pid=3D1 =

>> > [   22.168372] __slab_alloc+0x57/0x80 =

>> > [   22.168372] kmem_cache_alloc (kbuild/src/consumer/mm/slub.c:2871 kb=
uild/src/consumer/mm/slub.c:2915 kbuild/src/consumer/mm/slub.c:2920) =

>> > [   22.168372] resiliency_test (kbuild/src/consumer/lib/test_slub.c:34=
 kbuild/src/consumer/lib/test_slub.c:107) =

>> > [   22.168372] test_slub_init (kbuild/src/consumer/lib/test_slub.c:124=
) =

>> > [   22.168372] do_one_initcall (kbuild/src/consumer/init/main.c:1226) =

>> > [   22.168372] kernel_init_freeable (kbuild/src/consumer/init/main.c:1=
298 kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:13=
35 kbuild/src/consumer/init/main.c:1537) =

>> > [   22.168372] kernel_init (kbuild/src/consumer/init/main.c:1426) =

>> > [   22.168372] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry=
_32.S:856) =

>> > [   22.168372] INFO: Slab 0x(ptrval) objects=3D16 used=3D1 fp=3D0x(ptr=
val) flags=3D0x40000201
>> > [   22.168372] INFO: Object 0x(ptrval) @offset=3D1000 fp=3D0x(ptrval)
>> > [   22.168372]
>> > [   22.168372] Redzone (ptrval): cc cc cc cc cc cc cc cc              =
            ........
>> > [   22.168372] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b 6b 6b  kkkkkkkkkkkkkkkk
>> > [   22.168372] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b 6b a5  kkkkkkkkkkkkkkk.
>> > [   22.168372] Redzone (ptrval): 12 cc cc cc                          =
            ....
>> > [   22.168372] Padding (ptrval): 5a 5a 5a 5a 5a 5a 5a 5a              =
            ZZZZZZZZ
>> > [   22.168372] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B          =
   5.12.0-rc2-00001-ge48d82b67a2b #1
>> > [   22.168372] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.12.0-1 04/01/2014
>> > [   22.168372] Call Trace:
>> > [   22.168372] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122) =

>> > [   22.168372] print_trailer (kbuild/src/consumer/mm/slub.c:737) =

>> > [   22.168372] check_bytes_and_report.cold (kbuild/src/consumer/mm/slu=
b.c:807) =

>> > [   22.168372] check_object (kbuild/src/consumer/mm/slub.c:914) =

>> > [   22.168372] validate_slab (kbuild/src/consumer/mm/slub.c:4635) =

>> =

>> Hm but in this case the output means the tested functionality (slub debu=
gging)
>> is working as intended. So what can we do? Indicate/teach somehow to the=
 bot
>> that this is OK? Does kselftest have some support for this? Or silence t=
he
>> validation output for testing purposes? (I would prefer not to)
>> =

> =

> Unless you're familiar with everything that CONFIG_TEST_SLUB does, maybe =

> this could be inferred as an actual issue that the test has uncovered tha=
t =

> is unexpected?
> =

> I don't have a good way of silencing the check_bytes_and_report() output =

> other than a big hammer: implement {disable,enable}_slub_warnings() that =

> the resiliency test could call into before triggering these checks.

So Oliver has implemented this, but now I got a different idea that should =
be
much cleaner IMHO. We could add a per-cache flag SLAB_SILENT_ERRORS (simila=
r to
SLAB_RED_ZONE etc) instead of a global bool. The test would just create the
caches with this flag.
The flag should be added to the SLAB_NEVER_MERGE, SLAB_DEBUG_FLAGS,
SLAB_FLAGS_PERMITTED macros as well.

A similar suggestion is that adding the errors counter parameter to all
validate_slab_cache() and relevant functions is tedious - there are more th=
at
had to be modified like this than initially expected.
Instead the error counter can be added to SLUB's struct kmem_cache definiti=
on,
incremented by the various checks and the tests can look at that after vali=
dation.

Thanks,
Vlastimil
--===============0798147568210451665==--

