Content-Type: multipart/mixed; boundary="===============2401117642405206708=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 22:44:22 +0106
Message-ID: <87v9bglp2p.fsf@jogness.linutronix.de>
In-Reply-To: <871re5m0a2.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2401117642405206708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-28, John Ogness <john.ogness@linutronix.de> wrote:
> [  903.189448][  T356] [  778.825864] [  655.250559] [  531.607066] [  40=
7.120936] tasks-torture:torture_onoff task: online 0 failed: errno -5

So I at least found out what these multi-timestamp messages are (thanks
to reading /dev/kmsg). lkp is directing all its test output to
/dev/kmsg. This is why we see messages like:

  2021-01-28 21:15:15 rmmod rcutorture

The final line of its test is "dmesg | grep torture:". So it is dumping
dmesg output into /dev/kmsg! This causes the timestamp to be included in
the text of the new messages so we later see 2 timestamps. After 2
minutes it has reached the messages it fed into /dev/kmsg and feeds them
in again (thus a 3rd timestamp).

Here is a snippet from /dev/kmsg when it starts feeding dmesg into
/dev/kmsg. If the first number is >=3D 8, it is coming from userspace.

1,24066,323390711,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24067,323444452,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24068,323461363,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
13,24069,323469754,-;2021-01-28 21:15:15 rmmod rcutorture
12,24070,323469775,-;
1,24071,323481652,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24072,323495879,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24073,323503276,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24074,323510766,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
1,24075,323519658,-;tasks-torture:torture_onoff task: online 0 failed: errn=
o -5
13,24076,323522146,-;[  158.513122] tasks-torture:torture_onoff task: onlin=
e 0 failed: errno -5
12,24077,323522157,-;
13,24078,323526545,-;[  158.519672] tasks-torture:torture_onoff task: onlin=
e 0 failed: errno -5
12,24079,323526556,-;
13,24080,323529365,-;[  158.534695] tasks-torture:torture_onoff task: onlin=
e 0 failed: errno -5
12,24081,323529374,-;
13,24082,323531951,-;[  158.549755] tasks-torture:torture_onoff task: onlin=
e 0 failed: errno -5
12,24083,323531961,-;

I don't know why it is doing the message text with loglevel 5 (NOTICE)
followed by a blank line with loglevel 4 (WARNING), but they are
definitely coming from userspace.

Anyway, enough with that madness. I now will return my focus to the rcu
stall, and see how printk could be responsible.

John Ogness
--===============2401117642405206708==--

