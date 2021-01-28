Content-Type: multipart/mixed; boundary="===============5813018252869006846=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Thu, 28 Jan 2021 18:42:21 +0106
Message-ID: <871re5m0a2.fsf@jogness.linutronix.de>
In-Reply-To: <YBLoGNQNMkFivh34@alley>
List-Id: <oe-lkp.lists.linux.dev>

--===============5813018252869006846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-28, Petr Mladek <pmladek@suse.com> wrote:
>> [  903.189448][  T356] [  778.825864] [  655.250559] [  531.607066] [  4=
07.120936] tasks-torture:torture_onoff task: online 0 failed: errno -5
>> =

>> These multi-timestamp lines are odd. And they are almost exactly 124
>> seconds apart.
>
> Yup, this looks suspicious.
>
> Here are my few ideas. Feel free to ignore them and do your own
> debugging. I do not want to distract you.
>
> The test produces the same messages over and over again. It is
> possible that something has overflown after some amount of messages.
> And the regular intervals are just a coincidence.
>
> Are all messages broken this way? Or does it start later?

They are all OK until about 325 seconds. From the console output I see
that a couple seconds before there is:

[  324.855442] 2021-01-28 17:26:24 rmmod rcutorture

> Are this exact messages printed correctly at some points?

Yes. Although once the multi-timestamps show up, there are empty lines
after the correct printing. These have a different timestamp, so I am
thinking they are probably failed prb_reserve() descriptors.

[  324.817659] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  324.826111] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  324.855442] 2021-01-28 17:26:24 rmmod rcutorture
[  324.855454]
[  324.867910] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  324.875689] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  324.886632] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  324.894394] tasks-torture:torture_onoff task: online 0 failed: errno -5
...
[  325.270579] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  325.278558] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  325.292705] [  167.091786] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.292716]
[  325.298241] [  167.098621] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.298251]
[  325.302613] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  325.319995] [  167.105552] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.320006]
[  325.325588] [  167.120620] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.325597]
[  325.335480] [  167.131624] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.335490]
[  325.346576] tasks-torture:torture_onoff task: online 0 failed: errno -5
[  325.357828] [  167.138722] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.357840]
[  325.362434] [  167.157591] tasks-torture:torture_onoff task: online 0 fa=
iled: errno -5
[  325.362445]

> Is this console output? Or dmesg?

Console output. I still need to figure out how to get at dmesg from
lkp. In particular, the output from /dev/kmsg would be quite
interesting.

> Are you able to reproduce it with the current Linus's master.
> I wonder if it is something that we have already fixed.

Unfortunately when I switch to Linus's master, the error messages go
away. So it probably won't trigger.

However, I did forward port all printk changes and I am still seeing the
same behavior.

I think once I get at /dev/kmsg, there should be some clarity.

John Ogness
--===============5813018252869006846==--

