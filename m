Content-Type: multipart/mixed; boundary="===============5535059727681259505=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tools/bpf] 8c417dc15f: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Sat, 27 Jan 2018 07:44:45 -0800
Message-ID: <cdcb21e8-a492-2559-c221-98faae34040c@fb.com>
In-Reply-To: <20180127080436.GB10097@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5535059727681259505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Thanks for reporting. This issue has been fixed by the below commit in =

bpf-next repo, which is waiting to be pulled into net-next.

=3D=3D=3D=3D=3D
commit 2310035fa03f651dd5b03f19a26a97512aa8842c
Author: Yonghong Song <yhs@fb.com>
Date:   Mon Jan 22 22:53:51 2018 -0800

     bpf: fix incorrect kmalloc usage in lpm_trie MAP_GET_NEXT_KEY rcu =

region

     In commit b471f2f1de8b ("bpf: implement MAP_GET_NEXT_KEY command =

for LPM_TRIE map"),
     the implemented MAP_GET_NEXT_KEY callback function is guarded with =

rcu read lock.
     In the function body, "kmalloc(size, GFP_USER | __GFP_NOWARN)" is =

used which may
     sleep and violate rcu read lock region requirements. This patch =

fixed the issue
     by using GFP_ATOMIC instead to avoid blocking kmalloc. Tested with
     CONFIG_DEBUG_ATOMIC_SLEEP=3Dy as suggested by Eric Dumazet.

     Fixes: b471f2f1de8b ("bpf: implement MAP_GET_NEXT_KEY command for =

LPM_TRIE map")
     Signed-off-by: Yonghong Song <yhs@fb.com>
     Reported-by: syzbot <syzkaller@googlegroups.com>
     Reviewed-by: Eric Dumazet <edumazet@google.com>
     Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
=3D=3D=3D=3D=3D=3D

Thanks!


On 1/27/18 12:04 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 8c417dc15f9522672795981dcb63d9099ca6bd8c ("tools/bpf: add a testc=
ase for MAP_GET_NEXT_KEY command of LPM_TRIE map")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------------------+--=
----------+------------+
> |                                                                     | b=
471f2f1de | 8c417dc15f |
> +---------------------------------------------------------------------+--=
----------+------------+
> | boot_successes                                                      | 0=
          | 0          |
> | boot_failures                                                       | 8=
          | 8          |
> | invoked_oom-killer:gfp_mask=3D0x                                      |=
 4          | 4          |
> | Mem-Info                                                            | 4=
          | 4          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes    | 4=
          | 4          |
> | BUG:sleeping_function_called_from_invalid_context_at_lib/usercopy.c | 4=
          |            |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h      | 0=
          | 4          |
> +---------------------------------------------------------------------+--=
----------+------------+
> =

> =

> =

> [  275.143042] BUG: sleeping function called from invalid context at mm/s=
lab.h:419
> [  275.146347] in_atomic(): 1, irqs_disabled(): 0, pid: 7020, name: test_=
lpm_map
> [  275.148889] CPU: 0 PID: 7020 Comm: test_lpm_map Not tainted 4.15.0-rc8=
-01647-g8c417dc #1
> [  275.151961] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [  275.155015] Call Trace:
> [  275.156181]  dump_stack+0x5c/0x7b
> [  275.157563]  ___might_sleep+0xf1/0x110
> [  275.159078]  __kmalloc+0x178/0x210
> [  275.160459]  trie_get_next_key+0x57/0x2a0
> [  275.162019]  ? _cond_resched+0x19/0x30
> [  275.163494]  ? __kmalloc+0x17d/0x210
> [  275.165010]  SyS_bpf+0xdbb/0x14b0
> [  275.166359]  ? _cond_resched+0x19/0x30
> [  275.167851]  entry_SYSCALL_64_fastpath+0x20/0x83
> [  275.169616] RIP: 0033:0x7fce862efe19
> [  275.171053] RSP: 002b:00007ffccbb62668 EFLAGS: 00000202
> [  275.183028] test_lpm: OK
> [  275.184984]
> [  275.188333] ok 1..5 selftests: test_lpm_map [PASS]
> [  275.188338]
> [  275.191610] selftests: test_progs
> [  275.191615]
> [  275.208854] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  275.208859]
> [  275.731322] libbpf: incorrect bpf_call opcode
> [  275.731329]
> [  275.739681] libbpf: incorrect bpf_call opcode
> [  275.739687]
> [  275.768456] test_pkt_access:PASS:ipv4 165 nsec
> [  275.768463]
> [  275.775864] test_pkt_access:PASS:ipv6 162 nsec
> [  275.775869]
> [  275.783113] test_xdp:PASS:ipv4 4283 nsec
> [  275.783251]
> [  275.798987] test_xdp:PASS:ipv6 1919 nsec
> [  275.798992]
> [  275.811095] test_l4lb:PASS:ipv4 1860 nsec
> [  275.811248]
> [  275.820459] test_l4lb:PASS:ipv6 3139 nsec
> [  275.820464]
> [  275.825614] test_tcp_estats:PASS: 0 nsec
> [  275.825618]
> [  275.831543] test_bpf_obj_id:PASS:get-fd-by-notexist-prog-id 0 nsec
> [  275.831548]
> [  275.838707] test_bpf_obj_id:PASS:get-fd-by-notexist-map-id 0 nsec
> [  275.838712]
> [  275.845485] test_bpf_obj_id:PASS:get-map-info(fd) 0 nsec
> [  275.845490]
> [  275.851833] test_bpf_obj_id:PASS:get-prog-info(fd) 0 nsec
> [  275.851838]
> [  275.858121] test_bpf_obj_id:PASS:get-map-info(fd) 0 nsec
> [  275.858126]
> [  275.862282] test_bpf_obj_id:PASS:get-prog-info(fd) 0 nsec
> [  275.862286]
> [  275.866722] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.866726]
> [  275.871573] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.871577]
> [  275.876121] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.876125]
> [  275.880766] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.880769]
> [  275.885053] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.885057]
> [  275.889288] test_bpf_obj_id:PASS:get-prog-fd-bad-nr-map-ids 0 nsec
> [  275.889291]
> [  275.894180] test_bpf_obj_id:PASS:get-prog-info(next_id->fd) 0 nsec
> [  275.894184]
> [  275.900509] test_bpf_obj_id:PASS:get-prog-fd(next_id) 0 nsec
> [  275.900513]
> [  275.905233] test_bpf_obj_id:PASS:get-prog-fd-bad-nr-map-ids 0 nsec
> [  275.905236]
> [  275.910550] test_bpf_obj_id:PASS:get-prog-info(next_id->fd) 0 nsec
> [  275.910554]
> [  275.917881] test_bpf_obj_id:PASS:check total prog id found by get_next=
_id 0 nsec
> [  275.917885]
> [  275.926199] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.926205]
> [  275.932417] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.932422]
> [  275.937351] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.937356]
> [  275.942885] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.942891]
> [  275.947970] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.947975]
> [  275.953278] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.953283]
> [  275.958715] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.958720]
> [  275.963666] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.963671]
> [  275.968511] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.968516]
> [  275.973634] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.973639]
> [  275.979036] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> [  275.979041]
> [  275.984546] test_bpf_obj_id:PASS:check get-map-info(next_id->fd) 0 nsec
> [  275.984551]
> [  275.990201] test_bpf_obj_id:PASS:get-map-fd(next_id) 0 nsec
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
> =

> =

> =

> Thanks,
> Xiaolong
>=20

--===============5535059727681259505==--

