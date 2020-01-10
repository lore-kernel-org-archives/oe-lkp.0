Content-Type: multipart/mixed; boundary="===============4611432118116507182=="
MIME-Version: 1.0
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: lkp@lists.01.org
Subject: Re: a875b364eb ("mm/rmap: fix reusing mergeable anon_vma as parent .."): [ 63.188855] WARNING: CPU: 1 PID: 285 at mm/rmap.c:434 unlink_anon_vmas
Date: Fri, 10 Jan 2020 13:02:28 +0300
Message-ID: <1249732a-cc35-26fb-efbb-9c1e9b35a81b@yandex-team.ru>
In-Reply-To: <20200110014334.GB22278@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4611432118116507182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/01/2020 04.43, kernel test boot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Konstantin-Khlebnikov/mm-rmap-fi=
x-reusing-mergeable-anon_vma-as-parent-when-fork/20200106-210625

Fixed in v2
[PATCH v2 1/2] mm/rmap: fix and simplify reusing mergeable anon_vma as pare=
nt when fork
https://lore.kernel.org/linux-mm/157839239609.694.10268055713935919822.stgi=
t(a)buzz/

> =

> commit a875b364ebe64baa45d10bd92278b1c81c2a2412
> Author:     Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> AuthorDate: Mon Jan 6 13:42:40 2020 +0300
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Mon Jan 6 21:06:29 2020 +0800
> =

>      mm/rmap: fix reusing mergeable anon_vma as parent when fork
>      =

>      This fixes couple misconceptions in commit 4e4a9eb92133 ("mm/rmap.c:=
 reuse
>      mergeable anon_vma as parent when fork").
>      =

>      First problem caused by initialization order in dup_mmap(): vma->vm_=
prev
>      is set after calling anon_vma_fork(). Thus in anon_vma_fork() it poi=
nts to
>      previous VMA in parent mm. This is fixed by rearrangement in dup_mma=
p().
>      =

>      If in parent VMAs: SRC1 SRC2 .. SRCn share anon-vma ANON0, then afte=
r fork
>      before all patches in child process related VMAs: DST1 DST2 .. DSTn =
will
>      use different anon-vmas: ANON1 ANON2 .. ANONn. Before this patch onl=
y DST1
>      will fork new ANON1 and following DST2 .. DSTn will share parent's A=
NON0.
>      With this patch DST1 will create new ANON1 and DST2 .. DSTn will sha=
re it.
>      =

>      Also this patch moves sharing logic out of anon_vma_clone() into more
>      specific anon_vma_fork() because this supposed to work only at fork(=
).
>      Function anon_vma_clone() is more generic is also used at splitting =
VMAs.
>      =

>      Second problem is hidden behind first one: assumption "Parent has vm=
_prev,
>      which implies we have vm_prev" is wrong if first VMA in parent mm ha=
s set
>      flag VM_DONTCOPY. Luckily prev->anon_vma doesn't dereference NULL po=
inter
>      because in current code 'prev' actually is same as 'pprev'. To avoid=
 that
>      this patch just checks pointer and compares vm_start to verify relat=
ion
>      between previous VMAs in parent and child.
>      =

>      Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
>      Fixes: 4e4a9eb92133 ("mm/rmap.c: reuse mergeable anon_vma as parent =
when fork")
> =

> c79f46a282  Linux 5.5-rc5
> a875b364eb  mm/rmap: fix reusing mergeable anon_vma as parent when fork
> +-----------------------------------------------------------+----------+-=
-----------+
> |                                                           | v5.5-rc5 | =
a875b364eb |
> +-----------------------------------------------------------+----------+-=
-----------+
> | boot_successes                                            | 33       | =
0          |
> | boot_failures                                             | 3        | =
13         |
> | BUG:kernel_timeout_in_test_stage                          | 1        | =
1          |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 2        =
|            |
> | Assertion_failed                                          | 1        | =
           |
> | WARNING:at_mm/rmap.c:#unlink_anon_vmas                    | 0        | =
13         |
> | EIP:unlink_anon_vmas                                      | 0        | =
13         |
> +-----------------------------------------------------------+----------+-=
-----------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [   63.165740] Freeing unused kernel image (initmem) memory: 1292K
> [   63.181481] Write protecting kernel text and read-only data: 23764k
> [   63.182090] rodata_test: all tests were successful
> [   63.182531] Run /init as init process
> [   63.188032] ------------[ cut here ]------------
> [   63.188855] WARNING: CPU: 1 PID: 285 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.198504] Modules linked in:
> [   63.199083] CPU: 1 PID: 285 Comm: init Tainted: G                T 5.5=
.0-rc5-00001-ga875b364ebe64 #1
> [   63.200652] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.202103] EIP: unlink_anon_vmas+0x138/0x170
> [   63.202782] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.205655] EAX: efceeea0 EBX: ef793040 ECX: 00000001 EDX: efced258
> [   63.206697] ESI: ef793048 EDI: efceedd0 EBP: ef3cfdbc ESP: ef3cfda4
> [   63.207729] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.208834] CR0: 80050033 CR2: 77e60e70 CR3: 6f183000 CR4: 00040690
> [   63.209857] Call Trace:
> [   63.210331]  free_pgtables+0xa2/0x100
> [   63.210994]  exit_mmap+0x98/0x160
> [   63.211600]  mmput+0x6a/0x110
> [   63.212126]  flush_old_exec+0x4e7/0x790
> [   63.212812]  load_elf_binary+0x312/0x10ea
> [   63.213534]  ? find_held_lock+0x2b/0xa0
> [   63.214218]  ? lock_release+0x30/0x210
> [   63.214841]  ? preempt_count_sub+0x98/0x100
> [   63.215539]  search_binary_handler+0x56/0x1f0
> [   63.216371]  search_binary_handler+0x1b/0x30
> [   63.217083]  load_script+0x1c4/0x280
> [   63.217681]  search_binary_handler+0x56/0x1f0
> [   63.218557]  __do_execve_file+0x655/0x7f0
> [   63.219282]  sys_execve+0x26/0x30
> [   63.219865]  do_int80_syscall_32+0x50/0x130
> [   63.220588]  entry_INT80_32+0x112/0x117
> [   63.221270] EIP: 0x77eae864
> [   63.221790] Code: Bad RIP value.
> [   63.222380] EAX: ffffffda EBX: 7fc07c24 ECX: 7fc07a5c EDX: 004cc330
> [   63.223454] ESI: 7fc07a5c EDI: 7fc07c24 EBP: 7fc079f8 ESP: 7fc07998
> [   63.224488] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.225623] ---[ end trace 99280caf5c6a62df ]---
> [   63.230470] ------------[ cut here ]------------
> [   63.230470] ------------[ cut here ]------------
> [   63.231308] WARNING: CPU: 1 PID: 285 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.232798] Modules linked in:
> [   63.233323] CPU: 1 PID: 285 Comm: init Tainted: G        W       T 5.5=
.0-rc5-00001-ga875b364ebe64 #1
> [   63.234851] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.236286] EIP: unlink_anon_vmas+0x138/0x170
> [   63.237023] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.239208] EAX: efceec98 EBX: ef793c40 ECX: 00000001 EDX: efcede88
> [   63.239774] ESI: ef793c48 EDI: efceef70 EBP: ef3cfdbc ESP: ef3cfda4
> [   63.240337] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.240951] CR0: 80050033 CR2: 77eae85a CR3: 6f183000 CR4: 00040690
> [   63.241516] Call Trace:
> [   63.241757]  free_pgtables+0xa2/0x100
> [   63.242125]  exit_mmap+0x98/0x160
> [   63.242435]  mmput+0x6a/0x110
> [   63.242714]  flush_old_exec+0x4e7/0x790
> [   63.243069]  load_elf_binary+0x312/0x10ea
> [   63.243436]  ? find_held_lock+0x2b/0xa0
> [   63.243787]  ? lock_release+0x30/0x210
> [   63.244133]  ? preempt_count_sub+0x98/0x100
> [   63.244521]  search_binary_handler+0x56/0x1f0
> [   63.244984]  search_binary_handler+0x1b/0x30
> [   63.245374]  load_script+0x1c4/0x280
> [   63.245709]  search_binary_handler+0x56/0x1f0
> [   63.246189]  __do_execve_file+0x655/0x7f0
> [   63.246560]  sys_execve+0x26/0x30
> [   63.246870]  do_int80_syscall_32+0x50/0x130
> [   63.247256]  entry_INT80_32+0x112/0x117
> [   63.247611] EIP: 0x77eae864
> [   63.247878] Code: Bad RIP value.
> [   63.248178] EAX: ffffffda EBX: 7fc07c24 ECX: 7fc07a5c EDX: 004cc330
> [   63.248749] ESI: 7fc07a5c EDI: 7fc07c24 EBP: 7fc079f8 ESP: 7fc07998
> [   63.249318] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.249937] ---[ end trace 99280caf5c6a62e0 ]---
> [   63.251253] ------------[ cut here ]------------
> [   63.251253] ------------[ cut here ]------------
> [   63.251982] WARNING: CPU: 1 PID: 285 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.253452] Modules linked in:
> [   63.253972] CPU: 1 PID: 285 Comm: init Tainted: G        W       T 5.5=
.0-rc5-00001-ga875b364ebe64 #1
> [   63.255443] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.256738] EIP: unlink_anon_vmas+0x138/0x170
> [   63.257445] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.260421] EAX: efcee000 EBX: ef793280 ECX: 00000001 EDX: efcede38
> [   63.261463] ESI: ef793288 EDI: efceef08 EBP: ef3cfdbc ESP: ef3cfda4
> [   63.262419] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.263474] CR0: 80050033 CR2: 77eae85a CR3: 6f183000 CR4: 00040690
> [   63.264482] Call Trace:
> [   63.264903]  free_pgtables+0xa2/0x100
> [   63.265496]  exit_mmap+0x98/0x160
> [   63.266044]  mmput+0x6a/0x110
> [   63.266332]  flush_old_exec+0x4e7/0x790
> [   63.266684]  load_elf_binary+0x312/0x10ea
> [   63.267052]  ? find_held_lock+0x2b/0xa0
> [   63.267405]  ? lock_release+0x30/0x210
> [   63.267751]  ? preempt_count_sub+0x98/0x100
> [   63.268134]  search_binary_handler+0x56/0x1f0
> [   63.268589]  search_binary_handler+0x1b/0x30
> [   63.268980]  load_script+0x1c4/0x280
> [   63.269310]  search_binary_handler+0x56/0x1f0
> [   63.269770]  __do_execve_file+0x655/0x7f0
> [   63.270203]  sys_execve+0x26/0x30
> [   63.270511]  do_int80_syscall_32+0x50/0x130
> [   63.270897]  entry_INT80_32+0x112/0x117
> [   63.271249] EIP: 0x77eae864
> [   63.271512] Code: Bad RIP value.
> [   63.271810] EAX: ffffffda EBX: 7fc07c24 ECX: 7fc07a5c EDX: 004cc330
> [   63.272370] ESI: 7fc07a5c EDI: 7fc07c24 EBP: 7fc079f8 ESP: 7fc07998
> [   63.272933] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.273544] ---[ end trace 99280caf5c6a62e1 ]---
> [   63.275807] ------------[ cut here ]------------
> [   63.275807] ------------[ cut here ]------------
> [   63.276245] WARNING: CPU: 1 PID: 286 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.277058] Modules linked in:
> [   63.277343] CPU: 1 PID: 286 Comm: rcS Tainted: G        W       T 5.5.=
0-rc5-00001-ga875b364ebe64 #1
> [   63.278165] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.278914] EIP: unlink_anon_vmas+0x138/0x170
> [   63.279315] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.280965] EAX: efceee38 EBX: ef793760 ECX: 00000001 EDX: efced118
> [   63.281523] ESI: ef793768 EDI: efcee1a0 EBP: ef3cddfc ESP: ef3cdde4
> [   63.282108] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.282722] CR0: 80050033 CR2: 77d03870 CR3: 6f164000 CR4: 00040690
> [   63.283286] Call Trace:
> [   63.283520]  free_pgtables+0xa2/0x100
> [   63.283858]  exit_mmap+0x98/0x160
> [   63.284165]  mmput+0x6a/0x110
> [   63.284442]  flush_old_exec+0x4e7/0x790
> [   63.284795]  load_elf_binary+0x312/0x10ea
> [   63.285162]  ? find_held_lock+0x2b/0xa0
> [   63.285512]  ? lock_release+0x30/0x210
> [   63.285857]  ? preempt_count_sub+0x98/0x100
> [   63.286250]  search_binary_handler+0x56/0x1f0
> [   63.286713]  __do_execve_file+0x655/0x7f0
> [   63.287081]  sys_execve+0x26/0x30
> [   63.287515]  do_int80_syscall_32+0x50/0x130
> [   63.288230]  entry_INT80_32+0x112/0x117
> [   63.288878] EIP: 0x77d31864
> [   63.289368] Code: Bad RIP value.
> [   63.289911] EAX: ffffffda EBX: 0050149c ECX: 00501440 EDX: 0050144c
> [   63.290960] ESI: 00501440 EDI: 0050149c EBP: 004f515f ESP: 7fdd5e88
> [   63.292002] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.293141] ---[ end trace 99280caf5c6a62e2 ]---
> [   63.298272] ------------[ cut here ]------------
> [   63.298272] ------------[ cut here ]------------
> [   63.299056] WARNING: CPU: 1 PID: 286 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.300463] Modules linked in:
> [   63.300939] CPU: 1 PID: 286 Comm: rcS Tainted: G        W       T 5.5.=
0-rc5-00001-ga875b364ebe64 #1
> [   63.302363] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.303677] EIP: unlink_anon_vmas+0x138/0x170
> [   63.304403] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.307295] EAX: efcee7b8 EBX: ef793dc0 ECX: 00000001 EDX: efced2f8
> [   63.308245] ESI: ef793dc8 EDI: efcee0d0 EBP: ef3cddfc ESP: ef3cdde4
> [   63.309174] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.310248] CR0: 80050033 CR2: 77d3185a CR3: 6f164000 CR4: 00040690
> [   63.311318] Call Trace:
> [   63.311735]  free_pgtables+0xa2/0x100
> [   63.312359]  exit_mmap+0x98/0x160
> [   63.312938]  mmput+0x6a/0x110
> [   63.313455]  flush_old_exec+0x4e7/0x790
> [   63.314136]  load_elf_binary+0x312/0x10ea
> [   63.314841]  ? find_held_lock+0x2b/0xa0
> [   63.315500]  ? lock_release+0x30/0x210
> [   63.316151]  ? preempt_count_sub+0x98/0x100
> [   63.316870]  search_binary_handler+0x56/0x1f0
> [   63.317726]  __do_execve_file+0x655/0x7f0
> [   63.318367]  sys_execve+0x26/0x30
> [   63.318890]  do_int80_syscall_32+0x50/0x130
> [   63.319529]  entry_INT80_32+0x112/0x117
> [   63.320152] EIP: 0x77d31864
> [   63.320606] Code: Bad RIP value.
> [   63.321189] EAX: ffffffda EBX: 0050149c ECX: 00501440 EDX: 0050144c
> [   63.322273] ESI: 00501440 EDI: 0050149c EBP: 004f515f ESP: 7fdd5e88
> [   63.323259] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.324357] ---[ end trace 99280caf5c6a62e3 ]---
> [   63.330230] ------------[ cut here ]------------
> [   63.330230] ------------[ cut here ]------------
> [   63.331091] WARNING: CPU: 1 PID: 286 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> [   63.332630] Modules linked in:
> [   63.333176] CPU: 1 PID: 286 Comm: rcS Tainted: G        W       T 5.5.=
0-rc5-00001-ga875b364ebe64 #1
> [   63.335413] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   63.336815] EIP: unlink_anon_vmas+0x138/0x170
> [   63.337542] Code: 00 01 00 00 c7 42 0c 22 01 00 00 e8 72 27 02 00 8d 4=
3 08 8b 4b 08 89 da 39 f0 8d 59 f8 75 b3 83 c4 0c 5b 5e 5f 5d c3 8d 76 00 <=
0f> 0b eb ae 8d 74 26 00 0f 0b 83 c0 04 e8 96 cb e7 ff e9 0f ff ff
> [   63.340616] EAX: efceec30 EBX: ef793340 ECX: 00000001 EDX: efcedc80
> [   63.341661] ESI: ef793348 EDI: efceec98 EBP: ef3cddfc ESP: ef3cdde4
> [   63.342620] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [   63.343667] CR0: 80050033 CR2: 77d3185a CR3: 6f164000 CR4: 00040690
> [   63.344640] Call Trace:
> [   63.345079]  free_pgtables+0xa2/0x100
> [   63.345705]  exit_mmap+0x98/0x160
> [   63.346192]  mmput+0x6a/0x110
> [   63.346471]  flush_old_exec+0x4e7/0x790
> [   63.346826]  load_elf_binary+0x312/0x10ea
> [   63.347197]  ? find_held_lock+0x2b/0xa0
> [   63.347547]  ? lock_release+0x30/0x210
> [   63.347891]  ? preempt_count_sub+0x98/0x100
> [   63.348274]  search_binary_handler+0x56/0x1f0
> [   63.348734]  __do_execve_file+0x655/0x7f0
> [   63.349101]  sys_execve+0x26/0x30
> [   63.349406]  do_int80_syscall_32+0x50/0x130
> [   63.349789]  entry_INT80_32+0x112/0x117
> [   63.350159] EIP: 0x77d31864
> [   63.350426] Code: Bad RIP value.
> [   63.350725] EAX: ffffffda EBX: 0050149c ECX: 00501440 EDX: 0050144c
> [   63.351287] ESI: 00501440 EDI: 0050149c EBP: 004f515f ESP: 7fdd5e88
> [   63.351848] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000=
206
> [   63.352457] ---[ end trace 99280caf5c6a62e4 ]---
> [   63.353024] ------------[ cut here ]------------
> [   63.353024] ------------[ cut here ]------------
> [   63.353458] WARNING: CPU: 1 PID: 286 at mm/rmap.c:434 unlink_anon_vmas=
+0x138/0x170
> =

>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start a875b364ebe64baa45d10bd92278b1c81c2a2412 c79f46a282390e0=
f5b306007bf7b11a46d529538 --
> # first bad commit: [a875b364ebe64baa45d10bd92278b1c81c2a2412] mm/rmap: f=
ix reusing mergeable anon_vma as parent when fork
> git bisect good c79f46a282390e0f5b306007bf7b11a46d529538  # 15:25  G     =
30     0    0   3  Linux 5.5-rc5
> # extra tests with debug options
> git bisect good a875b364ebe64baa45d10bd92278b1c81c2a2412  # 16:23  G     =
10     0   10  10  mm/rmap: fix reusing mergeable anon_vma as parent when f=
ork
> # extra tests on head commit of linux-review/Konstantin-Khlebnikov/mm-rma=
p-fix-reusing-mergeable-anon_vma-as-parent-when-fork/20200106-210625
> git bisect  bad a875b364ebe64baa45d10bd92278b1c81c2a2412  # 16:37  B     =
 0    13   32   0  mm/rmap: fix reusing mergeable anon_vma as parent when f=
ork
> # bad: [a875b364ebe64baa45d10bd92278b1c81c2a2412] mm/rmap: fix reusing me=
rgeable anon_vma as parent when fork
> # extra tests on revert first bad commit
> git bisect good fc540c23cfb67790d2571027ece8a16fe804ab2e  # 21:14  G     =
10     0    0   0  Revert "mm/rmap: fix reusing mergeable anon_vma as paren=
t when fork"
> # good: [fc540c23cfb67790d2571027ece8a16fe804ab2e] Revert "mm/rmap: fix r=
eusing mergeable anon_vma as parent when fork"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>=20
--===============4611432118116507182==--

