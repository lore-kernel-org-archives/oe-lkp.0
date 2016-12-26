Content-Type: multipart/mixed; boundary="===============4922717500639964758=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [mm, memcg] d18e2b2aca: WARNING:at_mm/memcontrol.c:#mem_cgroup_update_lru_size
Date: Mon, 26 Dec 2016 13:26:51 +0100
Message-ID: <20161226122651.GA20715@dhcp22.suse.cz>
In-Reply-To: <20161225222556.GH19366@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4922717500639964758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 26-12-16 06:25:56, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: d18e2b2aca0396849f588241e134787a829c707d ("mm, memcg: fix (Re: OO=
M: Better, but still there on)")
> url: https://github.com/0day-ci/linux/commits/Michal-Hocko/mm-memcg-fix-R=
e-OOM-Better-but-still-there-on/20161223-225057
> base: git://git.cmpxchg.org/linux-mmotm.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -m 360M
> =

> caused below changes:
> =

> =

> +--------------------------------------------------------+------------+--=
----------+
> |                                                        | c7d85b880b | d=
18e2b2aca |
> +--------------------------------------------------------+------------+--=
----------+
> | boot_successes                                         | 8          | 0=
          |
> | boot_failures                                          | 0          | 2=
          |
> | WARNING:at_mm/memcontrol.c:#mem_cgroup_update_lru_size | 0          | 2=
          |
> | kernel_BUG_at_mm/memcontrol.c                          | 0          | 2=
          |
> | invalid_opcode:#[##]DEBUG_PAGEALLOC                    | 0          | 2=
          |
> | Kernel_panic-not_syncing:Fatal_exception               | 0          | 2=
          |
> +--------------------------------------------------------+------------+--=
----------+
> =

> =

> =

> [   95.226364] init: tty6 main process (990) killed by TERM signal
> [   95.314020] init: plymouth-upstart-bridge main process (1039) terminat=
ed with status 1
> [   97.588568] ------------[ cut here ]------------
> [   97.594364] WARNING: CPU: 0 PID: 1055 at mm/memcontrol.c:1032 mem_cgro=
up_update_lru_size+0xdd/0x12b
> [   97.606654] mem_cgroup_update_lru_size(40297f00, 0, -1): lru_size 1 bu=
t empty
> [   97.615140] Modules linked in:
> [   97.618834] CPU: 0 PID: 1055 Comm: killall5 Not tainted 4.9.0-mm1-0009=
5-gd18e2b2 #82
> [   97.628008] Call Trace:
> [   97.631025]  dump_stack+0x16/0x18
> [   97.635107]  __warn+0xaf/0xc6
> [   97.638729]  ? mem_cgroup_update_lru_size+0xdd/0x12b

Do you have the full backtrace?
-- =

Michal Hocko
SUSE Labs

--===============4922717500639964758==--

