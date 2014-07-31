Content-Type: multipart/mixed; boundary="===============2360302850566432521=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 16:56:27 +0800
Message-ID: <20140731085626.GA23367@aaronlu.sh.intel.com>
In-Reply-To: <20140731083330.GO19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2360302850566432521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 10:33:30AM +0200, Peter Zijlstra wrote:
> On Wed, Jul 30, 2014 at 10:14:25AM +0800, Aaron Lu wrote:
> > 118881 ~ 0%            +1.2%    120325 ~ 0% ivb42/hackbench/50%-threads=
-pipe
> =

> What kind of IVB is that EP or EX (or rather, how many sockets)? Also
> what arguments to hackbench do you use?
> =


2 sockets EP.

The cmdline is:
/usr/bin/hackbench -g 24 --threads --pipe -l 60000

Regards,
Aaron

--===============2360302850566432521==--

