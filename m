Content-Type: multipart/mixed; boundary="===============3950377553819131126=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [selftests] e48d82b67a: BUG_TestSlub_RZ_alloc(Not_tainted):Redzone_overwritten
Date: Wed, 17 Mar 2021 12:29:40 +0100
Message-ID: <a389a8fb-2043-3b13-5180-e1f87e4d4a66@suse.cz>
In-Reply-To: <20210317083612.GD22345@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3950377553819131126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/21 9:36 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: e48d82b67a2b760eedf7b95ca15f41267496386c ("[PATCH 1/2] selftests:=
 add a kselftest for SLUB debugging functionality")
> url: https://github.com/0day-ci/linux/commits/glittao-gmail-com/selftests=
-add-a-kselftest-for-SLUB-debugging-functionality/20210316-204257
> base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.=
git next
> =

> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
> =

> 	group: group-04
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
---------------------------------------+-----------+------------+
> |                                                                        =
                                       | v5.12-rc2 | e48d82b67a |
> +------------------------------------------------------------------------=
---------------------------------------+-----------+------------+
> | BUG_TestSlub_RZ_alloc(Not_tainted):Redzone_overwritten                 =
                                       | 0         | 69         |
> | INFO:0x(ptrval)-0x(ptrval)@offset=3D#.First_byte#instead_of            =
                                         | 0         | 69         |
> | INFO:Allocated_in_resiliency_test_age=3D#cpu=3D#pid=3D                 =
                                             | 0         | 69         |
> | INFO:Slab0x(ptrval)objects=3D#used=3D#fp=3D0x(ptrval)flags=3D          =
                                               | 0         | 69         |
> | INFO:Object0x(ptrval)@offset=3D#fp=3D0x(ptrval)                        =
                                           | 0         | 69         |
> | BUG_TestSlub_next_ptr_free(Tainted:G_B):Freechain_corrupt              =
                                       | 0         | 69         |
> | INFO:Freed_in_resiliency_test_age=3D#cpu=3D#pid=3D                     =
                                             | 0         | 69         |
> | BUG_TestSlub_next_ptr_free(Tainted:G_B):Wrong_object_count.Counter_is#b=
ut_counted_were                        | 0         | 69         |
> | BUG_TestSlub_next_ptr_free(Tainted:G_B):Redzone_overwritten            =
                                       | 0         | 69         |
> | BUG_TestSlub_next_ptr_free(Tainted:G_B):Objects_remaining_in_TestSlub_n=
ext_ptr_free_on__kmem_cache_shutdown() | 0         | 69         |
> | INFO:Object0x(ptrval)@offset=3D                                        =
                                         | 0         | 69         |
> | BUG_TestSlub_1th_word_free(Tainted:G_B):Poison_overwritten             =
                                       | 0         | 69         |
> | BUG_TestSlub_50th_word_free(Tainted:G_B):Poison_overwritten            =
                                       | 0         | 69         |
> | BUG_TestSlub_RZ_free(Tainted:G_B):Redzone_overwritten                  =
                                       | 0         | 69         |
> +------------------------------------------------------------------------=
---------------------------------------+-----------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> [   22.154049] random: get_random_u32 called from __kmem_cache_create+0x2=
3/0x3e0 with crng_init=3D0 =

> [   22.154070] random: get_random_u32 called from cache_random_seq_create=
+0x7c/0x140 with crng_init=3D0 =

> [   22.154167] random: get_random_u32 called from allocate_slab+0x155/0x5=
e0 with crng_init=3D0 =

> [   22.154690] test_slub: 1. kmem_cache: Clobber Redzone 0x12->0x(ptrval)
> [   22.164499] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.166629] BUG TestSlub_RZ_alloc (Not tainted): Redzone overwritten
> [   22.168179] ----------------------------------------------------------=
-------------------
> [   22.168179]
> [   22.168372] Disabling lock debugging due to kernel taint
> [   22.168372] INFO: 0x(ptrval)-0x(ptrval) @offset=3D1064. First byte 0x1=
2 instead of 0xcc
> [   22.168372] INFO: Allocated in resiliency_test+0x47/0x1be age=3D3 cpu=
=3D0 pid=3D1 =

> [   22.168372] __slab_alloc+0x57/0x80 =

> [   22.168372] kmem_cache_alloc (kbuild/src/consumer/mm/slub.c:2871 kbuil=
d/src/consumer/mm/slub.c:2915 kbuild/src/consumer/mm/slub.c:2920) =

> [   22.168372] resiliency_test (kbuild/src/consumer/lib/test_slub.c:34 kb=
uild/src/consumer/lib/test_slub.c:107) =

> [   22.168372] test_slub_init (kbuild/src/consumer/lib/test_slub.c:124) =

> [   22.168372] do_one_initcall (kbuild/src/consumer/init/main.c:1226) =

> [   22.168372] kernel_init_freeable (kbuild/src/consumer/init/main.c:1298=
 kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =
kbuild/src/consumer/init/main.c:1537) =

> [   22.168372] kernel_init (kbuild/src/consumer/init/main.c:1426) =

> [   22.168372] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_32=
.S:856) =

> [   22.168372] INFO: Slab 0x(ptrval) objects=3D16 used=3D1 fp=3D0x(ptrval=
) flags=3D0x40000201
> [   22.168372] INFO: Object 0x(ptrval) @offset=3D1000 fp=3D0x(ptrval)
> [   22.168372]
> [   22.168372] Redzone (ptrval): cc cc cc cc cc cc cc cc                 =
         ........
> [   22.168372] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b 6b  kkkkkkkkkkkkkkkk
> [   22.168372] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b a5  kkkkkkkkkkkkkkk.
> [   22.168372] Redzone (ptrval): 12 cc cc cc                             =
         ....
> [   22.168372] Padding (ptrval): 5a 5a 5a 5a 5a 5a 5a 5a                 =
         ZZZZZZZZ
> [   22.168372] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             =
5.12.0-rc2-00001-ge48d82b67a2b #1
> [   22.168372] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   22.168372] Call Trace:
> [   22.168372] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122) =

> [   22.168372] print_trailer (kbuild/src/consumer/mm/slub.c:737) =

> [   22.168372] check_bytes_and_report.cold (kbuild/src/consumer/mm/slub.c=
:807) =

> [   22.168372] check_object (kbuild/src/consumer/mm/slub.c:914) =

> [   22.168372] validate_slab (kbuild/src/consumer/mm/slub.c:4635) =


Hm but in this case the output means the tested functionality (slub debuggi=
ng)
is working as intended. So what can we do? Indicate/teach somehow to the bot
that this is OK? Does kselftest have some support for this? Or silence the
validation output for testing purposes? (I would prefer not to)

Thanks,
Vlastimil
--===============3950377553819131126==--

