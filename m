Content-Type: multipart/mixed; boundary="===============7747334840004708787=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 12:32:46 +0106
Message-ID: <87czxpmhe1.fsf@jogness.linutronix.de>
In-Reply-To: <YBJ2CjN2YntC1o3j@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============7747334840004708787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-28, Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:
>> # modprobe rcutorture onoff_interval=3D3 onoff_holdoff=3D30 torture_type=
=3Dtasks
>> =

>> (Those are the same modprobe parameters used by the lkp job.)
>> =

>> After about a minute I see:
>> =

>> [   47.268292] tasks-torture: rcu_torture_read_exit: Start of episode
>> [   51.273365] tasks-torture: rcu_torture_read_exit: End of episode
>> [   55.823306] smpboot: do_boot_cpu failed(-1) to wakeup CPU#0
>> [   55.824350] tasks-torture:torture_onoff task: online 0 failed: errno =
-5
>> [   55.830661] tasks-torture:torture_onoff task: online 0 failed: errno =
-5
>> [   55.848524] tasks-torture:torture_onoff task: online 0 failed: errno =
-5
>
> Just out of curious, this is seen only with the printk commit in
> question applied?

No. The error messages are not related to the commit. But they are
really the only thing printk'ing when the rcu stall happens. So you
probably do need to see them in order to reproduce this. (Assuming this
is somehow printk related.)

John Ogness

--===============7747334840004708787==--

