Content-Type: multipart/mixed; boundary="===============3738268512655578977=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 68c37ccedc: BUG:kernel_hang_in_early-boot_stage, last_printk:early_console_in_setup_code
Date: Mon, 29 Oct 2018 15:47:11 -0700
Message-ID: <20181029154711.df59cb8d6150a55f5cfef67d@linux-foundation.org>
In-Reply-To: <20181029131501.GP24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3738268512655578977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Oct 2018 21:15:01 +0800 kernel test robot <rong.a.chen@intel.c=
om> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 68c37ccedcde10514898f4ba3b28c0de85c590d1 ("mm: nobootmem: remove =
bootmem allocation APIs")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

>
> +------------------------------------------------------------------------=
-----+------------+------------+
> |                                                                        =
     | 6881a1e729 | 68c37ccedc |
> +------------------------------------------------------------------------=
-----+------------+------------+
> | boot_successes                                                         =
     | 4          | 0          |
> | boot_failures                                                          =
     | 0          | 4          |
> | BUG:kernel_hang_in_early-boot_stage,last_printk:early_console_in_setup_=
code | 0          | 4          |
> +------------------------------------------------------------------------=
-----+------------+------------+

Well that's irritating.

Does the problem remain when the entire patch series is applied?

mm-remove-config_no_bootmem.patch
mm-remove-config_no_bootmem-fix.patch
mm-remove-config_have_memblock.patch
mm-remove-config_have_memblock-fix.patch
mm-remove-config_have_memblock-fix-2.patch
mm-remove-config_have_memblock-fix-3.patch
mm-remove-bootmem-allocator-implementation.patch
mm-nobootmem-remove-dead-code.patch
memblock-rename-memblock_alloc_nid_try_nid-to-memblock_phys_alloc.patch
memblock-remove-_virt-from-apis-returning-virtual-address.patch
memblock-replace-alloc_bootmem_align-with-memblock_alloc.patch
memblock-replace-alloc_bootmem_low-with-memblock_alloc_low.patch
memblock-replace-__alloc_bootmem_node_nopanic-with-memblock_alloc_try_nid_n=
opanic.patch
memblock-replace-alloc_bootmem_pages_nopanic-with-memblock_alloc_nopanic.pa=
tch
memblock-replace-alloc_bootmem_low-with-memblock_alloc_low-2.patch
memblock-replace-__alloc_bootmem_nopanic-with-memblock_alloc_from_nopanic.p=
atch
memblock-add-align-parameter-to-memblock_alloc_node.patch
memblock-replace-alloc_bootmem_pages_node-with-memblock_alloc_node.patch
memblock-replace-__alloc_bootmem_node-with-appropriate-memblock_-api.patch
memblock-replace-alloc_bootmem_node-with-memblock_alloc_node.patch
memblock-replace-alloc_bootmem_low_pages-with-memblock_alloc_low.patch
memblock-replace-alloc_bootmem_pages-with-memblock_alloc.patch
memblock-replace-__alloc_bootmem-with-memblock_alloc_from.patch
memblock-replace-alloc_bootmem-with-memblock_alloc.patch
mm-nobootmem-remove-bootmem-allocation-apis.patch
memblock-replace-free_bootmem_node-with-memblock_free.patch
memblock-replace-free_bootmem_late-with-memblock_free_late.patch
memblock-rename-free_all_bootmem-to-memblock_free_all.patch
memblock-rename-__free_pages_bootmem-to-memblock_free_pages.patch
mm-remove-nobootmem.patch
memblock-replace-bootmem_alloc_-with-memblock-variants.patch
mm-remove-include-linux-bootmemh.patch
mm-remove-include-linux-bootmemh-fix.patch
mm-remove-include-linux-bootmemh-fix-2.patch
mm-remove-include-linux-bootmemh-fix-3.patch
docs-boot-time-mm-remove-bootmem-documentation.patch


--===============3738268512655578977==--

