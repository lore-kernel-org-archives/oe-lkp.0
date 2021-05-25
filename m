Content-Type: multipart/mixed; boundary="===============3817274977442519054=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 69bc1b14c3: netperf.Throughput_Mbps -36.9% regression
Date: Tue, 25 May 2021 17:16:26 -0400
Message-ID: <YK1pKv4Gna2EEFSd@redhat.com>
In-Reply-To: <49d2cb2c-8a6f-f8a5-af07-b9be2d59f73e@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3817274977442519054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:46:54AM +0800, Xing, Zhengjun wrote:
> The command we used :
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netperf -4 -H 127.0.0.1 -t TC=
P_SENDFILE -c -C -l 300 -- -m 5K=C2=A0 &
> =

>  =C2=A0It runs 300 s, but your test case only runs 10 s, I think you can =
try =

> to test more long time.

I don't know what was going on and why I couldn't reproduce. Later I
managed to reproduce something erratic with stress-ng sockabuse, I
didn't manage to reproduce with netperf but I'm hopeful it's the same
thing that regresses various workloads on the same large CPU systems.

Anyway I should have fixed it, if you can test the new version I'd be
interested.

Also I switched the default HEAD branch to main, I hope that won't
confuse your automation that may have been attached to "master".

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?id=3D=
1a49bc1fe57152d27743effc64c0e2899939793d

With an Intel 112 threads, 28 cores per socket and 2 sockets (2 NUMA
nodes) this gave me a 17% boost in sockabuse ops/sec.

--===============3817274977442519054==--

