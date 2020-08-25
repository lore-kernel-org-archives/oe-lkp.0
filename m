Content-Type: multipart/mixed; boundary="===============5660392939138535279=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Tue, 25 Aug 2020 16:44:37 +0000
Message-ID: <b704f3c6298f46abbc59105ec0d52d14@intel.com>
In-Reply-To: <20200825062305.GA83850@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5660392939138535279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> These 2 variables are accessed in 2 hot call stacks (for this 288 CPU
> Xeon Phi platform):

This might be the key element of "weirdness" for this system. It
has 288 CPUs ... cache alignment problems are often not too bad
on "small" systems. The as you scale up to bigger machines you
suddenly hit some critical point and performance drops dramatically.

It's good that you are picking up tips on how to bisect these and diagnose
the underlying problem. Number of cores is going to keep increasing, so
we will keep finding new issues like this.

-Tony
--===============5660392939138535279==--

