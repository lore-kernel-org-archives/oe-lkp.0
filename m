Content-Type: multipart/mixed; boundary="===============8260708197142149827=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/memory_hotplug] 3072e413e3: page_allocation_failure:order:#, mode:#(GFP_KERNEL|__GFP_RETRY_MAYFAIL|__GFP_ZERO), nodemask=(null)
Date: Thu, 04 Jan 2018 14:43:29 +0100
Message-ID: <20180104134329.GD2801@dhcp22.suse.cz>
In-Reply-To: <20180104054930.GB23834@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8260708197142149827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 04-01-18 13:49:30, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 3072e413e305e353cd4654f8a57d953b66e85bf3 ("mm/memory_hotplug: int=
roduce add_pages")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I do not see how this patch could have made any difference. It merely
reorganizes the code. It doesn't change any logic wrt. to the
devm_memremap_pages which keeps using arch_add_memory obviously.
Besides that it is not really unusual to see order 9 allocations
failing. I haven't checked whether this is really what should be done
for nvme path because they should be allocating struct pages backed by
the nvme directly AFAIR but again that shouldn't be changed by the above
commit so this is likely a false positive.

[...]
> [    6.268581] systemd-udevd: page allocation failure: order:9, mode:0x14=
084c0(GFP_KERNEL|__GFP_RETRY_MAYFAIL|__GFP_ZERO), nodemask=3D(null)
> [    6.270880] systemd-udevd cpuset=3D/ mems_allowed=3D0
> [    6.271638] CPU: 0 PID: 1811 Comm: systemd-udevd Tainted: G           =
O    4.13.0-09235-g3072e41 #1
> [    6.273289] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    6.274930] Call Trace:
> [    6.275644]  dump_stack+0x8e/0xc8
> [    6.276289]  warn_alloc+0xe4/0x165
> [    6.276922]  ? find_next_bit+0xb/0xd
> [    6.277579]  __alloc_pages_nodemask+0xe1a/0xef1
> [    6.278476]  vmemmap_alloc_block+0x43/0x84
> [    6.279224]  alloc_block_buf+0x15/0x3a
> [    6.280040]  __vmemmap_alloc_block_buf+0x12b/0x13e
> [    6.280798]  vmemmap_populate+0x115/0x2ed
> [    6.281487]  sparse_mem_map_populate+0x27/0x38
> [    6.282230]  sparse_add_one_section+0x76/0x15b
> [    6.282949]  __add_pages+0x122/0x211
> [    6.283607]  add_pages+0x1a/0x68
> [    6.284227]  arch_add_memory+0x43/0x4b
> [    6.284888]  devm_memremap_pages+0x27a/0x396
> [    6.285596]  __wrap_devm_memremap_pages+0x50/0x59 [nfit_test_iomap]
> [    6.286467]  pmem_attach_disk+0x305/0x4e4 [nd_pmem]
> [    6.287223]  ? kfree_const+0x20/0x23
> [    6.287868]  ? kobject_put+0x165/0x16d
> [    6.288531]  ? put_device+0x17/0x1a
> [    6.289169]  nd_pmem_probe+0x8f/0x94 [nd_pmem]
> [    6.289889]  nvdimm_bus_probe+0x6c/0x10b [libnvdimm]
> [    6.290653]  driver_probe_device+0x1d4/0x3cb
> [    6.291359]  __driver_attach+0xbb/0xde
> [    6.292018]  ? driver_probe_device+0x3cb/0x3cb
> [    6.292738]  ? driver_probe_device+0x3cb/0x3cb
> [    6.293456]  bus_for_each_dev+0x6d/0x85
> [    6.294121]  driver_attach+0x1e/0x20
> [    6.294771]  bus_add_driver+0x13b/0x222
> [    6.295440]  driver_register+0x88/0xbf
> [    6.296098]  ? 0xffffffffa0005000
> [    6.296724]  __nd_driver_register+0x75/0x7c [libnvdimm]
> [    6.297506]  ? 0xffffffffa0005000
> [    6.298129]  pmem_init+0x1e/0x1000 [nd_pmem]
> [    6.298834]  do_one_initcall+0x90/0x131
> [    6.299503]  ? kmem_cache_alloc_trace+0xc9/0x179
> [    6.300290]  ? do_init_module+0x27/0x1dd
> [    6.300964]  do_init_module+0x5f/0x1dd
> [    6.301627]  load_module+0x1ae2/0x20ea
> [    6.302291]  ? kernel_read+0x43/0x55
> [    6.302936]  SyS_finit_module+0xb8/0xc5
> [    6.303606]  ? SyS_finit_module+0xb8/0xc5
> [    6.304291]  do_syscall_64+0x69/0xee
> [    6.304936]  entry_SYSCALL64_slow_path+0x25/0x25
> [    6.305670] RIP: 0033:0x7ff6c5c940f9
> [    6.306316] RSP: 002b:00007ffcd9b9da98 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [    6.307594] RAX: ffffffffffffffda RBX: 0000562413ad7ed0 RCX: 00007ff6c=
5c940f9
> [    6.308535] RDX: 0000000000000000 RSI: 00007ff6c65ac265 RDI: 000000000=
000000f
> [    6.309477] RBP: 00007ff6c65ac265 R08: 0000000000000000 R09: 00007ffcd=
9b9e010
> [    6.310416] R10: 000000000000000f R11: 0000000000000246 R12: 000000000=
0000000
> [    6.311360] R13: 0000562413acfc70 R14: 0000000000020000 R15: 000056241=
2068924
> [    6.312319] Mem-Info:
> [    6.360020] active_anon:15233 inactive_anon:2237 isolated_anon:0
> [    6.360020]  active_file:4 inactive_file:3 isolated_file:0
> [    6.360020]  unevictable:106641 dirty:0 writeback:0 unstable:0
> [    6.360020]  slab_reclaimable:6418 slab_unreclaimable:2577
> [    6.360020]  mapped:3538 shmem:2265 pagetables:696 bounce:0
> [    6.360020]  free:62722 free_pcp:128 free_cma:51196
> [    6.372019] Node 0 active_anon:61340kB inactive_anon:8948kB active_fil=
e:16kB inactive_file:12kB unevictable:426564kB isolated(anon):0kB isolated(=
file):0kB mapped:14152kB dirty:0kB writeback:0kB shmem:9060kB shmem_thp: 0k=
B shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB unstable:0kB all_unr=
eclaimable? no
> [    6.375805] Node 0 DMA free:3520kB min:788kB low:984kB high:1180kB act=
ive_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictabl=
e:0kB writepending:0kB present:15992kB managed:15908kB mlocked:0kB kernel_s=
tack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> [    6.388022] lowmem_reserve[]: 0 656 656 656 656
-- =

Michal Hocko
SUSE Labs

--===============8260708197142149827==--

