Content-Type: multipart/mixed; boundary="===============6892017802586659733=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs] 7e84dfbf1b: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 23 Dec 2021 09:24:49 -0800
Message-ID: <YcSw4S2Xwgkts3Bx@bombadil.infradead.org>
In-Reply-To: <20211223072747.GA9125@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6892017802586659733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 03:27:49PM +0800, Carel Si wrote:
> Hi Luis,
> =

> On Thu, Dec 09, 2021 at 02:48:01PM -0800, Luis Chamberlain wrote:
> > On Thu, Dec 09, 2021 at 10:20:17PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with clang-14):
> > > =

> > > commit: 7e84dfbf1b7e4bef111ce5db72b4cc7421bd2a9d ("fs: move namespace=
 sysctls and declare fs base directory")
> > > https://github.com/hying-caritas/linux.git mmotm-2021-11-29
> > =

> > Likewise, there were some issues with earlier incarnations of the
> > patch series which were fixed later, can you try to reproduce with
> > the latest linux-next?
> =

> We tested the latest linux-next and your patch in linux-next, no such iss=
ue, thanks.

Thanks for the confirmation!

  Luis
--===============6892017802586659733==--

