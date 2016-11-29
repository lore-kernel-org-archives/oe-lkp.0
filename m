Content-Type: multipart/mixed; boundary="===============4405590272022006776=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [rcu] a7410f28ce: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 25089 jiffies s: 9 root: 0x1/.
Date: Tue, 29 Nov 2016 09:18:27 +0100
Message-ID: <20161129081827.sxehpqxmmolagga2@linutronix.de>
In-Reply-To: <20161128173457.GJ2501@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4405590272022006776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2016-11-29 01:34:57 [+0800], Ye Xiaolong wrote:
> Thanks for the explanation, we'll ignore this kind of reports. And sorry =
for
> the noise.

This is "special" because my patch enabled the "expedited" RCU on its
own. This kind of report against a network driver (for instance) would
probably mean a problem in the patch itself.

> Thanks,
> Xiaolong

Sebastian

--===============4405590272022006776==--

