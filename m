Content-Type: multipart/mixed; boundary="===============6495430571433730476=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 17:30:02 +0900
Message-ID: <YBJ2CjN2YntC1o3j@jagdpanzerIV.localdomain>
In-Reply-To: <87bldaaxcc.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6495430571433730476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (21/01/27 22:28), John Ogness wrote:
> =

> # modprobe rcutorture onoff_interval=3D3 onoff_holdoff=3D30 torture_type=
=3Dtasks
> =

> (Those are the same modprobe parameters used by the lkp job.)
> =

> After about a minute I see:
> =

> [   47.268292] tasks-torture: rcu_torture_read_exit: Start of episode
> [   51.273365] tasks-torture: rcu_torture_read_exit: End of episode
> [   55.823306] smpboot: do_boot_cpu failed(-1) to wakeup CPU#0
> [   55.824350] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [   55.830661] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [   55.848524] tasks-torture:torture_onoff task: online 0 failed: errno -5

Just out of curious, this is seen only with the printk commit in
question applied? do_boot_cpu() doesn't seem to call a lot of printk-s,
only pr_debug("Setting warm reset code and vector.\n"), as far as I can
tell.

I can't repro this on my arm64 board. Maybe it's too slow. Race condition?

	-ss
--===============6495430571433730476==--

