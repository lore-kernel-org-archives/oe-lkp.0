Content-Type: multipart/mixed; boundary="===============0235860116531424078=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Thu, 22 Apr 2021 21:42:31 +0100
Message-ID: <87mttqt5jc.mognet@arm.com>
In-Reply-To: <87wnsutzi9.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0235860116531424078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22/04/21 10:55, Valentin Schneider wrote:
> I'll go find myself some other x86 box and dig into it;
> I'd rather not leave this hanging for too long.

So I found myself a dual-socket Xeon Gold 5120 @ 2.20GHz (64 CPUs) and
*there* I get a somewhat consistent ~-6% regression. As I'm suspecting
cacheline shenanigans, I also ran that with Peter's recent
kthread_is_per_cpu() change, and that brings it down to ~-3%

I'll leave it at here for today, but at least that's something I can work
with.
--===============0235860116531424078==--

