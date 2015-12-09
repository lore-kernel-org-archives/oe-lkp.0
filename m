Content-Type: multipart/mixed; boundary="===============3578806214320651707=="
MIME-Version: 1.0
From: Josh Triplett <josh@joshtriplett.org>
To: lkp@lists.01.org
Subject: Re: [rcu] 52b265325b: WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_create_group+0x252/0x300()
Date: Tue, 08 Dec 2015 21:33:40 -0800
Message-ID: <20151209053339.GB9011@x>
In-Reply-To: <20151209051816.GV28602@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3578806214320651707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2015 at 09:18:16PM -0800, Paul E. McKenney wrote:
> On Wed, Dec 09, 2015 at 11:23:05AM +0800, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git r=
cu/dev
> > commit 52b265325b7a7438cbcdd735fecdd9d7e255eb83 ("rcu: Remove TINY_RCU =
bloat from pointless boot parameters")
> > =

> > =

> > +----------------+------------+------------+
> > |                | dc15c60e39 | 52b265325b |
> > +----------------+------------+------------+
> > | boot_successes | 4          | 0          |
> > +----------------+------------+------------+
> =

> Should be fixed in commit 79cfea027387.

What did you change in that version?

--===============3578806214320651707==--

