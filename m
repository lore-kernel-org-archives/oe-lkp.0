Content-Type: multipart/mixed; boundary="===============2306063475754029697=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] ca6fb06518: general protection fault: 0000 [#1] SMP
Date: Thu, 08 Oct 2015 04:52:18 -0700
Message-ID: <CANn89iKjNPT+osoyVpLKRMM1Lh=AJ4MMfojM2DmtKLQ9tw+vpA@mail.gmail.com>
In-Reply-To: <87r3l5x6nd.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2306063475754029697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2015 at 10:37 PM, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit ca6fb06518836ef9b65dc0aac02ff97704d52a05 ("tcp: attach SYNACK mess=
ages to request sockets instead of listener")
>
>
> +----------------------------------------------------------------+-------=
-----+------------+
> |                                                                | 1b33bc=
3e9e | ca6fb06518 |
> +----------------------------------------------------------------+-------=
-----+------------+
> | boot_successes                                                 | 36    =
     | 11         |
> | boot_failures                                                  | 0     =
     | 47         |
> | general_protection_fault:#[##]SMP                              | 0     =
     | 17         |
> | RIP:selinux_ip_postroute_compat                                | 0     =
     | 47         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt          | 0     =
     | 42         |
> | backtrace:__net_random_once_deferred                           | 0     =
     | 3          |
> | BUG:unable_to_handle_kernel                                    | 0     =
     | 30         |
> | Oops                                                           | 0     =
     | 30         |
> | backtrace:cpu_startup_entry                                    | 0     =
     | 25         |
> | backtrace:do_mount                                             | 0     =
     | 17         |
> | backtrace:SyS_mount                                            | 0     =
     | 17         |
> | backtrace:rpc_clone_client_set_auth                            | 0     =
     | 9          |
> | backtrace:nfs_init_server_rpcclient                            | 0     =
     | 9          |
> | backtrace:smpboot_thread_fn                                    | 0     =
     | 3          |
> | backtrace:nfs4_discover_server_trunking                        | 0     =
     | 2          |
> | backtrace:nfs4_init_client                                     | 0     =
     | 2          |
> | WARNING:at_arch/x86/kernel/smp.c:#native_smp_send_reschedule() | 0     =
     | 1          |
> | backtrace:security_inode_alloc                                 | 0     =
     | 2          |
> | backtrace:inode_init_always                                    | 0     =
     | 2          |
> +----------------------------------------------------------------+-------=
-----+------------+
>
>

Thanks for the report, I am cooking a fix.

--===============2306063475754029697==--

