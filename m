Content-Type: multipart/mixed; boundary="===============3909032699525015868=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/pelt] e906550aca: WARNING:at_kernel/sched/fair.c:#update_blocked_averages
Date: Thu, 03 Jun 2021 12:50:36 +0200
Message-ID: <56316b95-3ec5-74e6-a4f7-d91aea022abe@arm.com>
In-Reply-To: <20210602064526.GB9872@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3909032699525015868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/06/2021 08:45, kernel test robot wrote:

[...]

> kern :warn : [   40.989618] WARNING: CPU: 2 PID: 253 at kernel/sched/fair=
.c:8029 update_blocked_averages (kbuild/src/consumer/kernel/sched/fair.c:80=
29 kbuild/src/consumer/kernel/sched/fair.c:8065 kbuild/src/consumer/kernel/=
sched/fair.c:8152) =


Hit something like this on my Ubuntu i7-7567U as well.

With more debugging:

[    7.388006] WARNING: CPU: 1 PID: 926 at kernel/sched/fair.c:8029 update_=
blocked_averages+0x30d/0x7e0
...
[    7.388167] path=3D/autogroup-2 load_avg=3D1 util_avg=3D0 runnable_avg=
=3D1

IMHO, this is because this patch needs:

(1) sched/pelt: ensure that *_sum is always synced with *_avg (2021-06-03 V=
incent Guittot)

https://lkml.kernel.org/r/20210601085832.12626-1-vincent.guittot(a)linaro.o=
rg

(2) sched/fair: Keep load_avg and load_sum synced (2021-06-03 Vincent Guitt=
ot)

tip/sched/urgent 7c7ad626d9a0

Using both patches underneath makes this warning go away.

--===============3909032699525015868==--

