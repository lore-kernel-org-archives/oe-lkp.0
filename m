Content-Type: multipart/mixed; boundary="===============0248986273296500808=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 5413d1babe: INFO: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected ]
Date: Tue, 03 May 2016 20:11:29 -0700
Message-ID: <CANn89iLfXKir_8+dX2DhCnm4uE2OLasi+HFp3-AF_mm2YLfS_Q@mail.gmail.com>
In-Reply-To: <20160504024754.GA3752@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0248986273296500808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2016 at 7:47 PM, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 5413d1babe8f10de13d72496c12b862eef8ba613 ("net: do not block BH wh=
ile processing socket backlog")
>
> on test machine: vm-lkp-wsx03-1G: 1 threads qemu-system-x86_64 -enable-kv=
m -cpu host with 1G memory
>
> caused below changes:
>
>
> [   35.296699] mount.nfs (3510) used greatest stack depth: 11536 bytes le=
ft
> [   42.600792]
> [   42.601632] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   42.603227] [ INFO: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected=
 ]
> [   42.606492] 4.6.0-rc5-01190-g5413d1b #1 Not tainted
> [   42.607747] ------------------------------------------------------
> [   42.609227] wget/3661 [HC0[0]:SC0[2]:HE1:SE0] is trying to acquire:
> [   42.610880]  (&(&tcp_hashinfo.bhash[i].lock)->rlock){+.+...}, at: [<ff=
ffffff81bb184c>] __inet_twsk_hashdance+0x52/0x11d
> [   42.613890]
> [   42.613890] and this task is already holding:
> [   42.615802]  (slock-AF_INET){+.-...}, at: [<ffffffff81bb7ca1>] tcp_clo=
se+0x134/0x3ba
> [   42.618697] which would create a new lock dependency:
> [   42.620137]  (slock-AF_INET){+.-...} -> (&(&tcp_hashinfo.bhash[i].lock=
)->rlock){+.+...}
> [   42.623119]
> [   42.623119] but this new dependency connects a SOFTIRQ-irq-safe lock:
> [   42.625296]  (slock-AF_INET){+.-...}
> ... which became SOFTIRQ-irq-safe at:
> [   42.627562]   [<ffffffff810e9da5>] __lock_acquire+0x970/0x192a
> [   42.629139]   [<ffffffff810eb59d>] lock_acquire+0x188/0x223
> [   42.630562]   [<ffffffff81cb4064>] _raw_spin_lock+0x34/0x6a
> [   42.632030]   [<ffffffff81bd3a82>] udp_queue_rcv_skb+0x204/0x4e8
> [   42.633558]   [<ffffffff81bd45d8>] __udp4_lib_rcv+0x872/0x9ce
> [   42.634980]   [<ffffffff81bd4aa9>] udp_rcv+0x1a/0x1c
> [   42.636301]   [<ffffffff81ba7ccd>] ip_local_deliver_finish+0x1aa/0x329
> [   42.637836]   [<ffffffff81ba853a>] ip_local_deliver+0xb8/0xbf
> [   42.639277]   [<ffffffff81ba82e2>] ip_rcv_finish+0x496/0x4ca
> [   42.640702]   [<ffffffff81ba8818>] ip_rcv+0x2d7/0x333
> [   42.642039]   [<ffffffff81b4674f>] __netif_receive_skb_core+0x6a9/0x811
> [   42.643647]   [<ffffffff81b46eba>] __netif_receive_skb+0x1d/0x5f
> [   42.645141]   [<ffffffff81b46fc2>] netif_receive_skb_internal+0xc6/0x1=
87
> [   42.646697]   [<ffffffff81b48203>] napi_gro_receive+0x15c/0x224
> [   42.648221]   [<ffffffff8192ce2d>] e1000_clean_rx_irq+0x374/0x3f5
> [   42.649722]   [<ffffffff8192c0ab>] e1000_clean+0x521/0x6b5
> [   42.651121]   [<ffffffff81b4866d>] net_rx_action+0x12f/0x422
> [   42.652545]   [<ffffffff81cb7997>] __do_softirq+0x207/0x4d0
> [   42.654067]   [<ffffffff810a4948>] run_ksoftirqd+0x25/0x62
> [   42.655477]   [<ffffffff810c1bce>] smpboot_thread_fn+0x1cc/0x1e3
> [   42.656953]   [<ffffffff810be641>] kthread+0xfb/0x103
> [   42.658296]   [<ffffffff81cb4ef2>] ret_from_fork+0x22/0x50
> [   42.659725]
> [   42.659725] to a SOFTIRQ-irq-unsafe lock:
> [   42.661558]  (&(&tcp_hashinfo.bhash[i].lock)->rlock){+.+...}
> ... which became SOFTIRQ-irq-unsafe at:
> [   42.664127] ...  [<ffffffff810e9e17>] __lock_acquire+0x9e2/0x192a
> [   42.665706]   [<ffffffff810eb59d>] lock_acquire+0x188/0x223
> [   42.667116]   [<ffffffff81cb4064>] _raw_spin_lock+0x34/0x6a
> [   42.668668]   [<ffffffff81bb184c>] __inet_twsk_hashdance+0x52/0x11d
> [   42.670170]   [<ffffffff81bc9fca>] tcp_time_wait+0x1da/0x210
> [   42.671770]   [<ffffffff81bbdba0>] tcp_fin+0x70/0x370
> [   42.673109]   [<ffffffff81bbe187>] tcp_data_queue+0x2e7/0xab9
> [   42.674552]   [<ffffffff81bbfd97>] tcp_rcv_state_process+0xae1/0xc22
> [   42.676071]   [<ffffffff81bc6780>] tcp_v4_do_rcv+0x106/0x14f
> [   42.677501]   [<ffffffff81b313b1>] release_sock+0xd2/0x1bb
> [   42.678915]   [<ffffffff81bb7c88>] tcp_close+0x11b/0x3ba
> [   42.680287]   [<ffffffff81bdcb5e>] inet_release+0x52/0x59
> [   42.681761]   [<ffffffff81b2b672>] sock_release+0x1f/0x78
> [   42.683215]   [<ffffffff81b2b6dd>] sock_close+0x12/0x16
> [   42.684679]   [<ffffffff811ee737>] __fput+0x10d/0x1c6
> [   42.686024]   [<ffffffff811ee826>] ____fput+0xe/0x10
> [   42.687342]   [<ffffffff810bd199>] task_work_run+0x67/0x90
> [   42.688760]   [<ffffffff810a2571>] do_exit+0x556/0xb30
> [   42.690108]   [<ffffffff810a3de1>] do_group_exit+0x4a/0xb5
> [   42.691505]   [<ffffffff810a3e60>] __wake_up_parent+0x0/0x28
> [   42.692926]   [<ffffffff81cb4cbc>] entry_SYSCALL_64_fastpath+0x1f/0xbd
> [   42.694459]
> [   42.694459] other info that might help us debug this:
> [   42.694459]
> [   42.697180]  Possible interrupt unsafe locking scenario:
> [   42.697180]
> [   42.699260]        CPU0                    CPU1
> [   42.700448]        ----                    ----
> [   42.701627]   lock(&(&tcp_hashinfo.bhash[i].lock)->rlock);
> [   42.703104]                                local_irq_disable();
> [   42.704490]                                lock(slock-AF_INET);
> [   42.706017]                                lock(&(&tcp_hashinfo.bhash[=
i].lock)->rlock);
> [   42.708427]   <Interrupt>
> [   42.709351]     lock(slock-AF_INET);
> [   42.710586]
> [   42.710586]  *** DEADLOCK ***
> [   42.710586]
> [   42.712967] 1 lock held by wget/3661:
> [   42.714042]  #0:  (slock-AF_INET){+.-...}, at: [<ffffffff81bb7ca1>] tc=
p_close+0x134/0x3ba
> [   42.716659]
> the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
> [   42.718884] -> (slock-AF_INET){+.-...} ops: 163 {
> [   42.720519]    HARDIRQ-ON-W at:
> [   42.721609]                     [<ffffffff810e9df5>] __lock_acquire+0x=
9c0/0x192a
> [   42.723853]                     [<ffffffff810eb59d>] lock_acquire+0x18=
8/0x223
> [   42.725475]                     [<ffffffff81cb41a8>] _raw_spin_lock_bh=
+0x3c/0x72
> [   42.727632]                     [<ffffffff81b30e0e>] lock_sock_nested+=
0x3b/0x9a
> [   42.729803]                     [<ffffffff81b33330>] sock_setsockopt+0=
x21e/0x8f9
> [   42.731979]                     [<ffffffff81b2e515>] SyS_setsockopt+0x=
63/0x9e
> [   42.733607]                     [<ffffffff81cb4cbc>] entry_SYSCALL_64_=
fastpath+0x1f/0xbd
> [   42.735936]    IN-SOFTIRQ-W at:
> [   42.737020]                     [<ffffffff810e9da5>] __lock_acquire+0x=
970/0x192a
> [   42.739196]                     [<ffffffff810eb59d>] lock_acquire+0x18=
8/0x223
> [   42.740869]                     [<ffffffff81cb4064>] _raw_spin_lock+0x=
34/0x6a
> [   42.742503]                     [<ffffffff81bd3a82>] udp_queue_rcv_skb=
+0x204/0x4e8
> [   42.744687]                     [<ffffffff81bd45d8>] __udp4_lib_rcv+0x=
872/0x9ce
> [   42.746838]                     [<ffffffff81bd4aa9>] udp_rcv+0x1a/0x1c
> [   42.748380]                     [<ffffffff81ba7ccd>] ip_local_deliver_=
finish+0x1aa/0x329
> [   42.750655]                     [<ffffffff81ba853a>] ip_local_deliver+=
0xb8/0xbf
> [   42.752827]                     [<ffffffff81ba82e2>] ip_rcv_finish+0x4=
96/0x4ca
> [   42.754986]                     [<ffffffff81ba8818>] ip_rcv+0x2d7/0x333
> [   42.756547]                     [<ffffffff81b4674f>] __netif_receive_s=
kb_core+0x6a9/0x811
> [   42.758830]                     [<ffffffff81b46eba>] __netif_receive_s=
kb+0x1d/0x5f
> [   42.760997]                     [<ffffffff81b46fc2>] netif_receive_skb=
_internal+0xc6/0x187
> [   42.763252]                     [<ffffffff81b48203>] napi_gro_receive+=
0x15c/0x224
> [   42.765407]                     [<ffffffff8192ce2d>] e1000_clean_rx_ir=
q+0x374/0x3f5
> [   42.767657]                     [<ffffffff8192c0ab>] e1000_clean+0x521=
/0x6b5
> [   42.769266]                     [<ffffffff81b4866d>] net_rx_action+0x1=
2f/0x422
> [   42.771401]                     [<ffffffff81cb7997>] __do_softirq+0x20=
7/0x4d0
> [   42.773017]                     [<ffffffff810a4948>] run_ksoftirqd+0x2=
5/0x62
> [   42.774619]                     [<ffffffff810c1bce>] smpboot_thread_fn=
+0x1cc/0x1e3
> [   42.776855]                     [<ffffffff810be641>] kthread+0xfb/0x103
> [   42.778408]                     [<ffffffff81cb4ef2>] ret_from_fork+0x2=
2/0x50
> [   42.780013]    INITIAL USE at:
> [   42.781094]                    [<ffffffff810e9e5d>] __lock_acquire+0xa=
28/0x192a
> [   42.783228]                    [<ffffffff810eb59d>] lock_acquire+0x188=
/0x223
> [   42.784825]                    [<ffffffff81cb41a8>] _raw_spin_lock_bh+=
0x3c/0x72
> [   42.786948]                    [<ffffffff81b30e0e>] lock_sock_nested+0=
x3b/0x9a
> [   42.789093]                    [<ffffffff81b33330>] sock_setsockopt+0x=
21e/0x8f9
> [   42.791251]                    [<ffffffff81b2e515>] SyS_setsockopt+0x6=
3/0x9e
> [   42.792853]                    [<ffffffff81cb4cbc>] entry_SYSCALL_64_f=
astpath+0x1f/0xbd
> [   42.795088]  }
> [   42.795898]  ... key      at: [<ffffffff83855d90>] af_family_slock_key=
s+0x10/0x160
> [   42.798089]  ... acquired at:
> [   42.799074]    [<ffffffff810e88b5>] check_irq_usage+0x55/0xaa
> [   42.800522]    [<ffffffff810ea742>] __lock_acquire+0x130d/0x192a
> [   42.801982]    [<ffffffff810eb59d>] lock_acquire+0x188/0x223
> [   42.803414]    [<ffffffff81cb4064>] _raw_spin_lock+0x34/0x6a
> [   42.804826]    [<ffffffff81bb184c>] __inet_twsk_hashdance+0x52/0x11d
> [   42.806340]    [<ffffffff81bc9fca>] tcp_time_wait+0x1da/0x210
> [   42.807780]    [<ffffffff81bb7db2>] tcp_close+0x245/0x3ba
> [   42.809185]    [<ffffffff81bdcb5e>] inet_release+0x52/0x59
> [   42.810584]    [<ffffffff81b2b672>] sock_release+0x1f/0x78
> [   42.811987]    [<ffffffff81b2b6dd>] sock_close+0x12/0x16
> [   42.813362]    [<ffffffff811ee737>] __fput+0x10d/0x1c6
> [   42.814790]    [<ffffffff811ee826>] ____fput+0xe/0x10
> [   42.816198]    [<ffffffff810bd199>] task_work_run+0x67/0x90
> [   42.817611]    [<ffffffff810a2571>] do_exit+0x556/0xb30
> [   42.818973]    [<ffffffff810a3de1>] do_group_exit+0x4a/0xb5
> [   42.820380]    [<ffffffff810a3e60>] __wake_up_parent+0x0/0x28
> [   42.821797]    [<ffffffff81cb4cbc>] entry_SYSCALL_64_fastpath+0x1f/0xbd
> [   42.823327]
> [   42.824105]
> the dependencies between the lock to be acquired and SOFTIRQ-irq-unsafe l=
ock:
> [   42.839607] -> (&(&tcp_hashinfo.bhash[i].lock)->rlock){+.+...} ops: 19=
 {
> [   42.841688]    HARDIRQ-ON-W at:
> [   42.842789]                     [<ffffffff810e9df5>] __lock_acquire+0x=
9c0/0x192a
> [   42.844954]                     [<ffffffff810eb59d>] lock_acquire+0x18=
8/0x223
> [   42.846581]                     [<ffffffff81cb41a8>] _raw_spin_lock_bh=
+0x3c/0x72
> [   42.848754]                     [<ffffffff81bb21b9>] inet_csk_get_port=
+0x78/0x435
> [   42.850925]                     [<ffffffff81bdcd6d>] inet_bind+0x148/0=
x1c6
> [   42.852524]                     [<ffffffff81b2ddd5>] SyS_bind+0x6a/0x97
> [   42.854078]                     [<ffffffff81cb4cbc>] entry_SYSCALL_64_=
fastpath+0x1f/0xbd
> [   42.856336]    SOFTIRQ-ON-W at:
> [   42.857425]                     [<ffffffff810e9e17>] __lock_acquire+0x=
9e2/0x192a
> [   42.859623]                     [<ffffffff810eb59d>] lock_acquire+0x18=
8/0x223
> [   42.861257]                     [<ffffffff81cb4064>] _raw_spin_lock+0x=
34/0x6a
> [   42.862881]                     [<ffffffff81bb184c>] __inet_twsk_hashd=
ance+0x52/0x11d
> [   42.865114]                     [<ffffffff81bc9fca>] tcp_time_wait+0x1=
da/0x210
> [   42.867351]                     [<ffffffff81bbdba0>] tcp_fin+0x70/0x370
> [   42.869032]                     [<ffffffff81bbe187>] tcp_data_queue+0x=
2e7/0xab9
> [   42.871183]                     [<ffffffff81bbfd97>] tcp_rcv_state_pro=
cess+0xae1/0xc22
> [   42.873565]                     [<ffffffff81bc6780>] tcp_v4_do_rcv+0x1=
06/0x14f
> [   42.875801]                     [<ffffffff81b313b1>] release_sock+0xd2=
/0x1bb
> [   42.877408]                     [<ffffffff81bb7c88>] tcp_close+0x11b/0=
x3ba
> [   42.878999]                     [<ffffffff81bdcb5e>] inet_release+0x52=
/0x59
> [   42.880606]                     [<ffffffff81b2b672>] sock_release+0x1f=
/0x78
> [   42.882205]                     [<ffffffff81b2b6dd>] sock_close+0x12/0=
x16
> [   42.883876]                     [<ffffffff811ee737>] __fput+0x10d/0x1c6
> [   42.885520]                     [<ffffffff811ee826>] ____fput+0xe/0x10
> [   42.887060]                     [<ffffffff810bd199>] task_work_run+0x6=
7/0x90
> [   42.889781]                     [<ffffffff810a2571>] do_exit+0x556/0xb=
30
> [   42.891522]                     [<ffffffff810a3de1>] do_group_exit+0x4=
a/0xb5
> [   42.893122]                     [<ffffffff810a3e60>] __wake_up_parent+=
0x0/0x28
> [   42.895331]                     [<ffffffff81cb4cbc>] entry_SYSCALL_64_=
fastpath+0x1f/0xbd
> [   42.897630]    INITIAL USE at:
> [   42.898709]                    [<ffffffff810e9e5d>] __lock_acquire+0xa=
28/0x192a
> [   42.900929]                    [<ffffffff810eb59d>] lock_acquire+0x188=
/0x223
> [   42.902664]                    [<ffffffff81cb41a8>] _raw_spin_lock_bh+=
0x3c/0x72
> [   42.904895]                    [<ffffffff81bb21b9>] inet_csk_get_port+=
0x78/0x435
> [   42.907129]                    [<ffffffff81bdcd6d>] inet_bind+0x148/0x=
1c6
> [   42.908721]                    [<ffffffff81b2ddd5>] SyS_bind+0x6a/0x97
> [   42.910250]                    [<ffffffff81cb4cbc>] entry_SYSCALL_64_f=
astpath+0x1f/0xbd
> [   42.912481]  }
> [   42.913278]  ... key      at: [<ffffffff8386e0e8>] __key.62185+0x0/0x8
> [   42.914811]  ... acquired at:
> [   42.915781]    [<ffffffff810e88b5>] check_irq_usage+0x55/0xaa
> [   42.917204]    [<ffffffff810ea742>] __lock_acquire+0x130d/0x192a
> [   42.918684]    [<ffffffff810eb59d>] lock_acquire+0x188/0x223
> [   42.920100]    [<ffffffff81cb4064>] _raw_spin_lock+0x34/0x6a
> [   42.921529]    [<ffffffff81bb184c>] __inet_twsk_hashdance+0x52/0x11d
> [   42.923031]    [<ffffffff81bc9fca>] tcp_time_wait+0x1da/0x210
> [   42.924463]    [<ffffffff81bb7db2>] tcp_close+0x245/0x3ba
> [   42.925839]    [<ffffffff81bdcb5e>] inet_release+0x52/0x59
> [   42.927229]    [<ffffffff81b2b672>] sock_release+0x1f/0x78
> [   42.928642]    [<ffffffff81b2b6dd>] sock_close+0x12/0x16
> [   42.930009]    [<ffffffff811ee737>] __fput+0x10d/0x1c6
> [   42.931477]    [<ffffffff811ee826>] ____fput+0xe/0x10
>
>

Hi

It looks the patch I sent earlier would fix this ?

https://patchwork.ozlabs.org/patch/618199/

Thanks !

--===============0248986273296500808==--

