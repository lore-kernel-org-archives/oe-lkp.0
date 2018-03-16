Content-Type: multipart/mixed; boundary="===============4963624003350788506=="
MIME-Version: 1.0
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] b33ddf50eb: INFO:trying_to_register_non-static_key
Date: Fri, 16 Mar 2018 17:38:06 +0100
Message-ID: <7a638500-ce14-809a-6b40-79f32537b818@linux.vnet.ibm.com>
In-Reply-To: <20180316102359.pzjwi24hbkhnyk2a@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============4963624003350788506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/03/2018 11:23, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b33ddf50ebcc740b990dd2e0e8ff0b92c7acf58e ("mm: Protect mm_rb tree=
 with a rwlock")
> url: https://github.com/0day-ci/linux/commits/Laurent-Dufour/Speculative-=
page-faults/20180316-151833
> =

> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------+------------+------------+
> |                                        | 7f3f7b4e80 | b33ddf50eb |
> +----------------------------------------+------------+------------+
> | boot_successes                         | 8          | 0          |
> | boot_failures                          | 0          | 6          |
> | INFO:trying_to_register_non-static_key | 0          | 6          |
> +----------------------------------------+------------+------------+
> =

> =

> =

> [   22.218186] INFO: trying to register non-static key.
> [   22.220252] the code is fine but needs lockdep annotation.
> [   22.222471] turning off the locking correctness validator.
> [   22.224839] CPU: 0 PID: 1 Comm: init Not tainted 4.16.0-rc4-next-20180=
309-00017-gb33ddf5 #1
> [   22.228528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   22.232443] Call Trace:
> [   22.234234]  dump_stack+0x85/0xbc
> [   22.236085]  register_lock_class+0x237/0x477
> [   22.238057]  __lock_acquire+0xd0/0xf15
> [   22.240032]  lock_acquire+0x19c/0x1ce
> [   22.241927]  ? do_mmap+0x3aa/0x3ff
> [   22.243749]  mmap_region+0x37a/0x4c0
> [   22.245619]  ? do_mmap+0x3aa/0x3ff
> [   22.247425]  do_mmap+0x3aa/0x3ff
> [   22.249175]  vm_mmap_pgoff+0xa1/0xea
> [   22.251083]  elf_map+0x6d/0x134
> [   22.252873]  load_elf_binary+0x56f/0xe07
> [   22.254853]  search_binary_handler+0x75/0x1f8
> [   22.256934]  do_execveat_common+0x661/0x92b
> [   22.259164]  ? rest_init+0x22e/0x22e
> [   22.261082]  do_execve+0x1f/0x21
> [   22.262884]  kernel_init+0x5a/0xf0
> [   22.264722]  ret_from_fork+0x3a/0x50
> [   22.303240] systemd[1]: RTC configured in localtime, applying delta of=
 480 minutes to system time.
> [   22.313544] systemd[1]: Failed to insert module 'autofs4': No such fil=
e or directory

Thanks a lot for reporting this.

I found the issue introduced in that patch.
I mistakenly remove in the call to seqcount_init(&vma->vm_sequence) in
__vma_link_rb().
This doesn't have a functional impact as the vm_sequence is incremented
monotonically.

I'll fix that in the next series.

Laurent.


--===============4963624003350788506==--

