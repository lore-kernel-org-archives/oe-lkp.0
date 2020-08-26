Content-Type: multipart/mixed; boundary="===============1503207127978524953=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Wed, 26 Aug 2020 09:45:58 +0800
Message-ID: <20200826014558.GC83850@shbuild999.sh.intel.com>
In-Reply-To: <b704f3c6298f46abbc59105ec0d52d14@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1503207127978524953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 12:44:37AM +0800, Luck, Tony wrote:
> > These 2 variables are accessed in 2 hot call stacks (for this 288 CPU
> > Xeon Phi platform):
> =

> This might be the key element of "weirdness" for this system. It
> has 288 CPUs ... cache alignment problems are often not too bad
> on "small" systems. The as you scale up to bigger machines you
> suddenly hit some critical point and performance drops dramatically.
> =

> It's good that you are picking up tips on how to bisect these and diagnose
> the underlying problem. Number of cores is going to keep increasing, so
> we will keep finding new issues like this.

Yes, now we have one more bullet for shooting this kind of strange
performance changes :)

Thanks,
Feng

> -Tony
--===============1503207127978524953==--

