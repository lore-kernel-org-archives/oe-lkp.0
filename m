Content-Type: multipart/mixed; boundary="===============7929657265925499057=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [bpf] 755e5d5536: BUG:Bad_page_map_in_process
Date: Wed, 13 Jan 2021 10:58:16 -0800
Message-ID: <20210113185816.GA359892@carbon.DHCP.thefacebook.com>
In-Reply-To: <20210112132751.GB30747@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7929657265925499057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:27:51PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 755e5d55367af5ff75a4db9b6cf439416878e2c7 ("bpf: Eliminate rlimit-=
based memory accounting for hashtab maps")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/ =

> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------+-----------=
-+------------+
> |                                                            | 844f157f6c=
 | 755e5d5536 |
> +------------------------------------------------------------+-----------=
-+------------+
> | BUG:Bad_page_map_in_process                                | 0         =
 | 9          |
> | BUG:Bad_page_state_in_process                              | 0         =
 | 9          |
> | BUG:Bad_rss-counter_state_mm:(ptrval)type:MM_FILEPAGES_val | 0         =
 | 1          |
> | BUG:Bad_rss-counter_state_mm:#type:MM_FILEPAGES_val        | 0         =
 | 8          |
> | WARNING:at_mm/vmalloc.c:#vmap_pte_range                    | 0         =
 | 3          |
> | EIP:vmap_pte_range                                         | 0         =
 | 3          |
> | BUG:unable_to_handle_page_fault_for_address                | 0         =
 | 1          |
> | Oops:#[##]                                                 | 0         =
 | 1          |
> | EIP:free_percpu                                            | 0         =
 | 1          |
> | EIP:__rb_reserve_next                                      | 0         =
 | 1          |
> | WARNING:at_mm/percpu-vm.c:#__pcpu_balance_workfn           | 0         =
 | 1          |
> | EIP:__pcpu_balance_workfn                                  | 0         =
 | 1          |
> | WARNING:at_mm/vmalloc.c:#unmap_kernel_range_noflush        | 0         =
 | 1          |
> | EIP:unmap_kernel_range_noflush                             | 0         =
 | 1          |
> +------------------------------------------------------------+-----------=
-+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

I've tried to reproduce the problem on two different machines running the t=
est case many times,
but haven't succeed yet. I wonder though, if it's the same problem as descr=
ibed and fixed by
commit e1868b9e36d0 ("bpf: Avoid overflows involving hash elem_size").

Thanks!
--===============7929657265925499057==--

