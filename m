Content-Type: multipart/mixed; boundary="===============2187890343394321704=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [KEYS] 98f7748967: BUG:unable_to_handle_kernel
Date: Mon, 08 May 2017 11:42:08 -0700
Message-ID: <20170508184208.GA105690@google.com>
In-Reply-To: <20170508012316.GH28430@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2187890343394321704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2017 at 09:23:16AM +0800, kernel test robot wrote:
> [   16.476188] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [   16.478886] IP: memset_erms+0x9/0x10
> [   16.480180] PGD a9a067 =

> [   16.480181] PUD a9b067 =

> [   16.481283] PMD 0 =

> [   16.482389] =

> [   16.484358] Oops: 0002 [#1] SMP
> [   16.485573] Modules linked in: pptp gre l2tp_ppp l2tp_netlink l2tp_cor=
e ip6_udp_tunnel udp_tunnel pppoe pppox ppp_generic slhc nfnetlink scsi_tra=
nsport_iscsi dccp_ipv6 atm sctp dccp_ipv4 dccp
> [   16.490424] CPU: 0 PID: 311 Comm: trinity-c2 Not tainted 4.11.0-rc4-00=
106-g98f7748 #1
> [   16.493066] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   16.496072] task: ffff8800195425c0 task.stack: ffffc90000338000
> [   16.499768] RIP: 0010:memset_erms+0x9/0x10
> [   16.501145] RSP: 0018:ffffc9000033bea8 EFLAGS: 00010246
> [   16.502717] RAX: ffffffffffffff00 RBX: 0000000000000000 RCX: 000000000=
0000001
> [   16.504650] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000000000=
0000000
> [   16.506550] RBP: ffffc9000033beb8 R08: 0000000000000020 R09: 000000000=
0000000
> [   16.508420] R10: 8080808080808080 R11: fefefefefefefeff R12: fffffffff=
fffff82
> [   16.510312] R13: 0000000000000000 R14: 0000000000000000 R15: fffffffff=
fffff82
> [   16.512193] FS:  0000000000000000(0000) GS:ffff88000be00000(0063) knlG=
S:0000000009cf1840
> [   16.514822] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   16.516468] CR2: 0000000000000000 CR3: 0000000000a99000 CR4: 000000000=
01406f0
> [   16.518369] Call Trace:
> [   16.519468]  ? memzero_explicit+0x12/0x20
> [   16.520838]  SyS_add_key+0x14c/0x1f0
> [   16.522133]  do_fast_syscall_32+0xab/0x250
> [   16.523508]  entry_SYSENTER_compat+0x4c/0x5b
> [   16.524913] RIP: 0023:0xf77d5c99
> [   16.526137] RSP: 002b:00000000ffccaf0c EFLAGS: 00000292 ORIG_RAX: 0000=
00000000011e
> [   16.544091] RAX: ffffffffffffffda RBX: 00000000080ecb3d RCX: 000000000=
0000000
> [   16.545969] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000001=
02100a5
> [   16.547857] RBP: 0000000040000000 R08: 0000000000000000 R09: 000000000=
0000000
> [   16.549732] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   16.551615] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   16.553491] Code: 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 0=
1 48 0f af c6 f3 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d=
1 <f3> aa 4c 89 c8 c3 90 49 89 fa 40 0f b6 ce 48 b8 01 01 01 01 01 =

> [   16.558559] RIP: memset_erms+0x9/0x10 RSP: ffffc9000033bea8
> [   16.560177] CR2: 0000000000000000
> [   16.561464] ---[ end trace 9432180228dd30ad ]---

Nice to see this is getting tested!  David, as I've said previously, and as=
 I
noted in the commit message itself, this cannot be applied until "KEYS: fix
dereferencing NULL payload with nonzero length" has also been applied.

- Eric

--===============2187890343394321704==--

