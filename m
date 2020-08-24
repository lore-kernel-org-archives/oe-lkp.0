Content-Type: multipart/mixed; boundary="===============2712550200552405842=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 24 Aug 2020 23:48:18 +0800
Message-ID: <20200824154818.GB56944@shbuild999.sh.intel.com>
In-Reply-To: <6e996ad05e434a6fb13f069ee72b876b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2712550200552405842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 11:38:53PM +0800, Luck, Tony wrote:
> > Yes, that's what we suspected. And I just did another try to force the
> > percpu mce structure aligned. And the regression seems to be gone (redu=
ced
> > from 14.1% to 2%), which further proved it.
> =

> I wonder whether it would be useful for bisection of performance issues
> for you to change the global definition of DEFINE_PER_CPU() to make
> all per CPU definitions aligned. Just like you switch compiler flags to m=
ake
> all functions aligned.

Thanks for the hint! This will definitely help tracking strange performance
changes like this, as a general debug mthod.

Thanks,
Feng

> =

> -Tony
--===============2712550200552405842==--

