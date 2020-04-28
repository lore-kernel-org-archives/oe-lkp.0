Content-Type: multipart/mixed; boundary="===============8673616824025362871=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm] b79980a586: WARNING:at_kernel/locking/lockdep.c:#__lock_acquire
Date: Tue, 28 Apr 2020 04:07:17 -0700
Message-ID: <20200428110717.GI29705@bombadil.infradead.org>
In-Reply-To: <20200428085431.GE5770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8673616824025362871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 04:54:31PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b79980a586f5a910ee92b360e55e2aabf33981ff ("mm: Move pt_mm within =
struct page")
> git://git.infradead.org/users/willy/linux-dax.git pt_mm

Yup, fixed it last night.  Thanks!  Please retest f84e7ad725bf (the current
head of the pt_mm branch)


--===============8673616824025362871==--

