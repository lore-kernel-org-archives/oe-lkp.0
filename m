Content-Type: multipart/mixed; boundary="===============5620613956504468004=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 659cf9f582: WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Fri, 17 Feb 2017 12:47:26 +0800
Message-ID: <20170217044726.wuu43u5ixrfiuhb6@wfg-t540p.sh.intel.com>
In-Reply-To: <20170126101937.GY6515@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5620613956504468004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Jan 26, 2017 at 11:19:37AM +0100, Peter Zijlstra wrote:
>On Thu, Jan 26, 2017 at 11:20:55AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> [    0.000000]                locking mismatches:  ok  |  ok  |  ok  |
>> [    0.000000]                  EDEADLK handling:
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:305 __ww=
_mutex_wakeup_for_backoff+0x62/0xf4
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.0-rc3-00143-=
g659cf9f #1
>> [    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.9.3-20161025_171302-gandalf 04/01/2014
>> [    0.000000] Call Trace:
>> [    0.000000]  dump_stack+0x19/0x27
>> [    0.000000]  __warn+0xbf/0xe1
>> [    0.000000]  warn_slowpath_null+0x1d/0x2a
>>
>
>(Just to remind you, truncated WARNs are very very annoying, this one
>for example doesn't show anything useful in the call trace).

I just fixed the incomplete dmesg, thank you for pointing it out!

Regards,
Fengguang

--===============5620613956504468004==--

