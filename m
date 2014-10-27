Content-Type: multipart/mixed; boundary="===============2836028457903993806=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: kernel_boot_hang mode:0x10d0
Date: Sun, 26 Oct 2014 19:51:44 -0700
Message-ID: <1414378304.15751.26.camel@perches.com>
In-Reply-To: <20141027020415.GC27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2836028457903993806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-10-27 at 10:04 +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> commit eea203fea3484598280a07fe503e025e886297fb ("rcu: Use pr_alert/pr_co=
nt for printing logs")
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | 188c=
1e896c | eea203fea3 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 2          |
> | boot_failures                                                    | 15  =
       | 13         |
> | page_allocation_failure:order:,mode:x10d0                        | 15  =
       | 13         |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 15  =
       |            |
> | backtrace:ring_buffer_consumer_thread                            | 15  =
       | 13         |
> | backtrace:rcu_torture_stats                                      | 15  =
       |            |
> | BUG:kernel_boot_hang                                             | 0   =
       | 13         |
> +------------------------------------------------------------------+-----=
-------+------------+

I've no good idea why this change should cause any issue.



--===============2836028457903993806==--

