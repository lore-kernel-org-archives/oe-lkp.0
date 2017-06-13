Content-Type: multipart/mixed; boundary="===============7566295307999615386=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [random] 2beeae6409:
Date: Tue, 13 Jun 2017 12:42:11 +0800
Message-ID: <20170613044211.fzvkjylo5gbuxyee@wfg-t540p.sh.intel.com>
In-Reply-To: <20170612150806.roubtzjg42hcgm4a@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7566295307999615386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Sorry it's a false report. I'll explain below.

On Mon, Jun 12, 2017 at 11:08:06AM -0400, Theodore Ts'o wrote:
>On Mon, Jun 12, 2017 at 10:18:52AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>>
>> commit 2beeae6409f4de00545ce0ff7fb0653d4559aa4c
>	...
>> +-------------------------------------------------+------------+--------=
----+---------------+
>> |                                                 | ee415ae09e | 2beeae6=
409 | next-20170609 |
>> +-------------------------------------------------+------------+--------=
----+---------------+
>> | boot_successes                                  | 33         | 4      =
    | 0             |
>> | boot_failures                                   | 0          | 0      =
    | 7             |
>> | BUG:kernel_reboot-without-warning_in_test_stage | 0          | 0      =
    | 7             |
>> +-------------------------------------------------+------------+--------=
----+---------------+
>
>Hi Fungguang,
>
>I'm confused.  The attached dmesg shows the following, but none of
>this looks like it has anything to do with changes to
>drivers/char/random.c:

This report is caused by these new lines earlier in the dmesg:

[   10.342960] random: key_alloc+0x22d/0x351 get_random_bytes called with c=
rng_init =3D 0
[   10.342960] random: key_alloc+0x22d/0x351 get_random_bytes called with c=
rng_init =3D 0
[   10.346809] random: batadv_tp_meter_init+0x15/0x17 get_random_bytes call=
ed with crng_init =3D 0
[   10.346809] random: batadv_tp_meter_init+0x15/0x17 get_random_bytes call=
ed with crng_init =3D 0

Here the bisect uses string "key_alloc+0x" to tell whether the dmesg
is good/bad, because that looks like part of a call trace dump.

I'll fix it by making the call trace pattern detection more strict.

Regards,
Fengguang

>Kernel tests: Boot OK!
>[   19.211173] rcu-perf: rcu_perf_writer 0 has 100 measurements
>[   19.211173] rcu-perf: rcu_perf_writer 0 has 100 measurements
>[   19.331072] rcu-perf: Test complete
>[   19.331072] rcu-perf: Test complete
>Sending all processes the KILL signal...
>Unmounting remote filesystems...
>Deactivating swap...
>Unmounting local filesystems...
>Rebooting...
>[   83.132709] Unregister pv shared memory for cpu 0
>[   83.132709] Unregister pv shared memory for cpu 0
>[   83.133794] rcu-torture: Unscheduled system shutdown detected
>[   83.133794] rcu-torture: Unscheduled system shutdown detected
>[   83.136197] reboot: Restarting system
>[   83.136197] reboot: Restarting system
>[   83.136949] reboot: machine restart
>[   83.136949] reboot: machine restart
>
>Elapsed time: 90
>
>None of the changes in the random tree should be affecting when the
>test scripts decide to kick off a shutdown, and this looks like it was
>initiated by the init scripts deciding it was time to shut down.
>
>	     	      	      	       - Ted

--===============7566295307999615386==--

