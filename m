Content-Type: multipart/mixed; boundary="===============6612007369508836445=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [torture] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Thu, 18 Sep 2014 21:17:51 +0800
Message-ID: <20140918131751.GA8797@localhost>
In-Reply-To: <20140917161704.GZ4723@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6612007369508836445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> > > > plymouth-upstart-bridge: ply-event-loop.c:497: ply_event_loop_new: =
Assertion `loop->epoll_fd >=3D 0' failed.
> > > > /etc/lsb-base-logging.sh: line 5:  2580 Aborted                 ply=
mouth --ping > /dev/null 2>&1
> > > > /etc/lsb-base-logging.sh: line 5:  2585 Aborted                 ply=
mouth --ping > /dev/null 2>&1
> > > > mount: proc has wrong device number or fs type proc not supported
> > > > /etc/lsb-base-logging.sh: line 5:  2601 Aborted                 ply=
mouth --ping > /dev/null 2>&1
> > > > /etc/rc6.d/S40umountfs: line 20: /proc/mounts: No such file or dire=
ctory
> > > > cat: /proc/1/maps: No such file or directory
> > > > cat: /proc/1/maps: No such file or directory
> > > > cat: /proc/1/maps: No such file or directory
> > > > cat: /proc/1/maps: No such file or directory
> > > > cat: /proc/1/maps: No such file or directory
> > > > cat: /proc/1/maps: No such file or directory
> > > > umount: /var/run: not mounted
> > > > umount: /var/lock: not mounted
> > > > umount: /dev/shm: not mounted
> > > > mount: / is busy
> > > >  * Will now restart
> =

> Are these expected behavior?

Yes, because it's randconfig boot tests, the user space may well
complain about random stuff and I'll ignore them all as long as it
will eventually call the shutdown command to finish the test in time.  :)

> So again, I can invoke this commit without losing much (sendkey
> alt-sysrq-z is after all my friend), but it is not clear to me that we
> have gotten to the root of this problem.

Sorry about that! If you see any debug tricks that I can try, or
information I can collect, please let me know.

Regards,
Fengguang

--===============6612007369508836445==--

