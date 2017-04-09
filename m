Content-Type: multipart/mixed; boundary="===============5290676274433174750=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Sun, 09 Apr 2017 13:21:44 -0500
Message-ID: <87shlhv3uv.fsf@xmission.com>
In-Reply-To: <20170407154047.GB384@tigerII.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============5290676274433174750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky <sergey.senozhatsky@gmail.com> writes:

> On (04/07/17 17:23), Peter Zijlstra wrote:
> [..]
>> > we are looking at different typical setups :) serial console being 45
>> > seconds behind logbuf does not surprise me anymore.
>> =

>> That does sound like you're doing something wrong and should look at
>> reducing printk() more than anything else.
>
> yeah, 45sec is an extreme case that simply doesn't surprise me anymore ;)
> that's not a normal/usual delay, of course, we are not this mad. on avera=
ge
> it's much better and may be not so far 2 seconds after all. a massive OOM
> report, of course, appends logbuf messages at a much higher rate than UART
> serial console can swallow, so the delay is getting larger, expectedly.
> and, no, I don't add any printk-s, I'm looking at the lockup reports

Are you running your serial consoles at 9600 baud?

I would think the first thing to do would be to up your serial console
baud rate to 115200 or at least 38400.

Similarly anything the kernel is certain to survive I would set loglevel
such that it is logging somewhere with syslog rather than printk.

Of course my expectation on a production machine is to have panic on oom
set, to print the huge OOM message and then reboot.  So I don't possibly
see how offloading to another thread and then switching right back to
emergency mode is at all practical to solve the delay for a serious
situation like OOM.

It sounds like you are blaming printk when the problem is a very slow
logging device.

Eric

--===============5290676274433174750==--

