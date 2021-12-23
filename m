Content-Type: multipart/mixed; boundary="===============5368306388804432572=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sysctl] 0874c1fba8: sysctl_duplicate_entry
Date: Thu, 23 Dec 2021 09:24:33 -0800
Message-ID: <YcSw0TfbfhLoZOZS@bombadil.infradead.org>
In-Reply-To: <20211223080746.GA9252@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5368306388804432572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 04:07:48PM +0800, Carel Si wrote:
> Hi Luis,
> =

> On Thu, Dec 09, 2021 at 02:47:26PM -0800, Luis Chamberlain wrote:
> > On Thu, Dec 09, 2021 at 10:03:24PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 0874c1fba8287710354dfc35b2acf23ce3fec018 ("sysctl: add and us=
e base directory declarer and registration helper")
> > > https://github.com/hying-caritas/linux.git mmotm-2021-11-29
> > =

> > There were some issues with early incarnations of the patch series.
> > Can you try today's linux-next and try to reproduce?
> =

> We tested linux-next, no such issue on next-20211222 and 5ca6bbf990 =

> ("sysctl-add-and-use-base-directory-declarer-and-registration-helper-fix"=
), thanks.

Thanks for the confirmation!

  Luis
--===============5368306388804432572==--

