Content-Type: multipart/mixed; boundary="===============5190808549479034963=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: 31884286fd ("Merge 'kees/kspp/usercopy-whitelist/traced' into .."): kernel BUG at lib/list_debug.c:56!
Date: Sun, 27 Aug 2017 09:07:55 -0700
Message-ID: <CAGXu5jJhn5LoeUaqnr32gxouB3JJTFui=N7mLVnDrWb5U75fqg@mail.gmail.com>
In-Reply-To: <59a29780.QfSObuYNzmnsRDEZ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5190808549479034963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hurm, this seems unlikely to be an issue with the usercopy
whitelisting code. Are there known memory corruption issues with
djwong-xfs/djwong-wtf ?

Seeing list corruption tends to indicate some kind of use-after-free, usual=
ly...

-Kees

On Sun, Aug 27, 2017 at 2:57 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://internal_merge_and_test_tree devel-spot-201708270113
>
> commit 31884286fd62550500b108c8309f97d7994f4736
> Merge: 5b871802b6886 0f9a026be299d
> Author:     0day robot <fengguang.wu@intel.com>
> AuthorDate: Sun Aug 27 01:17:11 2017 +0800
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Sun Aug 27 01:17:11 2017 +0800
>
>     Merge 'kees/kspp/usercopy-whitelist/traced' into devel-spot-201708270=
113
>
> 5b871802b6  Merge 'djwong-xfs/djwong-wtf' into devel-spot-201708270113
> 0f9a026be2  sctp: Define usercopy region in SCTP proto slab cache
> 31884286fd  Merge 'kees/kspp/usercopy-whitelist/traced' into devel-spot-2=
01708270113
> 3fd3110aca  0day head guard for 'devel-spot-201708270113'
> +------------------------------------------+------------+------------+---=
---------+------------+
> |                                          | 5b871802b6 | 0f9a026be2 | 31=
884286fd | 3fd3110aca |
> +------------------------------------------+------------+------------+---=
---------+------------+
> | boot_successes                           | 53         | 55         | 0 =
         | 0          |
> | boot_failures                            | 0          | 0          | 33=
         | 35         |
> | kernel_BUG_at_lib/list_debug.c           | 0          | 0          | 32=
         | 32         |
> | invalid_opcode:#[##]                     | 0          | 0          | 32=
         | 32         |
> | EIP:__list_del_entry_valid               | 0          | 0          | 32=
         | 31         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 0          | 32=
         | 32         |
> | BUG:Bad_page_state_in_process            | 0          | 0          | 19=
         | 21         |
> | EIP:__list_add_valid                     | 0          | 0          | 0 =
         | 1          |
> +------------------------------------------+------------+------------+---=
---------+------------+
>
> [    2.502065] Freeing unused kernel memory: 740K
> [    2.502821] Write protecting the kernel text: 5244k
> [    2.503627] Write protecting the kernel read-only data: 2244k
> [    2.510951] list_del corruption. next->prev should be d58465cc, but wa=
s d55260a4
> [    2.512073] ------------[ cut here ]------------
> [    2.512739] kernel BUG at lib/list_debug.c:56!
> [    2.513584] invalid opcode: 0000 [#1] SMP
> [    2.514183] Modules linked in:
> [    2.514671] CPU: 1 PID: 85 Comm: hostname Not tainted 4.13.0-rc6-01609=
-g3188428 #2
> [    2.515744] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    2.517086] task: d6e7bd80 task.stack: d6570000
> [    2.517736] EIP: __list_del_entry_valid+0x63/0x69
> [    2.518400] EFLAGS: 00010082 CPU: 1
> [    2.518930] EAX: 00000044 EBX: d58465cc ECX: c18d2648 EDX: 00000001
> [    2.519751] ESI: d58465cc EDI: c17e3f80 EBP: d6571dd8 ESP: d6571dcc
> [    2.520575]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [    2.521317] CR0: 80050033 CR2: b7de0218 CR3: 16591000 CR4: 00000690
> [    2.522143] Call Trace:
> [    2.522569]  __list_del_entry+0xb/0x1c
> [    2.523130]  __rmqueue_smallest+0x59/0xdd
> [    2.523719]  __rmqueue+0x3a/0x24f
> [    2.524240]  ? list_add+0x13/0x26
> [    2.524749]  get_page_from_freelist+0x181/0x544
> [    2.525389]  __alloc_pages_nodemask+0xb9/0x178
> [    2.526414]  handle_mm_fault+0x26e/0x978
> [    2.527043]  __do_page_fault+0x205/0x3a0
> [    2.527684]  trace_do_page_fault+0x52/0xcc
> [    2.528302]  ? kvm_read_and_reset_pf_reason+0x28/0x28
> [    2.529004]  do_async_page_fault+0x28/0x4e
> [    2.529595]  common_exception+0x64/0x6e
> [    2.530171] EIP: 0xb7fb84c9
> [    2.530628] EFLAGS: 00010282 CPU: 1
> [    2.531167] EAX: b7df5384 EBX: b7fc8ff4 ECX: 00000000 EDX: b7de0210
> [    2.531990] ESI: b7dee158 EDI: 0d696913 EBP: bfdc35f8 ESP: bfdc3560
> [    2.532812]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b
> [    2.533550]  ? kvm_read_and_reset_pf_reason+0x28/0x28
> [    2.534249] Code: d6 ff 0f 0b 8b 09 39 c8 74 0e 51 50 68 48 d5 6e c1 e=
8 30 bb d6 ff 0f 0b 8b 52 04 39 d0 74 0e 52 50 68 84 d5 6e c1 e8 1b bb d6 f=
f <0f> 0b b0 01 c9 c3 55 89 e5 57 56 53 83 ec 10 89 45 ec 89 4d e8
> [    2.536635] EIP: __list_del_entry_valid+0x63/0x69 SS:ESP: 0068:d6571dcc
> [    2.537498] ---[ end trace 38718c321412d601 ]---
> [    2.538156] Kernel panic - not syncing: Fatal exception
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 3fd3110aca7a65e27dbbb533c0c9af186060820e 14ccee78fc82f55=
12908f4424f541549a5705b89 --
> git bisect good 067574361b0f8f6462f957f40b67b819a64fd56d  # 09:18  G     =
11     0    0   0  Merge 'nsekhar-davinci/master' into devel-spot-201708270=
113
> git bisect  bad c06737a913bb85449819213402c69d3693128d7c  # 10:11  B     =
 0    11   24   0  Merge 'linux-review/Pavel-Belous/net-ethernet-aquantia-A=
tlantic-driver-Update-2017-08-23/20170826-060725' into devel-spot-201708270=
113
> git bisect good 0d44fd1512a847983cab1a5fad40c71e4133e3f4  # 10:29  G     =
11     0    0   0  Merge 'jeffmerkey/master' into devel-spot-201708270113
> git bisect good 5b871802b6886cb517b4bdf4c3caa8bee98c6aad  # 11:15  G     =
11     0    0   0  Merge 'djwong-xfs/djwong-wtf' into devel-spot-2017082701=
13
> git bisect  bad 31884286fd62550500b108c8309f97d7994f4736  # 12:11  B     =
 0    11   32   8  Merge 'kees/kspp/usercopy-whitelist/traced' into devel-s=
pot-201708270113
> git bisect good 5a86d20c59fcc0c2be671a8ab67b040dc45f535a  # 12:55  G     =
11     0    0   0  befs: Define usercopy region in befs_inode_cache slab ca=
che
> git bisect good 0f3f0137b53a9b6e0dab56b6e080f70fa38299b4  # 13:53  G     =
11     0    0   0  cifs: Define usercopy region in cifs_request slab cache
> git bisect good 0da6504b66c41239073b517a1a04b5893c542b4f  # 14:49  G     =
11     0    0   0  ip: Define usercopy region in IP proto slab cache
> git bisect good 0f9a026be299d30f0bef274eac743c8837490bdb  # 16:14  G     =
11     0    0   0  sctp: Define usercopy region in SCTP proto slab cache
> # first bad commit: [31884286fd62550500b108c8309f97d7994f4736] Merge 'kee=
s/kspp/usercopy-whitelist/traced' into devel-spot-201708270113
> git bisect good 5b871802b6886cb517b4bdf4c3caa8bee98c6aad  # 17:19  G     =
31     0    0   0  Merge 'djwong-xfs/djwong-wtf' into devel-spot-2017082701=
13
> git bisect good 0f9a026be299d30f0bef274eac743c8837490bdb  # 17:50  G     =
31     0    0   0  sctp: Define usercopy region in SCTP proto slab cache
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 31884286fd62550500b108c8309f97d7994f4736  # 17:50  B     =
 0    19   37   5  Merge 'kees/kspp/usercopy-whitelist/traced' into devel-s=
pot-201708270113
> # extra tests on HEAD of linux-devel/devel-spot-201708270113
> git bisect  bad 3fd3110aca7a65e27dbbb533c0c9af186060820e  # 17:55  B     =
 0    31   51   4  0day head guard for 'devel-spot-201708270113'
> # extra tests on tree/branch linux-devel/devel-spot-201708270113
> git bisect  bad 3fd3110aca7a65e27dbbb533c0c9af186060820e  # 17:56  B     =
 0    31   51   4  0day head guard for 'devel-spot-201708270113'
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Kees Cook
Pixel Security

--===============5190808549479034963==--

