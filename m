Content-Type: multipart/mixed; boundary="===============4550472000780385742=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Sat, 23 Jan 2021 11:44:42 +0900
Message-ID: <YAuNmjUDhNbiYn0b@jagdpanzerIV.localdomain>
In-Reply-To: <20210122081311.GA12834@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4550472000780385742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (21/01/22 16:13), kernel test robot wrote:
[..]
> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 6b916706f8 | b031a684b=
f |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 66         | 18       =
  |
> | boot_failures                                  | 2          | 26       =
  |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks   | 1          |          =
  |
> | RIP:enqueue_hrtimer                            | 1          |          =
  |
> | RIP:__memset                                   | 1          |          =
  |
> | RIP:clear_page_rep                             | 2          | 2        =
  |
> | BUG:kernel_hang_in_boot_stage                  | 2          |          =
  |
> | INFO:rcu_sched_self-detected_stall_on_CPU      | 1          | 4        =
  |
> | INFO:rcu_tasks_detected_stalls_on_tasks        | 0          | 22       =
  |
> | RIP:kernel_init_free_pages                     | 0          | 1        =
  |
> | IP-Config:Auto-configuration_of_network_failed | 0          | 3        =
  |
> | RIP:zone_page_state                            | 0          | 1        =
  |
> +------------------------------------------------+------------+----------=
--+


A side note:

> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4


Could you please keep CONFIG_PRINTK_CALLER enabled at all times?

	-ss
--===============4550472000780385742==--

