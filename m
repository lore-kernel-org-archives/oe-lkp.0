Content-Type: multipart/mixed; boundary="===============4007149917098023297=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 15:51:50 +0100
Message-ID: <YBLPhkHQ8cXFiY1X@alley>
In-Reply-To: <87czxpmhe1.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4007149917098023297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 2021-01-28 12:32:46, John Ogness wrote:
> On 2021-01-28, Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:
> >> # modprobe rcutorture onoff_interval=3D3 onoff_holdoff=3D30 torture_ty=
pe=3Dtasks
> >> =

> >> (Those are the same modprobe parameters used by the lkp job.)
> >> =

> >> After about a minute I see:
> >> =

> >> [   47.268292] tasks-torture: rcu_torture_read_exit: Start of episode
> >> [   51.273365] tasks-torture: rcu_torture_read_exit: End of episode
> >> [   55.823306] smpboot: do_boot_cpu failed(-1) to wakeup CPU#0
> >> [   55.824350] tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
> >> [   55.830661] tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
> >> [   55.848524] tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
> >
> > Just out of curious, this is seen only with the printk commit in
> > question applied?
> =

> No. The error messages are not related to the commit. But they are
> really the only thing printk'ing when the rcu stall happens. So you
> probably do need to see them in order to reproduce this. (Assuming this
> is somehow printk related.)

If you are able to reproduce this, it might be interesting to see
backtraces from all CPUs when RCU stall gets detected. Or even printing
all processes, even the sleeping ones.

I am still curious how this could be printk() related.

Best Regards,
Petr
--===============4007149917098023297==--

