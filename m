Content-Type: multipart/mixed; boundary="===============7248142867160275465=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
Date: Thu, 22 Jan 2015 10:55:48 +0900
Message-ID: <20150122015548.GD21444@js1304-P5Q-DELUXE>
In-Reply-To: <1421815115.6126.19.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7248142867160275465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 12:38:35PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit d2dc80750ee05ceb03c9b13b0531a782116d1ade ("mm/slub: optimize alloc=
/free fastpath by removing preemption on/off")
> =

> =

> +-------------------------------------------------------------+----------=
--+------------+
> |                                                             | 8e3233626=
9 | d2dc80750e |
> +-------------------------------------------------------------+----------=
--+------------+
> | boot_successes                                              | 8        =
  | 4          |
> | boot_failures                                               | 2        =
  | 16         |
> | WARNING:at_net/netlink/genetlink.c:#genl_unbind()           | 2        =
  | 5          |
> | backtrace:do_group_exit                                     | 2        =
  | 5          |
> | backtrace:SyS_exit_group                                    | 2        =
  | 5          |
> | BUG:using_smp_processor_id()in_preemptible[#]code:swapper   | 0        =
  | 6          |
> | backtrace:getname_kernel                                    | 0        =
  | 6          |
> | backtrace:run_init_process                                  | 0        =
  | 6          |
> | backtrace:do_execve                                         | 0        =
  | 6          |
> | BUG:using_smp_processor_id()in_preemptible[#]code:init      | 0        =
  | 1          |
> | backtrace:vfs_stat                                          | 0        =
  | 1          |
> | backtrace:SyS_stat64                                        | 0        =
  | 1          |
> | BUG:using_smp_processor_id()in_preemptible[#]code:kdevtmpfs | 0        =
  | 5          |
> | backtrace:devtmpfsd                                         | 0        =
  | 5          |
> | backtrace:security_inode_alloc                              | 0        =
  | 5          |
> | backtrace:inode_init_always                                 | 0        =
  | 5          |
> +-------------------------------------------------------------+----------=
--+------------+
> =


Hello,

I already sent the patch to fix the problem.

https://lkml.org/lkml/2015/1/19/17

Thanks for reporting.

Thanks.

--===============7248142867160275465==--

