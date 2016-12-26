Content-Type: multipart/mixed; boundary="===============7011130069763177393=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [mm, memcg] d18e2b2aca: WARNING:at_mm/memcontrol.c:#mem_cgroup_update_lru_size
Date: Mon, 26 Dec 2016 13:50:55 +0100
Message-ID: <20161226125055.GC20715@dhcp22.suse.cz>
In-Reply-To: <20161226122651.GA20715@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7011130069763177393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 26-12-16 13:26:51, Michal Hocko wrote:
> On Mon 26-12-16 06:25:56, kernel test robot wrote:
[...]
> > [   95.226364] init: tty6 main process (990) killed by TERM signal
> > [   95.314020] init: plymouth-upstart-bridge main process (1039) termin=
ated with status 1
> > [   97.588568] ------------[ cut here ]------------
> > [   97.594364] WARNING: CPU: 0 PID: 1055 at mm/memcontrol.c:1032 mem_cg=
roup_update_lru_size+0xdd/0x12b
> > [   97.606654] mem_cgroup_update_lru_size(40297f00, 0, -1): lru_size 1 =
but empty
> > [   97.615140] Modules linked in:
> > [   97.618834] CPU: 0 PID: 1055 Comm: killall5 Not tainted 4.9.0-mm1-00=
095-gd18e2b2 #82
> > [   97.628008] Call Trace:
> > [   97.631025]  dump_stack+0x16/0x18
> > [   97.635107]  __warn+0xaf/0xc6
> > [   97.638729]  ? mem_cgroup_update_lru_size+0xdd/0x12b
> =

> Do you have the full backtrace?

It's not needed. I found the bug in my patch and it should be fixed by
the updated patch http://lkml.kernel.org/r/20161226124839.GB20715(a)dhcp22.=
suse.cz
-- =

Michal Hocko
SUSE Labs

--===============7011130069763177393==--

