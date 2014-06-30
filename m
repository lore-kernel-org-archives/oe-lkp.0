Content-Type: multipart/mixed; boundary="===============5326532857964863586=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [clockevents] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:281 clockevents_program_event()
Date: Mon, 30 Jun 2014 15:06:28 +0800
Message-ID: <53B10C74.4060409@intel.com>
In-Reply-To: <CAKohpomfxodayivDUriZKKgvQ7NnWGAYXc=2tAjMe9x2F8JfkA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5326532857964863586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/30/2014 12:40 PM, Viresh Kumar wrote:
> On 29 June 2014 20:28, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://bee.sh.intel.com/git/tchen37/linux.git test
>> commit 2f89103f5b85386245b434e8e9f66d25df929e65
>> Author:     Viresh Kumar <viresh.kumar@linaro.org>
>> AuthorDate: Tue Jun 10 13:52:25 2014 +0530
>> Commit:     Viresh Kumar <viresh.kumar@linaro.org>
>> CommitDate: Tue Jun 24 10:54:12 2014 +0530
>>
>>      clockevents: x86: add support for ONESHOT_STOPPED mode
>>
>>      Clockevent devices can be stopped from core (hrtimers/tick) when th=
ey aren't
>>      used anymore. This will mostly happen on a idle or tickless cpu. Th=
is is done to
>>      avoid getting spurious interrupts when core doesn't want to handle =
them anymore.
>>
>>      For stopping clockevent devices, core requests drivers to switch to=
 a special
>>      optional mode: CLOCK_EVT_MODE_ONESHOT_STOPPED. At this time platfor=
ms can also
>>      save some power by disabling these devices.
>>
>>      This patch adds support for handling CLOCK_EVT_MODE_ONESHOT_STOPPED=
 mode for x86
>>      drivers.
>>
>>      Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Hmm, I have made some changes and pushed stuff again, please see if it
> still breaks:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
> tick/oneshot-stopped

Changes fixes the issue.

Tested-by: Jet Chen <jet.chen@intel.com>

>
> Thanks.
>

--===============5326532857964863586==--

